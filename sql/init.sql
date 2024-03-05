-- Table: `account`
CREATE TABLE `account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `surname` varchar(50) DEFAULT NULL,
  `username` varchar(32) DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL,
  `email` varchar(320) DEFAULT NULL,
  `city` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  KEY `city` (`city`),
  CONSTRAINT `account_ibfk_1` FOREIGN KEY (`city`) REFERENCES `cities` (`id`)
)

-- Table: `actors`
CREATE TABLE `actors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `surname` varchar(50) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `nationality` varchar(50) DEFAULT NULL,
  `image` varchar(2048) DEFAULT NULL,
  PRIMARY KEY (`id`)
)

-- Table: `actors_movies`
CREATE TABLE `actors_movies` (
  `actor_id` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL,
  PRIMARY KEY (`actor_id`,`movie_id`),
  KEY `movie_id` (`movie_id`),
  CONSTRAINT `actors_movies_ibfk_1` FOREIGN KEY (`actor_id`) REFERENCES `actors` (`id`),
  CONSTRAINT `actors_movies_ibfk_2` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`),
  CONSTRAINT `actors_movies_ibfk_3` FOREIGN KEY (`actor_id`) REFERENCES `actors` (`id`)
)

-- Table: `cities`
CREATE TABLE `cities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
)

-- Table: `directors`
CREATE TABLE `directors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `surname` varchar(50) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `nationality` varchar(50) DEFAULT NULL,
  `photo` varchar(2048) DEFAULT NULL,
  PRIMARY KEY (`id`)
)

-- Table: `genre`
CREATE TABLE `genre` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
)

-- Table: `languages`
CREATE TABLE `languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
)

-- Table: `languages_movies`
CREATE TABLE `languages_movies` (
  `movie_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  PRIMARY KEY (`movie_id`,`language_id`),
  KEY `language_id` (`language_id`),
  CONSTRAINT `languages_movies_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`),
  CONSTRAINT `languages_movies_ibfk_2` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`)
)
-- Table: `movies`
CREATE TABLE `movies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `release_date` date DEFAULT NULL,
  `original_language` int(11) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `director` int(11) DEFAULT NULL,
  `genre` int(11) NOT NULL,
  `poster` varchar(2048) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `original_language` (`original_language`),
  KEY `genre` (`genre`),
  KEY `director` (`director`),
  CONSTRAINT `movies_ibfk_1` FOREIGN KEY (`original_language`) REFERENCES `languages` (`id`),
  CONSTRAINT `movies_ibfk_2` FOREIGN KEY (`genre`) REFERENCES `genre` (`id`),
  CONSTRAINT `movies_ibfk_3` FOREIGN KEY (`director`) REFERENCES `directors` (`id`)
)

-- Table: `projections`
CREATE TABLE `projections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `movie_id` int(11) DEFAULT NULL,
  `theater_id` int(11) DEFAULT NULL,
  `earnings` double DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `movie_id` (`movie_id`),
  KEY `theater_id` (`theater_id`),
  CONSTRAINT `projections_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`),
  CONSTRAINT `projections_ibfk_2` FOREIGN KEY (`theater_id`) REFERENCES `theater` (`id`)
)

-- Table: `review`
CREATE TABLE `review` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rating` int(11) DEFAULT NULL CHECK (`rating` between 1 and 5),
  `movie_id` int(11) DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `movie_id` (`movie_id`),
  KEY `username` (`username`),
  FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`),
  FOREIGN KEY (`username`) REFERENCES `account` (`id`)
)

-- Table: `studios`
CREATE TABLE `studios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
)

-- Table: `studios_movies`
CREATE TABLE `studios_movies` (
  `movie_id` int(11) NOT NULL,
  `studio_id` int(11) NOT NULL,
  PRIMARY KEY (`movie_id`,`studio_id`),
  KEY `studio_id` (`studio_id`),
  FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`),
  FOREIGN KEY (`studio_id`) REFERENCES `studios` (`id`)
)

-- Table: `theater`
CREATE TABLE `theater` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `seats` int(11) DEFAULT NULL,
  `city` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `city` (`city`),
  FOREIGN KEY (`city`) REFERENCES `cities` (`id`)
)
