import pymysql.cursors
import pandas as pd
import validators
import requests
from flask import Flask, render_template, request, redirect, url_for, flash, session
import bcrypt
from flaskext.mysql import MySQL
import pymysql
import jinja2

urls_data = pd.read_csv("сайт2.csv")

loader = jinja2.FileSystemLoader('templates')
app = Flask(__name__, template_folder='template')

@app.route("/")
def man():
    return render_template("home.html")

@app.route("/phishing")
def blacklist():
    return render_template("phishing.html")

@app.route("/predict", methods=["POST"])
def predict():
    from main2 import vectorizer
    from main2 import logit
    x_predict2 = [x for x in request.form.values()]
    x_predict2 = vectorizer.transform(x_predict2)
    new_predict2 = logit.predict(x_predict2)

    pred = new_predict2[0]
    if pred == 1:
        return render_template("home.html", res="This site is secure!")
    else:
        return render_template("home.html", res="This site is dangerous!")


#______________________________________________________________________________________________________________________________________________


app.secret_key = "Cairocoders-Ednalan"

mysql = MySQL()

# MySQL configurations
app.config['MYSQL_DATABASE_USER'] = 'root'
app.config['MYSQL_DATABASE_PASSWORD'] = ''
app.config['MYSQL_DATABASE_DB'] = 'table'
app.config['MYSQL_DATABASE_HOST'] = 'localhost'
mysql.init_app(app)


@app.route('/newblack')
def Index():
    conn = mysql.connect()
    cur = conn.cursor(pymysql.cursors.DictCursor)

    cur.execute('SELECT * FROM blacklist')
    data = cur.fetchall()

    cur.close()
    return render_template('newblack.html', employee=data)


@app.route('/add_contact', methods=['POST'])
def add_employee():
    conn = mysql.connect()
    cur = conn.cursor(pymysql.cursors.DictCursor)
    if request.method == 'POST':
        website = request.form['website']
        brief_information = request.form['brief_information']
        email = request.form['email']
       
        #проверяем сайт на безопасность
        def check(url):
            from main2 import vectorizer
            from main2 import logit
            x_predict2 = [url]
            x_predict2 = vectorizer.transform(x_predict2)
            new_predict2 = logit.predict(x_predict2)
            pred = new_predict2[0]
            return pred

        #проверка электронной почты
        response = requests.get(
        "https://isitarealemail.com/api/email/validate",
        params = {'email': email})
        status = response.json()['status']

        row = cur.execute("select * from registration where email = %s", email)

        censor = ["fuck", "shit", "crap", "bitch", "damn", "douchebag", "faggot", "gay", "ass", "dick", "pussy", "cum", "cunt", "cock", "beaver"]
        if email == '' or website == '' or brief_information == '':
            flash('All fields required!')
            return redirect(url_for('Index'))

        # проверка на существование сайта
        elif not validators.url(website):
            flash('Please, enter a valid url!')
            return redirect(url_for('Index'))

        elif status == 'invalid':
            flash('Please, enter a valid email!')
            return redirect(url_for('Index'))

        # проверка на цензуру
        elif brief_information != '':
            for el in censor:
                if el in brief_information.lower():
                    flash('Be polite!')
                    return redirect(url_for('Index'))

        elif row == 0:
            flash('Please, register first!')
            return redirect(url_for('Index'))

        elif check(website) == 1:
            flash('This site seems to be secure!')
            return redirect(url_for('Index'))
            
        else:
            cur.execute("INSERT INTO blacklist (website, email, brief_information) VALUES (%s,%s,%s)", (website, email, brief_information))
            conn.commit()
            flash('Website Added successfully')
            return redirect(url_for('Index'))

@app.route('/update/<id>', methods=['POST'])
def update_employee(id):
    if request.method == 'POST':
        fullname = request.form['website']
        phone = request.form['brief_information']
        email = request.form['email']
        conn = mysql.connect()
        cur = conn.cursor(pymysql.cursors.DictCursor)
        cur.execute("""
            UPDATE employee
            SET website = %s,
                email = %s,
                brief_information = %s
            WHERE id = %s
        """, (fullname, email, phone, id))
        flash('Employee Updated Successfully')
        conn.commit()
        return redirect(url_for('Index'))

#_______________________________________________________________________________________________________________________________________

#app.py

@app.route('/')
def home():
    return render_template("home_reg.html")

@app.route('/login',methods=["GET","POST"])
def login():
    if request.method == 'POST':
        email = request.form['email']
        password = request.form['password'].encode('utf-8')
        conn = mysql.connect()
        curl = conn.cursor(pymysql.cursors.DictCursor)
        curl.execute("SELECT * FROM registration WHERE email=%s",(email,))
        user = curl.fetchone()
        curl.close()

        if user is None or len(user) == 0:
            return "Error user not found"
        elif len(user) > 0:
            if bcrypt.hashpw(password, user["password"].encode('utf-8')) == user["password"].encode('utf-8'):
                session['username'] = user['username']
                session['email'] = user['email']
                return render_template("home_reg.html")
            else:
                return "Error password and email not match"
    else:
        return render_template("login.html")

@app.route('/logout', methods=["GET", "POST"])
def logout():
    session.clear()
    return render_template("home_reg.html")

@app.route('/register', methods=["GET", "POST"])
def register():
    if request.method == 'GET':
        return render_template("register.html")
    else:
        username = request.form['username']
        email = request.form['email']
        password = request.form['password'].encode('utf-8')
        hash_password = bcrypt.hashpw(password, bcrypt.gensalt())

        cur = mysql.connect()
        cur1 = cur.cursor(pymysql.cursors.DictCursor)
        cur1.execute("INSERT INTO registration (username, email, password) VALUES (%s,%s,%s)",(username,email,hash_password,))
        cur.commit()
        session['username'] = request.form['username']
        session['email'] = request.form['email']
        return redirect(url_for('home'))
#________________________________________________________________________________________________________________________________________

  
@app.route('/raiting')
def raiting():
    try:
        conn = mysql.connect()
        cursor = conn.cursor(pymysql.cursors.DictCursor)
        cursor.execute("SELECT MAX(website) AS website, COUNT(website) AS number_of_requests FROM blacklist GROUP BY (website) ORDER BY (number_of_requests) DESC LIMIT 10")
        userslist = cursor.fetchall()
        return render_template('index.html',userslist=userslist)
    except Exception as e:
        print(e)
    finally:
        cursor.close() 
        conn.close()

if __name__ == "__main__":
    app.run(debug=True)