-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 09, 2019 at 12:16 PM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.1.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bookweb`
--

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `ISBN` char(13) NOT NULL,
  `title` varchar(70) NOT NULL,
  `description` varchar(300) DEFAULT NULL,
  `cost` float NOT NULL,
  `id` decimal(5,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`ISBN`, `title`, `description`, `cost`, `id`) VALUES
('1234561234561', 'img/ads.jpg', 'Advance Data Structures', 6.66, '23456'),
('4564564564564', 'img/headfirstC.jpg', 'C# is a general purpose, object-oriented, componen', 7.56, '32165'),
('7854123698745', 'img/quarantine.jpg', 'Sahil Distoryn', 5.66, '65412'),
('9780345391803', 'img/sqlcomplete.jpg', 'SQL Learning By Anvesha ', 4.99, '12345'),
('9780547572482', 'img/headfirstC.jpg', 'C# By Head First BBG', 5.99, '34512'),
('9781597805384', 'img/thinkinginjava.jpg', 'Thinking About Java', 3.99, '45123'),
('9781597805385', 'img/cpp.jpg', 'Effective C++ ', 3.99, '51234');

-- --------------------------------------------------------

--
-- Table structure for table `bookwriter`
--

CREATE TABLE `bookwriter` (
  `ISBN` char(13) NOT NULL,
  `id` decimal(5,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bookwriter`
--

INSERT INTO `bookwriter` (`ISBN`, `id`) VALUES
('9780345391803', '12345'),
('9780547572482', '34512'),
('9781597805384', '45123'),
('9781597805385', '51234');

-- --------------------------------------------------------

--
-- Table structure for table `history`
--

CREATE TABLE `history` (
  `hid` int(11) NOT NULL,
  `orderid` int(11) DEFAULT NULL,
  `userid` bigint(150) NOT NULL,
  `ISBN` char(13) NOT NULL,
  `orderdetails` datetime NOT NULL,
  `quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `history`
--

INSERT INTO `history` (`hid`, `orderid`, `userid`, `ISBN`, `orderdetails`, `quantity`) VALUES
(14, 9, 99, '9781597805385', '2019-12-04 11:52:58', 30),
(16, 12, 66, '9780547572482', '2019-12-04 14:05:32', 20),
(20, 16, 21, '9780547572482', '2019-12-04 14:18:44', 1),
(21, 17, 21, '9780345391803', '2019-12-04 15:04:00', 30),
(22, 18, 21, '9780547572482', '2019-12-04 15:04:00', 10),
(38, 29, 11, '9780345391803', '2019-12-04 15:43:12', 6),
(42, 10, 10, '9780345391803', '2019-12-04 20:08:52', 30),
(43, 31, 10, '9781597805384', '2019-12-04 20:08:52', 3),
(44, 32, 10, '9781597805385', '2019-12-04 20:08:52', 2),
(49, 37, 21, '9781597805384', '2019-12-06 09:04:05', 2),
(59, 44, 21, '9780345391803', '2019-12-06 10:32:46', 2),
(60, 45, 21, '9780547572482', '2019-12-06 10:32:46', 2),
(61, 46, 21, '9781597805384', '2019-12-06 10:32:46', 2),
(62, 47, 21, '9781597805385', '2019-12-06 10:32:46', 2),
(95, 72, 21, '9781597805385', '2019-12-06 12:20:54', 2),
(97, 74, 21, '9781597805384', '2019-12-06 12:26:49', 2),
(98, 75, 21, '9781597805384', '2019-12-06 12:26:49', 2),
(99, 76, 21, '9781597805384', '2019-12-06 12:26:49', 2),
(100, 77, 21, '9781597805384', '2019-12-06 12:26:49', 2),
(101, 78, 21, '9781597805384', '2019-12-06 12:26:49', 2),
(106, 81, 21, '9781597805384', '2019-12-06 14:16:33', 2),
(107, 82, 21, '9780547572482', '2019-12-06 20:26:02', 1),
(108, 83, 21, '9780345391803', '2019-12-06 20:26:02', 2),
(114, 88, 21, '9781597805384', '2019-12-06 20:41:32', 3),
(115, 89, 21, '9781597805384', '2019-12-06 20:41:32', 3),
(116, 90, 21, '9781597805384', '2019-12-06 20:41:32', 3),
(117, 91, 21, '9781597805384', '2019-12-06 20:41:32', 1),
(118, 92, 21, '9781597805384', '2019-12-06 20:41:32', 1),
(119, 93, 21, '9781597805384', '2019-12-06 20:41:32', 1),
(127, 100, 8888841151, '9780547572482', '2019-12-06 23:38:25', 1),
(128, 101, 8888841151, '9781597805384', '2019-12-06 23:38:39', 1),
(130, 103, 8888841151, '9781597805385', '2019-12-06 23:40:30', 2),
(131, 104, 8888841151, '9780547572482', '2019-12-06 23:42:44', 3),
(132, 105, 8888841151, '9780547572482', '2019-12-06 23:44:59', 3),
(135, 107, 9766328281, '9781597805384', '2019-12-07 13:25:31', 3),
(136, 108, 9766328281, '9780345391803', '2019-12-07 13:34:17', 2),
(143, 114, 9766328281, '9780345391803', '2019-12-07 13:36:57', 2),
(145, 115, 21, '9780345391803', '2019-12-07 13:54:36', 6),
(147, 124, 9766328281, '9780345391803', '2019-12-07 18:48:54', 2),
(148, 125, 9766328281, '9780345391803', '2019-12-07 18:48:54', 2),
(149, 126, 9766328281, '9780345391803', '2019-12-07 18:48:54', 2),
(150, 155, 9766328281, '9780345391803', '2019-12-07 18:48:54', 2),
(155, 160, 7350998779, '9780345391803', '2019-12-07 19:36:05', 3),
(157, 161, 21, '7854123698745', '2019-12-07 19:45:44', 1),
(158, 162, 21, '1234561234561', '2019-12-07 19:45:44', 2),
(160, 156, 9766328281, '1234561234561', '2019-12-07 19:55:10', 2),
(161, 163, 9766328281, '1234561234561', '2019-12-07 19:55:10', 2),
(162, 165, 9766328281, '9781597805384', '2019-12-07 19:55:10', 1),
(164, 167, 9766328281, '4564564564564', '2019-12-07 20:02:02', 2),
(165, 168, 9766328281, '9780345391803', '2019-12-07 20:02:02', 2);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `orderid` int(11) NOT NULL,
  `ISBN` char(13) NOT NULL,
  `userid` bigint(150) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `order_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`orderid`, `ISBN`, `userid`, `quantity`, `order_date`) VALUES
