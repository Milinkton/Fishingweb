import pandas as pd

from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.linear_model import LogisticRegression
from sklearn.model_selection import train_test_split

urls_data = pd.read_csv("сайт2.csv")
type(urls_data)
urls_data.head()

def makeTokens(f):
    tkns_BySlash = str(f.encode("utf-8")).split("/")
    total_Tokens = []
    for i in tkns_BySlash:
        tokens = str(i).split("-")
        tkns_ByDot = []
        for j in range(0, len(tokens)):
            temt_Tokens = str(tokens[j]).split(".")
            tkns_ByDot = tkns_ByDot + temt_Tokens
        total_Tokens = total_Tokens + tokens + tkns_ByDot
    total_Tokens = list(set(total_Tokens))
    if "com" in total_Tokens:
        total_Tokens.remove('com')
    return total_Tokens

y = urls_data['фейк или нет']
url_list = urls_data['сайт']

vectorizer = TfidfVectorizer(tokenizer=makeTokens)
x = vectorizer.fit_transform(url_list)
x_train, x_test, y_train, y_test = train_test_split(x, y, test_size=0.2, random_state=42)
logit = LogisticRegression()
logit.fit(x_train, y_train)

