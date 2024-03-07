CREATE DATABASE cinema;

CREATE TABLE `accounts` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `surname` varchar(50) DEFAULT NULL,
  `username` varchar(32) DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL,
  `email` varchar(320) DEFAULT NULL,
  `city` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `actors`
--

CREATE TABLE `actors` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `surname` varchar(50) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `nationality` varchar(50) DEFAULT NULL,
  `photo` varchar(2048) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `actors_movies`
--

CREATE TABLE `actors_movies` (
  `actor_id` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `directors`
--

CREATE TABLE `directors` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `surname` varchar(50) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `nationality` varchar(50) DEFAULT NULL,
  `photo` varchar(2048) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `genres`
--

CREATE TABLE `genres` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `genres_movies`
--

CREATE TABLE `genres_movies` (
  `genre_id` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `languages_movies`
--

CREATE TABLE `languages_movies` (
  `movie_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

CREATE TABLE `movies` (
  `id` int(11) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `release_date` date DEFAULT NULL,
  `original_language` int(11) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `director` int(11) DEFAULT NULL,
  `poster` varchar(2048) DEFAULT NULL,
  `length` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `projections`
--

CREATE TABLE `projections` (
  `id` int(11) NOT NULL,
  `movie_id` int(11) DEFAULT NULL,
  `theater_id` int(11) DEFAULT NULL,
  `earnings` double DEFAULT NULL,
  `start_time` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL,
  `rating` int(11) DEFAULT NULL CHECK (`rating` between 1 and 5),
  `movie_id` int(11) DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `content` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `studios`
--

CREATE TABLE `studios` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `studios_movies`
--

CREATE TABLE `studios_movies` (
  `movie_id` int(11) NOT NULL,
  `studio_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `theaters`
--

CREATE TABLE `theaters` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `seats` int(11) DEFAULT NULL,
  `city` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `city` (`city`);

--
-- Indexes for table `actors`
--
ALTER TABLE `actors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `actors_movies`
--
ALTER TABLE `actors_movies`
  ADD PRIMARY KEY (`actor_id`,`movie_id`),
  ADD KEY `movie_id` (`movie_id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `directors`
--
ALTER TABLE `directors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `genres`
--
ALTER TABLE `genres`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `genres_movies`
--
ALTER TABLE `genres_movies`
  ADD PRIMARY KEY (`genre_id`,`movie_id`),
  ADD KEY `movie_id` (`movie_id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages_movies`
--
ALTER TABLE `languages_movies`
  ADD PRIMARY KEY (`movie_id`,`language_id`),
  ADD KEY `language_id` (`language_id`);

--
-- Indexes for table `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `original_language` (`original_language`),
  ADD KEY `director` (`director`);

--
-- Indexes for table `projections`
--
ALTER TABLE `projections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `movie_id` (`movie_id`),
  ADD KEY `theater_id` (`theater_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `movie_id` (`movie_id`),
  ADD KEY `account_id` (`account_id`);

--
-- Indexes for table `studios`
--
ALTER TABLE `studios`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `studios_movies`
--
ALTER TABLE `studios_movies`
  ADD PRIMARY KEY (`movie_id`,`studio_id`),
  ADD KEY `studio_id` (`studio_id`);

--
-- Indexes for table `theaters`
--
ALTER TABLE `theaters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `city` (`city`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `actors`
--
ALTER TABLE `actors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `directors`
--
ALTER TABLE `directors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `genres`
--
ALTER TABLE `genres`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `movies`
--
ALTER TABLE `movies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `projections`
--
ALTER TABLE `projections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `studios`
--
ALTER TABLE `studios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `theaters`
--
ALTER TABLE `theaters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `accounts`
--
ALTER TABLE `accounts`
  ADD CONSTRAINT `accounts_ibfk_1` FOREIGN KEY (`city`) REFERENCES `cities` (`id`);

--
-- Constraints for table `actors_movies`
--
ALTER TABLE `actors_movies`
  ADD CONSTRAINT `actors_movies_ibfk_1` FOREIGN KEY (`actor_id`) REFERENCES `actors` (`id`),
  ADD CONSTRAINT `actors_movies_ibfk_2` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`);

--
-- Constraints for table `genres_movies`
--
ALTER TABLE `genres_movies`
  ADD CONSTRAINT `genres_movies_ibfk_1` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`id`),
  ADD CONSTRAINT `genres_movies_ibfk_2` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`);

--
-- Constraints for table `languages_movies`
--
ALTER TABLE `languages_movies`
  ADD CONSTRAINT `languages_movies_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`),
  ADD CONSTRAINT `languages_movies_ibfk_2` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`);

--
-- Constraints for table `movies`
--
ALTER TABLE `movies`
  ADD CONSTRAINT `movies_ibfk_1` FOREIGN KEY (`original_language`) REFERENCES `languages` (`id`),
  ADD CONSTRAINT `movies_ibfk_3` FOREIGN KEY (`director`) REFERENCES `directors` (`id`);

--
-- Constraints for table `projections`
--
ALTER TABLE `projections`
  ADD CONSTRAINT `projections_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`),
  ADD CONSTRAINT `projections_ibfk_2` FOREIGN KEY (`theater_id`) REFERENCES `theaters` (`id`);

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`),
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`);

--
-- Constraints for table `studios_movies`
--
ALTER TABLE `studios_movies`
  ADD CONSTRAINT `studios_movies_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`),
  ADD CONSTRAINT `studios_movies_ibfk_2` FOREIGN KEY (`studio_id`) REFERENCES `studios` (`id`);

--
-- Constraints for table `theaters`
--
ALTER TABLE `theaters`
  ADD CONSTRAINT `theaters_ibfk_1` FOREIGN KEY (`city`) REFERENCES `cities` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;