SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


CREATE TABLE `blacklist` (
  `id` int(11) NOT NULL,
  `number_of_requests` int(255) NOT NULL,
  `website` varchar(60) NOT NULL,
  `brief_information` text NOT NULL,
  `email` varchar(50) NOT NULL,
  `your_name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DELIMITER $$
CREATE TRIGGER `follow` AFTER INSERT ON `blacklist` FOR EACH ROW BEGIN
	INSERT INTO raiting SET
    website = new.website;
END
$$
DELIMITER ;


ALTER TABLE `blacklist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);


--
ALTER TABLE `blacklist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;
COMMIT;

