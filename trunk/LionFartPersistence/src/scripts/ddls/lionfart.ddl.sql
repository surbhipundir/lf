CREATE USER 'lionfart'@'localhost' IDENTIFIED BY 'lionfart';
GRANT ALL PRIVILEGES ON * . * TO 'lionfart'@'localhost';
FLUSH PRIVILEGES;

create database lionfart;

use lionfart;


CREATE TABLE `user` (
  `user_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(70) NOT NULL,
  `password` varchar(64) NOT NULL,
  `email` varchar(100) NOT NULL,
  `first_name` varchar(70) NOT NULL,
  `last_name` varchar(70) NOT NULL,
  `createdBy` varchar(45) DEFAULT NULL,
  `createdTime` timestamp NULL DEFAULT NULL,
  `modifiedBy` varchar(45) DEFAULT NULL,
  `modifiedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;





CREATE TABLE `role` (
  `role_id` int(10) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(70) NOT NULL,
  `createdBy` varchar(45) DEFAULT NULL,
  `createdTime` timestamp NULL DEFAULT NULL,
  `modifiedBy` varchar(45) DEFAULT NULL,
  `modifiedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;





CREATE TABLE `user_role` (
  `user_role_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `role_id` int(10) NOT NULL,
  `createdBy` varchar(45) DEFAULT NULL,
  `createdTime` timestamp NULL DEFAULT NULL,
  `modifiedBy` varchar(45) DEFAULT NULL,
  `modifiedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_role_id`),
  CONSTRAINT `user_role_role_id` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `user_role_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;
