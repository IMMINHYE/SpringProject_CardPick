CREATE TABLE `auth` (
  `userid` varchar(50) NOT NULL,
  `auth` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`userid`),
  KEY `authorities_FK` (`userid`),
  CONSTRAINT `authorities_FK` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `users` (
  `userid` varchar(50) NOT NULL,
  `userpass` varchar(100) NOT NULL,
  `username` varchar(30) NOT NULL,
  `userphone` varchar(30) DEFAULT NULL,
  `useremail` varchar(100) DEFAULT NULL,
  `useraddr1` varchar(20) DEFAULT NULL,
  `useraddr2` varchar(50) DEFAULT NULL,
  `useraddr3` varchar(50) DEFAULT NULL,
  `regdate` date DEFAULT NULL,
  `profile` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ;

CREATE TABLE `company` (
  `company_name` varchar(50) NOT NULL,
  `company_code` varchar(30) NOT NULL,
  PRIMARY KEY (`company_code`)
);

CREATE TABLE `anual_fee` (
  `anual_fee` varchar(50) NOT NULL,
  `anual_fee_code` varchar(30)NOT NULL,
  `anual_fee_codeRef` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`anual_fee_code`)
);

CREATE TABLE `card` (
  `card_id` int(11) NOT NULL AUTO_INCREMENT,
  `card_name` varchar(200) NOT NULL,
  `card_company` varchar(200) NOT NULL,
  `card_anual_fee` varchar(2000) NOT NULL,
  `card_achievement` varchar(2000) NOT NULL,
  `card_benefit` varchar(2000) NOT NULL,
  `card_url` varchar(2000) NOT NULL,
  `card_img` varchar(200) DEFAULT NULL,
  `card_pages` varchar(50) NOT NULL,
  `company_code` varchar(30) NOT NULL,
  `anual_fee_code` varchar(30) NOT NULL,
  PRIMARY KEY (`card_id`),
  KEY `CARD_COMPANY_FK` (`company_code`),
  CONSTRAINT `CARD_COMPANY_FK` FOREIGN KEY (`company_code`) REFERENCES `company` (`company_code`),
  KEY `CARD_ANUAL_FEE_FK` (`anual_fee_code`),
  CONSTRAINT `CARD_ANUAL_FEE_FK` FOREIGN KEY (`anual_fee_code`) REFERENCES `anual_fee` (`anual_fee_code`)
);

CREATE TABLE `fav` (
  `fav_id` int(11) NOT NULL AUTO_INCREMENT,
  `card_id` int(11) NOT NULL,
  `userid` varchar(50)  NOT NULL,
  PRIMARY KEY (`fav_id`),
  UNIQUE KEY `userid` (`userid`,`card_id`),
  KEY `fav_fk_idx` (`card_id`),
  CONSTRAINT `fav_fk` FOREIGN KEY (`card_id`) REFERENCES `card` (`card_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE `review` (
  `review_id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(500) DEFAULT NULL,
  `regdate` datetime DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `profile` varchar(45) DEFAULT NULL,
  `userid` varchar(50) NOT NULL,
  `card_id` int(11) NOT NULL,
  PRIMARY KEY (`review_id`),
  UNIQUE KEY `userid` (`userid`,`card_id`),
  KEY `review_FK_idx` (`card_id`),
  KEY `review_FK2` (`userid`),
  CONSTRAINT `review_FK` FOREIGN KEY (`card_id`) REFERENCES `card` (`card_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `review_FK2` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`)
);

SHOW TABLES;