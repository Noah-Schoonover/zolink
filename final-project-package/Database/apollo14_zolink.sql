-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 08, 2021 at 11:52 PM
-- Server version: 10.1.48-MariaDB-0ubuntu0.18.04.1
-- PHP Version: 7.2.24-0ubuntu0.18.04.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `apollo14_zolink`
--

-- --------------------------------------------------------

--
-- Table structure for table `card`
--

CREATE TABLE `card` (
  `card_id` int(11) NOT NULL,
  `code` varchar(10) NOT NULL,
  `user_id` int(11) NOT NULL,
  `card_name` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  `private` tinyint(1) NOT NULL,
  `profile_img` varchar(200) DEFAULT NULL,
  `qr_img` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `card`
--

INSERT INTO `card` (`card_id`, `code`, `user_id`, `card_name`, `name`, `private`, `profile_img`, `qr_img`) VALUES
(25, 'abck', 19, 'Personal', 'Myles Willis', 0, NULL, NULL),
(26, 'abcl', 20, 'cardname', 'car', 0, NULL, NULL),
(31, 'abcn', 19, 'Business', 'Myles Willis', 0, NULL, NULL),
(35, 'abco', 24, 'big test\'', 'test', 0, NULL, NULL),
(37, 'abcp', 25, 'THis is  a test', 'test', 0, NULL, NULL),
(38, 'abcq', 26, 'My Work', 'Rick Astly ', 0, NULL, NULL),
(39, 'abcr', 26, 'My Work', 'Rick Astly ', 0, NULL, NULL),
(40, 'abcs', 29, '1', '1', 0, NULL, NULL),
(43, 'abct', 1, 'My First Card', 'Noah Schoonover', 0, NULL, NULL),
(44, 'abcu', 1, 'My Second Card', 'Noah Schoonover', 0, NULL, NULL),
(45, 'abcv', 1, 'My Third Card', 'Noah Schoonover', 0, NULL, NULL),
(46, 'abcw', 31, 'Death', 'Chuni', 0, NULL, NULL),
(47, 'abcx', 30, 'My First Card', 'Adam Schmidt', 0, NULL, NULL),
(51, 'abcy', 30, 'Business Card', 'Adam Schmidt', 0, NULL, NULL),
(52, 'abcz', 30, 'Personal', 'Adam Schmidt', 0, NULL, NULL),
(53, 'abd0', 33, '\'%\"\"}{!@#$%^^&*(){}|:\"<>?', '\'%\"\"}{!@#$%^^&*(){}|:\"<>?', 0, NULL, NULL),
(54, 'abd1', 34, 'Tenise\'s Card', 'Tenise Stansfield', 0, NULL, NULL),
(55, 'abd2', 1, 'Business Card', 'Noah Schoonover', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `info`
--

CREATE TABLE `info` (
  `info_id` int(11) NOT NULL,
  `card_id` int(11) NOT NULL,
  `info_type` varchar(40) DEFAULT NULL,
  `data` varchar(255) NOT NULL,
  `info_order` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `info`
--

INSERT INTO `info` (`info_id`, `card_id`, `info_type`, `data`, `info_order`) VALUES
(4, 21, NULL, 'six1', 1),
(5, 21, NULL, 'six2', 2),
(6, 21, NULL, 'six3', 3),
(9, 22, NULL, 'seven1', 1),
(10, 22, NULL, 'seven2', 2),
(11, 22, NULL, 'seven3', 4),
(12, 23, NULL, 'mycard1', 1),
(13, 23, NULL, 'mycard2', 2),
(14, 23, NULL, 'mycard3', 3),
(15, 24, NULL, 'i1', 1),
(16, 24, NULL, 'i2', 2),
(21, 26, NULL, 'car', 1),
(22, 26, NULL, 'car', 2),
(23, 26, NULL, 'car', 3),
(24, 26, NULL, 'car', 4),
(25, 26, NULL, 'car', 5),
(96, 25, NULL, 'Leron5365@gmail.com ', 1),
(97, 25, NULL, 'instagram.com/mwillis_photo', 2),
(98, 25, NULL, '505', 3),
(105, 35, NULL, 'testy', 1),
(107, 37, NULL, 'ssssssssssssssssssssssssssssssssssssssss', 1),
(108, 38, NULL, 'Let me show you some of my work.\"/><meta http-equiv=\"refresh\" content=\"5;https://www.youtube.com/watch?v=iik25wqIuFo\" />', 1),
(109, 39, NULL, 'Let me show you some of my work.\"/><meta http-equiv=\"refresh\" content=\"5;https://www.youtube.com/watch?v=iik25wqIuFo\" />', 1),
(110, 40, NULL, '1', 1),
(128, 45, NULL, 'info4', 3),
(129, 44, NULL, 'info4', 2),
(130, 44, NULL, 'info5', 3),
(143, 46, NULL, 'some info', 1),
(144, 46, NULL, 'some info', 2),
(145, 46, NULL, 'some info', 3),
(146, 46, NULL, 'some info', 4),
(147, 46, NULL, 'some info', 5),
(148, 46, NULL, 'some info', 6),
(149, 46, NULL, 'some info', 7),
(150, 46, NULL, 'some info', 8),
(151, 46, NULL, 'some info', 9),
(161, 31, NULL, 'myles.willis@student.nmt.edu', 1),
(162, 31, NULL, '555-555-5555', 2),
(163, 31, NULL, 'P.O Box 1234, Socorro NM, 87801', 3),
(164, 31, NULL, 'github.com/Myles-Willis', 4),
(165, 31, NULL, 'cs.nmt.edu/~myles_willis56/index.html', 5),
(166, 31, NULL, ' linkedin.com/in/myleswillis ', 6),
(170, 51, NULL, 'Apple sauce and vinegar chips', 1),
(171, 51, NULL, 'Applebees rewards club member', 2),
(172, 51, NULL, 'Apples', 3),
(175, 52, NULL, '(555)555-5555', 1),
(176, 52, NULL, 'adam@schmidt.com', 2),
(183, 53, NULL, '\'%\"\"}{!@#$%^^&*(){}|:\"<>?', 1),
(184, 53, NULL, '\'%\"\"}{!@#$%^^&*(){}|:\"<>?', 2),
(185, 53, NULL, '\'%\"\"}{!@#$%^^&*(){}|:\"<>?', 3),
(186, 47, NULL, '(555) 555-5555', 1),
(187, 47, NULL, 'adam@schmidt.com', 2),
(188, 47, NULL, 'adamschmidt.com', 3),
(189, 47, NULL, 'adam ', 6),
(193, 55, NULL, 'noah', 1),
(194, 55, NULL, 'hi', 2),
(195, 55, NULL, 'what\'s up', 3),
(196, 55, NULL, 'hellllloooooooo', 4),
(197, 43, NULL, 'info 1', 1),
(198, 43, NULL, 'sdf111111111', 2),
(199, 43, NULL, 'sdfs', 3),
(200, 43, NULL, 'sdf', 4);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `email`, `password`) VALUES
(1, 'noah@skoonie.com', 'Jinkooo!000'),
(13, 'a@example.com', 'qwer1234'),
(14, 'a@A', 'aaaaaa'),
(15, 'julian.garcia@student.nmt.edu', 'Jagmjg'),
(16, 'rick@astly.com', 'lollol'),
(17, 'test@test', 'test123'),
(18, 'bye@example.com', '123412'),
(19, 'leron5365@gmail.com', '123456'),
(20, 'parker.alcone@student.nmt.edu', 'Palcone1'),
(21, 'noah@noah.com', '111111'),
(22, 'noah@noah2.com', '111111'),
(23, 'noah@noah3.com', '111111'),
(24, 'lostgames@yahoo.com', 'TestingTHisOut'),
(25, 'fish@gmail.com', '33013301'),
(26, 'rick@nmt.edu', '33013301'),
(27, 'sean171035@gmail.com', 'apollo4'),
(28, 'noah3@noah.com', '111111'),
(29, 'noah6@skoonie.com', '111111'),
(30, 'adam@schmidt.com', '111111'),
(31, '1@1.com', '111111'),
(32, 'adam@schmidt', '111111'),
(33, 'tester@test.com', 'testytest'),
(34, 'tenise@urmom.com', 'yourmother');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `card`
--
ALTER TABLE `card`
  ADD PRIMARY KEY (`card_id`);

--
-- Indexes for table `info`
--
ALTER TABLE `info`
  ADD PRIMARY KEY (`info_id`),
  ADD KEY `card_id` (`card_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `card`
--
ALTER TABLE `card`
  MODIFY `card_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `info`
--
ALTER TABLE `info`
  MODIFY `info_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=201;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
