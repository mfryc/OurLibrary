DROP USER IF EXISTS 'ourlibrary'@'localhost';
CREATE USER IF NOT EXISTS 'ourlibrary'@'localhost' IDENTIFIED WITH mysql_native_password BY 'ourlibrary';
GRANT ALL PRIVILEGES ON *.* TO 'ourlibrary'@'localhost';

DROP DATABASE IF EXISTS `our_library_security`;

CREATE DATABASE IF NOT EXISTS `our_library_security` DEFAULT CHARACTER SET utf8 COLLATE utf8_polish_ci;
USE `our_library_security`;
    
DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `username` varchar(50) NOT NULL,
  `password` char(68) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `users` VALUES
	('user', '{bcrypt}$2a$10$7VLPzgDZz.ypD.Ss4f/NaOYu6jvdL/xy1W0/OGdQw4kfJrWN2u0Tq', 1),
    ('librarian', '{bcrypt}$2a$10$jnjqyUX3o/rRIXCM7sT.nuJFUSju/nGQ4KYsFlDItqayq4U1.zqd.', 1),
    ('admin', '{bcrypt}$2a$10$7BOhIHL0WkbMAaItwAXiPuhPBIAcFx0zqD7MpypKFkYaZeAnOYxou', 1);
    
DROP TABLE IF EXISTS `authorities`;

CREATE TABLE `authorities` (
  `username` varchar(50) NOT NULL,
  `authority` varchar(50) NOT NULL,
  UNIQUE KEY `authorities_idx_1` (`username`,`authority`),
  CONSTRAINT `authorities_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `authorities` VALUES 
	('user','ROLE_USER'),
	('librarian','ROLE_USER'),
	('librarian','ROLE_LIBRARIAN'),
	('admin','ROLE_USER'),
	('admin','ROLE_ADMIN');