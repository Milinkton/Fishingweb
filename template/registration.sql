-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Фев 20 2022 г., 20:26
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
-- Структура таблицы `registration`
--

CREATE TABLE `registration` (
  `id` int(11) NOT NULL,
  `username` varchar(15) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `registration`
--

INSERT INTO `registration` (`id`, `username`, `email`, `password`) VALUES
(5, 'Alex', 'alexpushkins@yandex.ru', '$2b$12$beuTUJf4hu0aZvEPlX/L4.7iSCpbKxDepWdnMpmIkjPrN30TLV66.'),
(6, 'Lap', '1315680@mail.ru', '$2b$12$rkK/hDQhLp5HOEmigLXNh.GOpbazUr43wiDoeKndKiW5sz8ZBCGAq'),
(7, 'Sasha', 'lapshaaa@yandex.ru', '$2b$12$klvhkX30/C9W7UlF7HEwz.RbjnOz7D.49LvmlK88bbfrIo4Ral4hW'),
(12, 'Sam', 'alexpushkins@yandex.ru', '$2b$12$sXpKUevD3evc6OS1AiqiBuA7Z5kVsL7ltaP1Dpn6qLDS/bH2dhO16'),
(14, 'Nastya', 'lapshaaa@yandex.ru', '$2b$12$sl5GRfmGf4PJvyTAh4gwIOXTe4KWVzi3NWobV.Q12.9fD0rBd.dS.'),
(15, 'Alexey', 'alexpushkins@yandex.ru', '$2b$12$jWs4/9Dg.IYGzC9Y38Y/Beysfup1f.f43SJaH/8eRZt1Pf2gb72Xi');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `registration`
--
ALTER TABLE `registration`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `registration`
--
ALTER TABLE `registration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