(174, '1234561234561', 21, 2, '2019-12-08 23:36:31');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userid` bigint(150) NOT NULL,
  `username` varchar(50) NOT NULL,
  `pass_word` varchar(50) NOT NULL,
  `full_name` varchar(50) NOT NULL,
  `address` varchar(80) NOT NULL,
  `credit_card` decimal(16,0) NOT NULL,
  `utype` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userid`, `username`, `pass_word`, `full_name`, `address`, `credit_card`, `utype`) VALUES
(7, 'saurabh', 'nitin', 'Saurabh Jadhav', 'I Am From APune', '5555555555555555', 'admin'),
(10, 'jadu', 'jadu', 'Silva Jadu', 'Pune', '1231231231231231', 'registered'),
(11, 'anvesha', 'anvesha', 'Anvesha Kuchabi', 'lucknow', '1111111111111111', 'admin'),
(21, 'adity', 'adity', 'Adity Chow', 'Pune ', '1231231231231231', 'admin'),
(51, 'benedict', 'benedict', 'Sopan lahe', 'Kothrud', '1111111111111111', 'registered'),
(66, 'abhi', 'abhi', 'Abhishek ', 'Pune ', '777777777777777', 'admin'),
(988977467, 'saurabh ', 'saurabh', 'Saurabh Jadhav', 'pune ', '9999999999999999', 'registered'),
(7350998779, 'abhii', 'abhii', 'Saurabh Kadam', 'Dhnkawdi,Pune', '7878787878787878', 'admin'),
(7511223314, 'anvi', 'anvi', 'Anvi Chudhari', 'Dhnkawdi,Pune', '7845123652147896', 'registered'),
(7588406046, 'anu', '123456', 'Anvi kambale', 'Dhnkawdi,Pune', '1231231231231231', 'registered'),
(8888841151, 'xxx', 'xxx', 'Nikita Kale', 'Pune 414401', '9999999999999999', 'registered'),
(9766328281, 'daku', 'daku', 'Akash Pathak', 'Pune D', '5555555555555555', 'registered'),
(9795629003, 'anvesha', 'anvesha', 'anvesha ', 'lucknow Shastri nagar near aishbhagh colony ', '4444444444444444', 'registered'),
(9860825314, 'Soulja', 'Soulja', 'Saurabh Jadhav', 'Pune kothrud', '1231231231231231', 'registered'),
(9975803044, 'barrud', 'barrud', 'Nikhil Jadhav', 'Kothrud Pune', '9860231456785412', 'registered');

-- --------------------------------------------------------

--
-- Table structure for table `writer`
--

CREATE TABLE `writer` (
  `id` decimal(5,0) NOT NULL,
  `author_name` varchar(80) NOT NULL,
  `bookname` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `writer`
--

INSERT INTO `writer` (`id`, `author_name`, `bookname`) VALUES
('12345', 'Paul Weinberg Munna', 'The Complete Reference'),
('23456', 'PeterBrass', 'Advanced Data Structures'),
('32165', 'Philip Japikse SKJ', '.NET 4.6 Framework ZZB'),
('34512', 'Andrew Stellman', 'C# Head First'),
('45123', 'Bruce Eckel', 'Thinking About Java'),
('51234', 'Meyers', 'Effective C++'),
('56324', 'Philip Japikse', 'Eloquent JavaScript'),
('65412', 'Anvesha', 'Advanced  Structures'),
('78945', 'Peter Brass', 'Eloquent JavaScript'),
('98745', 'Marijn Haverbeke', 'Eloquent JavaScript');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`ISBN`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `bookwriter`
--
ALTER TABLE `bookwriter`
  ADD PRIMARY KEY (`ISBN`,`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`hid`),
  ADD KEY `userid` (`userid`),
  ADD KEY `ISBN` (`ISBN`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orderid`),
  ADD KEY `userid` (`userid`),
  ADD KEY `ISBN` (`ISBN`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userid`);

--
-- Indexes for table `writer`
--
ALTER TABLE `writer`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `history`
--
ALTER TABLE `history`
  MODIFY `hid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=170;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `orderid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=175;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `books_ibfk_1` FOREIGN KEY (`id`) REFERENCES `writer` (`id`);

--
-- Constraints for table `bookwriter`
--
ALTER TABLE `bookwriter`
  ADD CONSTRAINT `bookwriter_ibfk_1` FOREIGN KEY (`id`) REFERENCES `writer` (`id`),
  ADD CONSTRAINT `bookwriter_ibfk_2` FOREIGN KEY (`ISBN`) REFERENCES `books` (`ISBN`);

--
-- Constraints for table `history`
--
ALTER TABLE `history`
  ADD CONSTRAINT `history_ibfk_2` FOREIGN KEY (`ISBN`) REFERENCES `books` (`ISBN`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`ISBN`) REFERENCES `books` (`ISBN`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
