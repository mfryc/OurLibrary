DROP USER IF EXISTS 'ourlibrary'@'localhost';
CREATE USER IF NOT EXISTS 'ourlibrary'@'localhost' IDENTIFIED WITH mysql_native_password BY 'ourlibrary';
GRANT ALL PRIVILEGES ON *.* TO 'ourlibrary'@'localhost';

DROP DATABASE IF EXISTS `our_library`;

CREATE DATABASE IF NOT EXISTS `our_library` DEFAULT CHARACTER SET utf8 COLLATE utf8_polish_ci;
USE `our_library`;

DROP TABLE IF EXISTS `book`;

CREATE TABLE `book` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `authors` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `edition` varchar(50) NOT NULL,
  `publisher` varchar(50) NOT NULL,
  `publication_year` int(4) NOT NULL,
  `number_of_pages` int(5) NOT NULL,
  `binding` char(6) NOT NULL,
  `isbn` bigint(13) NOT NULL,
  `language` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1;

INSERT INTO `book` VALUES 
	(1, 'Leonid Kurmaz', 'Projektowanie węzłów i części maszyn', 'Wydanie 3 poprawione i uzupełnione', 'Wydawnictwo | Politechnika Świętokrzyska', 2006, 416, 'miękka', 8388906518, 'polski'),
    (2, 'Cay S. Horstmann', 'Java. podstawy', 'Wydanie 11', 'Helion', 2020, 767, 'twarda', 9788328357785, 'polski'),
    (3, 'Viktor Farcic, Alex Garcia', 'TDD. Programowanie w Javie sterowane testami', 'Wydanie 1', 'Helion', 2016, 256, 'miękka', 9788328323414, 'polski'),
    (4, 'Marcin Lis', 'MySQL. Darmowa baza danych. Ćwiczenia praktyczne', 'Wydanie 2', 'Helion', 2013, 212, 'miękka', 9788324668571, 'polski'),
    (5, 'Craig Walls', 'Spring w akcji', 'Wydanie 5', 'Helion', 2019, 520, 'miękka', 9788328356078, 'polski');