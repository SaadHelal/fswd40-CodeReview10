-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 24, 2018 at 03:52 PM
-- Server version: 10.1.32-MariaDB
-- PHP Version: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cr10_saad_helal_biglibrary`
--

-- --------------------------------------------------------

--
-- Table structure for table `author`
--

CREATE TABLE `author` (
  `author_id` int(11) NOT NULL,
  `first_name` varchar(60) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `last_name` varchar(60) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `author`
--

INSERT INTO `author` (`author_id`, `first_name`, `last_name`) VALUES
(1, ' Gabriel', 'García Márquez'),
(2, ' Ernest', 'Hemingway '),
(3, ' Paulo', 'Coelho'),
(4, 'pink', 'floyd'),
(5, ' Stephen', 'Hawking'),
(6, 'John Ronald Reuel', 'Tolkien'),
(7, 'Rod ', 'Temperton'),
(8, 'David ', 'Franzoni'),
(9, ' Stephen', 'King'),
(10, 'Christopher ', 'Nolan');

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `book_id` int(11) NOT NULL,
  `title` varchar(60) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `type` varchar(60) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `ISBN_code` bigint(100) NOT NULL,
  `publish_date` date NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fk_publisher_id` int(11) NOT NULL,
  `fk_author_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`book_id`, `title`, `img`, `type`, `ISBN_code`, `publish_date`, `description`, `fk_publisher_id`, `fk_author_id`) VALUES
(1, 'One Hundred Years of Solitude', 'https://i.ebayimg.com/images/g/snQAAOSwP8BZuEVe/s-l640.jpg', 'book', 9789631420494, '1967-05-30', 'One Hundred Years of Solitude is a landmark 1967 novel by Colombian author Gabriel Garcia Marquez that tells the multi-generational story of the Buendia family, whose patriarch, Jose Arcadio Buendia, founds the town of Macondo, a fictitious town in the co', 11, 1),
(2, 'The old man and the sea', 'https://upload.wikimedia.org/wikipedia/en/7/73/Oldmansea.jpg', 'book', 9788936603793, '1952-09-01', 'The Old Man and the Sea is a short novel written by the American author Ernest Hemingway in 1951 in Cuba, and published in 1952.[1] It was the last major work of fiction by Hemingway that was published during his lifetime. One of his most famous works, it', 22, 2),
(3, 'The Alchemist', 'https://images-na.ssl-images-amazon.com/images/I/41ybG235TcL._SX329_BO1,204,203,200_.jpg', 'book', 9781940277752, '1988-08-10', 'The Alchemist is a novel by Brazilian author Paulo Coelho which was first published in 1988. Originally written in Portuguese, it became an international bestseller translated into some 70 languages as of 2016.[1][2] An allegorical novel, The Alchemist fo', 33, 3),
(4, 'A Brief History of Time', 'https://upload.wikimedia.org/wikipedia/en/thumb/a/a3/BriefHistoryTime.jpg/220px-BriefHistoryTime.jpg', 'book', 9780857501004, '1988-03-01', 'A Brief History of Time: From the Big Bang to Black Holes is a popular-science book on cosmology (the study of the universe) by British physicist Stephen Hawking.[1] It was first published in 1988. Hawking wrote the book for nonspecialist readers with no ', 44, 5),
(5, 'The Hobbit', 'https://images-na.ssl-images-amazon.com/images/I/61SJGmJDwzL._SX324_BO1,204,203,200_.jpg', 'book', 9788700969025, '1937-09-21', 'The Hobbit, or There and Back Again is a children\'s fantasy novel by English author J. R. R. Tolkien. It was published on 21 September 1937 to wide critical acclaim, being nominated for the Carnegie Medal and awarded a prize from the New York Herald Tribu', 55, 6);

-- --------------------------------------------------------

--
-- Table structure for table `cds`
--

CREATE TABLE `cds` (
  `CD_id` int(11) NOT NULL,
  `title` varchar(60) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `type` varchar(60) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `publish_date` date NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fk_author_id` int(11) NOT NULL,
  `fk_producer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cds`
--

INSERT INTO `cds` (`CD_id`, `title`, `img`, `type`, `publish_date`, `description`, `fk_author_id`, `fk_producer_id`) VALUES
(1, 'The Wall', 'https://images-na.ssl-images-amazon.com/images/I/71jxpq0Lk5L._SX355_.jpg', 'CD', '1979-11-30', 'The Wall is the eleventh studio album by English rock band Pink Floyd. It was released as a double album on 30 November 1979 in the United Kingdom by Harvest Records and in the United States by Columbia Records. Bassist and songwriter Roger Waters conceiv', 4, 1),
(2, 'Thriller ', 'https://images.recordsale.de/600/600/cdpix/m/michaeljackson-thriller(25).jpg', 'CD', '1982-11-30', 'Thriller is the sixth studio album by American singer Michael Jackson, released on November 30, 1982, in the United States by Epic Records and internationally by CBS Records.[1][2] It explores genres similar to Jackson\'s previous album, Off the Wall, incl', 5, 2);

-- --------------------------------------------------------

--
-- Table structure for table `dvds`
--

