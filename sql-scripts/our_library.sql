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
    
    
DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1;

INSERT INTO `roles` (name) VALUES
	('ROLE_USER'),
    ('ROLE_LIBRARIAN'),
    ('ROLE_ADMIN');
    
    
DROP TABLE IF EXISTS `users`;
    
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(68) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY(`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1;

INSERT INTO `users` VALUES
	(1, 'user', '$2a$10$7VLPzgDZz.ypD.Ss4f/NaOYu6jvdL/xy1W0/OGdQw4kfJrWN2u0Tq', 'Jan', 'Kowalski', 'jan@kowalski.pl', 1),
    (2, 'librarian', '$2a$10$jnjqyUX3o/rRIXCM7sT.nuJFUSju/nGQ4KYsFlDItqayq4U1.zqd.', 'Adam', 'Nowak', 'adam@nowak.pl', 1),
    (3, 'admin', '$2a$10$7BOhIHL0WkbMAaItwAXiPuhPBIAcFx0zqD7MpypKFkYaZeAnOYxou', 'Janusz', 'Wiśniewski', 'janusz@wisniewski.pl', 1);
    
    
DROP TABLE IF EXISTS `users_roles`;

CREATE TABLE `users_roles` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  
  KEY `FK_ROLE_idx` (`role_id`),
  
  CONSTRAINT `FK_USER_05` FOREIGN KEY (`user_id`) 
  REFERENCES `users` (`id`) 
  ON DELETE NO ACTION ON UPDATE NO ACTION,
  
  CONSTRAINT `FK_ROLE` FOREIGN KEY (`role_id`) 
  REFERENCES `roles` (`id`) 
  ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1;

SET FOREIGN_KEY_CHECKS = 1;

INSERT INTO `users_roles` VALUES
	(1, 1),
    (2, 1),
    (2, 2),
    (3, 1),
    (3, 2),
    (3, 3);