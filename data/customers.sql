-- Adminer 4.3.1 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP DATABASE IF EXISTS `customers`;
CREATE DATABASE `customers` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `customers`;

DROP TABLE IF EXISTS `customers`;
CREATE TABLE `customers` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `change_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `master_sip_id` varchar(10) NOT NULL,
  `vorname` varchar(255) NOT NULL,
  `nachname` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `customers` (`id`, `change_timestamp`, `master_sip_id`, `vorname`, `nachname`) VALUES
  (1,	'2017-09-14 14:06:23',	'1234501',	'Andy',	'Warhol'),
  (2,	'2017-09-14 14:06:23',	'1234502',	'Claude',	'Monet'),
  (3,	'2017-09-14 14:06:23',	'1234503',	'Franz',	'Marc'),
  (4,	'2017-09-14 14:06:23',	'1234504',	'Jack',	'Vettriano'),
  (5,	'2017-09-14 14:06:23',	'1234505',	'Leonardo',	'da Vinci'),
  (6,	'2017-09-14 14:06:23',	'1234506',	'Michelangelo',	'Buonarroti'),
  (7,	'2017-09-14 14:06:23',	'1234507',	'Pablo',	'Picasso'),
  (8,	'2017-09-14 14:06:23',	'1234508',	'Paul',	'Gauguin'),
  (9,	'2017-09-14 14:06:23',	'1234509',	'Rembrandt',	'Harmenszoon van Rjin'),
  (10,	'2017-09-14 14:06:23',	'1234510',	'Salvador',	'Dali Micros'),
  (11,	'2017-09-14 14:06:23',	'1234511',	'Vincent',	'van Gogh'),
  (12,	'2017-09-14 14:06:23',	'1234512',	'Wassily',	'Kandinsky');

-- 2017-09-14 14:07:30