CREATE TABLE `dvds` (
  `DVD_id` int(11) NOT NULL,
  `title` varchar(55) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `type` varchar(60) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `publish_date` date NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fk_author_id` int(11) NOT NULL,
  `fk_producer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dvds`
--

INSERT INTO `dvds` (`DVD_id`, `title`, `img`, `type`, `publish_date`, `description`, `fk_author_id`, `fk_producer_id`) VALUES
(1, 'Gladiator', 'https://upload.wikimedia.org/wikipedia/en/thumb/8/8d/Gladiator_ver1.jpg/220px-Gladiator_ver1.jpg', 'DVD', '2000-05-05', 'Gladiator is a 2000 epic historical drama film directed by Ridley Scott and written by David Franzoni, John Logan, and William Nicholson. It stars Russell Crowe, Joaquin Phoenix, Connie Nielsen, Ralf Moller, Oliver Reed (in his final role), Djimon Hounsou', 8, 3),
(3, 'The Shawshank Redemption', 'https://upload.wikimedia.org/wikipedia/en/8/81/ShawshankRedemptionMoviePoster.jpg', 'DVD', '1994-10-14', 'The Shawshank Redemption is a 1994 American drama film written and directed by Frank Darabont, based on the 1982 Stephen King novella Rita Hayworth and Shawshank Redemption. It tells the story of banker Andy Dufresne (Tim Robbins), who is sentenced to lif', 9, 4),
(4, 'The Dark Knight', 'https://upload.wikimedia.org/wikipedia/en/8/8a/Dark_Knight.jpg', 'DVD', '2008-07-18', 'When the menace known as the Joker emerges from his mysterious past, he wreaks havoc and chaos on the people of Gotham. The Dark Knight must accept one of the greatest psychological and physical tests of his ability to fight injustice.', 10, 5);

-- --------------------------------------------------------

--
-- Table structure for table `publisher`
--

CREATE TABLE `publisher` (
  `publisher_id` int(11) NOT NULL,
  `name` varchar(60) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `address` varchar(60) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `siz_of_publisher` varchar(60) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `publisher`
--

INSERT INTO `publisher` (`publisher_id`, `name`, `address`, `siz_of_publisher`) VALUES
(11, 'Editorial Sudamericana', 'Humberto Primo 555 Buenos Aires, Argentina', 'big'),
(22, 'Charles Scribner\'s Sons', ' Manhattan at 597 Fifth Avenue, New york city.USA', 'big'),
(33, 'HarperCollins', ' 195 Broadway New York, USA', 'big'),
(44, 'Bantam Books', 'New york city. USA', 'big'),
(55, 'Allen & Unwin', '83 Alexander Ln, Crows Nest NSW 2065, Australia', 'big');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `userId` int(11) NOT NULL,
  `userName` varchar(60) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `email` varchar(60) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `pass` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userId`, `userName`, `email`, `pass`) VALUES
(1, 'Saad', 'saad.helal.sh@gmail.com', '04e4a23773f745be4c96a8bf568cdfdfab6108d7153d78bbc68cc37cea628bbc'),
(2, 'alex', 'alex@gmail.com', 'ba530a3de516671e75365bf3c1c29d866038eefe9e7a16caf8456986e0809bb1'),
(3, 'joe', 'joe@gmail.com', '71b7527b0b5309ad7e414a24f18a5022b879bfcee03ff18395589fb823d5ecae'),
(4, 'samir', 'samir@gmail.com', '5e2b95a8d67708921505466ee5f7d6d24c4a0bd10e24f3211ac58ba0c24875ef'),
(5, 'hamada', 'hamada@gmail.com', '08a41714149e7914f01048e35e95d3510eda80517b19372a29b600e43963e998'),
(8, 'sam', 'sam@gmail.com', 'e3ee71a1487f230b7140f6a1f1a87fdb1d2bc1c972572a61482203b50f3c2d6e'),
(10, 'alaa', 'alla@gmail.com', 'f16627e5cb4e1d45866f725f7fb835fce1ff30aa23c10a0befd768d2f4315101');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`author_id`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`book_id`),
  ADD UNIQUE KEY `fk_publisher_id` (`fk_publisher_id`),
  ADD UNIQUE KEY `fk_author_id` (`fk_author_id`) USING BTREE;

--
-- Indexes for table `cds`
--
ALTER TABLE `cds`
  ADD PRIMARY KEY (`CD_id`),
  ADD UNIQUE KEY `fk_author_id` (`fk_author_id`),
  ADD UNIQUE KEY `fk_p.c_id` (`fk_producer_id`);

--
-- Indexes for table `dvds`
--
ALTER TABLE `dvds`
  ADD PRIMARY KEY (`DVD_id`),
  ADD UNIQUE KEY `fk_author_id` (`fk_author_id`),
  ADD UNIQUE KEY `fk_p.c_id` (`fk_producer_id`);

--
-- Indexes for table `publisher`
--
ALTER TABLE `publisher`
  ADD PRIMARY KEY (`publisher_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `author`
--
ALTER TABLE `author`
  MODIFY `author_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `book_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `cds`
--
ALTER TABLE `cds`
  MODIFY `CD_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `dvds`
--
ALTER TABLE `dvds`
  MODIFY `DVD_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `publisher`
--
ALTER TABLE `publisher`
  MODIFY `publisher_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `books_ibfk_1` FOREIGN KEY (`fk_publisher_id`) REFERENCES `publisher` (`publisher_id`),
  ADD CONSTRAINT `books_ibfk_2` FOREIGN KEY (`fk_author_id`) REFERENCES `author` (`author_id`);

--
-- Constraints for table `cds`
--
ALTER TABLE `cds`
  ADD CONSTRAINT `cds_ibfk_1` FOREIGN KEY (`fk_author_id`) REFERENCES `author` (`author_id`),
  ADD CONSTRAINT `cds_ibfk_2` FOREIGN KEY (`fk_producer_id`) REFERENCES `producer` (`producer_id`);

--
-- Constraints for table `dvds`
--
ALTER TABLE `dvds`
  ADD CONSTRAINT `dvds_ibfk_1` FOREIGN KEY (`fk_author_id`) REFERENCES `author` (`author_id`),
  ADD CONSTRAINT `dvds_ibfk_2` FOREIGN KEY (`fk_producer_id`) REFERENCES `producer` (`producer_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
