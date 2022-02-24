-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Фев 20 2022 г., 20:25
-- Версия сервера: 10.4.22-MariaDB
-- Версия PHP: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `table`
--

-- --------------------------------------------------------

--
-- Структура таблицы `blacklist`
--

CREATE TABLE `blacklist` (
  `id` int(11) NOT NULL,
  `number_of_requests` int(255) NOT NULL,
  `website` varchar(60) NOT NULL,
  `brief_information` text NOT NULL,
  `email` varchar(50) NOT NULL,
  `your_name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `blacklist`
--

INSERT INTO `blacklist` (`id`, `number_of_requests`, `website`, `brief_information`, `email`, `your_name`) VALUES
(2, 6, 'https://yandex.ru/', 'rrrrrrr', 'dfgaegr@thy.hhg', 'Asrf Xse'),
(3, 5, 'https://yandex.ru/', 'lksueif', 'info@yandex.com', 'Lan Fgdj'),
(4, 6, 'https://yandex.ru/', 'isekvvdv', 'hdhdj@gmail.com', 'Kaf Fah'),
(7, 34, 'https://yandex.ru/', 'erfghj', 'erfghj@bj.ty', 'Lgh Vbun'),
(9, 65, 'https://yandex.ru/', 'scvbn', 'dfgh@hjkg.tr', 'Lhj Adfgh'),
(10, 83, 'https://qna.habr.com/q/660590', 'bsjhvsdy', 'usgcv@yandex.ru', 'Johs Fhaa'),
(11, 7, 'https://qna.habr.com/q/660590', ',jhxvvs', 'hgshg@yandex.com', 'Gfag Gajaj'),
(31, 76, 'https://wm-school.ru/php/php_mysql_select_limit.php', 'hghfac', 'hfgfa@gmail.com', 'Jha Ghga'),
(32, 73, 'https://wm-school.ru/php/php_mysql_select_limit.php', 'jgdgd dhg dhg', 'jgasx@yandex.ru', 'Ihsv Afva'),
(33, 34, 'https://javascript.ru/String/replace', 'ha sgfca gfa afadsga afshfahfshafs ahfshafsha ahfahfahfah', 'hahfx@yandex.ru', 'Dhaf Khva'),
(34, 761, 'https://javascript.ru/String/replace', 'ytacjyatcjyctajycajyajyacjycajyacjyctajycajyaaj aycajytcajytca aytcajytcajytcajycaajytcayta aytcajytca aycasduyskuyud diudliduub diudiuydvudvd dyuv dhdkjswuyef fluxtywjsk ckiydfkuwvduy', 'dfbfda@gmail.com', 'Sdavd Jkahs'),
(35, 91, 'https://javascript.ru/String/replace', 'jha ahga ahahfa', 'hfafa@gmail.com', 'Gfaa Ghjjga'),
(36, 46, 'https://wm-school.ru/php/php_mysql_select_limit.php', 'hvahv ', 'jfac@gmail.com', 'Hhac Ojha'),
(37, 9, 'https://wm-school.ru/php/php_mysql_select_limit.php', 'utfw fgd nbvs gd gsf dhgs', 'hfahfcahgahfshfshfshfs@gmail.com', 'Fgahgajja Dgfgfagha'),
(38, 9, 'https://wm-school.ru/php/php_mysql_select_limit.php', 'gs hmhgs ghshg s ghk', 'hfa@yandex.com', 'Jgvac Ghga'),
(39, 52, 'https://developer.mozilla.org/ru/docs/Web/JavaScript/Referen', 'uuqc sgugvs gshgs', 'jjgafs@gmail.com', 'Ggjga Gjja'),
(40, 72, 'https://wm-school.ru/js/string_replace.php', 'jgs hgs sh shsjga ja hjd', 'ivsgc@yandex.ru', 'Igva Fghguycac'),
(41, 87, 'https://us04web.zoom.us/postattendee?mn=GhlHyUpv7AVDivgHuI8a', 'utckauca', 'jyc@yandex.ru', 'Ghgc Fyca'),
(42, 0, 'https://us04web.zoom.us/postattendee?mn=GhlHyUpv7AVDivgHuI8a', 'kygtckyxh', 'jyfa@gmail.com', 'Gja Ghga'),
(51, 0, 'https://qna.habr.com/q/660590', 'kuwkuctxkuc', 'alexpushkins@yandex.ru', ''),
(52, 0, 'https://yandex.ru/', 'kuwkuctxkuc', 'alex@gmail.com', ''),
(53, 0, 'http://www.innvb.ru', 'Dangerous.', 'alexpushkins@yandex.ru', '');

--
-- Триггеры `blacklist`
--
DELIMITER $$
CREATE TRIGGER `follow` AFTER INSERT ON `blacklist` FOR EACH ROW BEGIN
	INSERT INTO raiting SET
    website = new.website;
END
$$
DELIMITER ;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `blacklist`
--
ALTER TABLE `blacklist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `blacklist`
--
ALTER TABLE `blacklist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
