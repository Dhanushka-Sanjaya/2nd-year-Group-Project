-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 22, 2017 at 03:06 PM
-- Server version: 5.7.14
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `news`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `new_admin` (IN `admin_id` INT(11), IN `first_name` VARCHAR(45), IN `last_name` VARCHAR(45), IN `full_name` VARCHAR(45), IN `nic` VARCHAR(12), IN `dob` DATE, IN `phone_mobile` INT(11), IN `phone_fixed` INT(11))  BEGIN

INSERT INTO `news`.`admin_personal`
(`admin_id`,`first_name`,`last_name`,`full_name`,`nic`,`dob`,`phone_mobile`,`phone_fixed`)
VALUES
(admin_id, first_name, last_name, full_name, nic, dob, phone_mobile, phone_fixed);


END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(2) NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `email`, `username`, `password`) VALUES
(1, 'admin@news1.com', 'admin', 'admin@123');

-- --------------------------------------------------------

--
-- Table structure for table `admin_corre`
--

CREATE TABLE `admin_corre` (
  `admin_id` int(11) NOT NULL,
  `admin_personal_admin_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `admin_login`
--

CREATE TABLE `admin_login` (
  `id` int(11) NOT NULL,
  `user_name` varchar(45) COLLATE utf8_bin NOT NULL,
  `password` varchar(45) COLLATE utf8_bin NOT NULL,
  `admin_personal_admin_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `admin_login`
--

INSERT INTO `admin_login` (`id`, `user_name`, `password`, `admin_personal_admin_id`) VALUES
(1, 'admin', 'admin@123', 2);

-- --------------------------------------------------------

--
-- Table structure for table `admin_news`
--

CREATE TABLE `admin_news` (
  `admin_id` int(11) NOT NULL,
  `news_id` varchar(45) COLLATE utf8_bin NOT NULL,
  `admin_personal_admin_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `admin_personal`
--

CREATE TABLE `admin_personal` (
  `admin_id` int(11) NOT NULL,
  `first_name` varchar(45) COLLATE utf8_bin NOT NULL,
  `last_name` varchar(45) COLLATE utf8_bin NOT NULL,
  `full_name` varchar(150) COLLATE utf8_bin DEFAULT NULL,
  `nic` varchar(12) COLLATE utf8_bin NOT NULL,
  `dob` date DEFAULT NULL,
  `phone_mobile` int(11) DEFAULT NULL,
  `phone_fixed` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `admin_personal`
--

INSERT INTO `admin_personal` (`admin_id`, `first_name`, `last_name`, `full_name`, `nic`, `dob`, `phone_mobile`, `phone_fixed`) VALUES
(2, 'nimesh', 'anuradha', 'nimeshanuradha', '199332001490', '1993-11-15', 713463038, 113160953);

-- --------------------------------------------------------

--
-- Table structure for table `corr`
--

CREATE TABLE `corr` (
  `corr_id` int(32) NOT NULL,
  `nic` varchar(10) NOT NULL,
  `f_name` varchar(255) NOT NULL,
  `l_name` varchar(255) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `address` varchar(1028) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `email` varchar(255) NOT NULL,
  `district` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `corr`
--

INSERT INTO `corr` (`corr_id`, `nic`, `f_name`, `l_name`, `gender`, `address`, `mobile`, `email`, `district`) VALUES
(1, 'adad', 'dwadaw', 'dwada', 'male', '', 'dwada', 'dawdad@dwad', 'Colombo'),
(2, '940569874V', 'Lochana', 'Hasith', 'male', 'New Road , MAharagama', '7789561331', 'locha@gmail.com', 'Colombo');

-- --------------------------------------------------------

--
-- Table structure for table `corre_login`
--

CREATE TABLE `corre_login` (
  `login_corre_id` int(11) NOT NULL,
  `user_name` varchar(45) COLLATE utf8_bin NOT NULL,
  `password` varchar(45) COLLATE utf8_bin NOT NULL,
  `corre_personal_corre_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `corre_news`
--

CREATE TABLE `corre_news` (
  `corre_id` int(11) NOT NULL,
  `news_id` int(11) NOT NULL,
  `added_date` date DEFAULT NULL,
  `corre_personal_corre_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `corre_personal`
--

CREATE TABLE `corre_personal` (
  `corre_id` int(11) NOT NULL,
  `first_name` varchar(45) COLLATE utf8_bin NOT NULL,
  `last_name` varchar(45) COLLATE utf8_bin NOT NULL,
  `dob` date DEFAULT NULL,
  `nic` varchar(45) COLLATE utf8_bin NOT NULL,
  `phone_mobile` int(11) DEFAULT NULL,
  `phone_fixed` int(11) DEFAULT NULL,
  `gender` varchar(10) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `news_id` int(32) NOT NULL,
  `title` varchar(1028) NOT NULL,
  `venue` varchar(1028) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `district` varchar(255) NOT NULL,
  `description` varchar(1028) NOT NULL,
  `status` varchar(15) NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`news_id`, `title`, `venue`, `date`, `time`, `district`, `description`, `status`) VALUES
(1, 'Cricket Meeting', 'Keththarama Stadium', '2017-08-29', '08:22:00', 'colombo', '', 'completed'),
(2, 'election', 'election bord', '2017-08-10', '05:33:00', 'Anuradhapura', '', 'completed'),
(4, 'title', 'dwada', '2017-08-03', '23:23:00', 'Colombo', '', 'pending'),
(5, 'title', 'NAT UOC', '2017-08-18', '15:00:00', 'Colombo', '', 'asigned'),
(6, 'title', 'awdadawdad', '2017-08-17', '06:03:00', 'Kilinochchi', '', 'pending'),
(7, 'title', 'Nelum Pokuna', '2017-08-04', '14:04:00', 'Colombo', '', 'pending'),
(8, 'title', 'dwada', '2017-08-15', '03:04:00', 'Matale', 'New Description', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `news_available`
--

CREATE TABLE `news_available` (
  `news_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `news_completed`
--

CREATE TABLE `news_completed` (
  `news_id` int(11) NOT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `corre_id` int(11) DEFAULT NULL,
  `delivery_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `news_details`
--

CREATE TABLE `news_details` (
  `news_id` int(11) NOT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `corre_id` int(11) DEFAULT NULL,
  `type` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `location` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `news_telecasted_news_id` int(11) NOT NULL,
  `news_available_news_id` int(11) NOT NULL,
  `news_completed_news_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `news_telecasted`
--

CREATE TABLE `news_telecasted` (
  `news_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_corre`
--
ALTER TABLE `admin_corre`
  ADD PRIMARY KEY (`admin_id`,`admin_personal_admin_id`),
  ADD KEY `fk_admin_corre_admin_personal1_idx` (`admin_personal_admin_id`);

--
-- Indexes for table `admin_login`
--
ALTER TABLE `admin_login`
  ADD PRIMARY KEY (`id`,`admin_personal_admin_id`),
  ADD KEY `fk_admin_login_admin_personal1_idx` (`admin_personal_admin_id`);

--
-- Indexes for table `admin_news`
--
ALTER TABLE `admin_news`
  ADD PRIMARY KEY (`admin_id`,`news_id`,`admin_personal_admin_id`),
  ADD KEY `fk_admin_news_admin_personal1_idx` (`admin_personal_admin_id`);

--
-- Indexes for table `admin_personal`
--
ALTER TABLE `admin_personal`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `corr`
--
ALTER TABLE `corr`
  ADD PRIMARY KEY (`corr_id`,`nic`);

--
-- Indexes for table `corre_login`
--
ALTER TABLE `corre_login`
  ADD PRIMARY KEY (`login_corre_id`,`corre_personal_corre_id`),
  ADD KEY `fk_corre_login_corre_personal1_idx` (`corre_personal_corre_id`);

--
-- Indexes for table `corre_news`
--
ALTER TABLE `corre_news`
  ADD PRIMARY KEY (`corre_id`,`news_id`,`corre_personal_corre_id`),
  ADD KEY `fk_corre_news_corre_personal1_idx` (`corre_personal_corre_id`);

--
-- Indexes for table `corre_personal`
--
ALTER TABLE `corre_personal`
  ADD PRIMARY KEY (`corre_id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`news_id`);

--
-- Indexes for table `news_available`
--
ALTER TABLE `news_available`
  ADD PRIMARY KEY (`news_id`);

--
-- Indexes for table `news_completed`
--
ALTER TABLE `news_completed`
  ADD PRIMARY KEY (`news_id`);

--
-- Indexes for table `news_details`
--
ALTER TABLE `news_details`
  ADD PRIMARY KEY (`news_id`,`news_telecasted_news_id`,`news_available_news_id`,`news_completed_news_id`),
  ADD KEY `fk_news_details_news_telecasted1_idx` (`news_telecasted_news_id`),
  ADD KEY `fk_news_details_news_available1_idx` (`news_available_news_id`),
  ADD KEY `fk_news_details_news_completed1_idx` (`news_completed_news_id`);

--
-- Indexes for table `news_telecasted`
--
ALTER TABLE `news_telecasted`
  ADD PRIMARY KEY (`news_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `corr`
--
ALTER TABLE `corr`
  MODIFY `corr_id` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `news_id` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin_corre`
--
ALTER TABLE `admin_corre`
  ADD CONSTRAINT `fk_admin_corre_admin_personal1` FOREIGN KEY (`admin_personal_admin_id`) REFERENCES `admin_personal` (`admin_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `admin_login`
--
ALTER TABLE `admin_login`
  ADD CONSTRAINT `fk_admin_login_admin_personal1` FOREIGN KEY (`admin_personal_admin_id`) REFERENCES `admin_personal` (`admin_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `admin_news`
--
ALTER TABLE `admin_news`
  ADD CONSTRAINT `fk_admin_news_admin_personal1` FOREIGN KEY (`admin_personal_admin_id`) REFERENCES `admin_personal` (`admin_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `corre_login`
--
ALTER TABLE `corre_login`
  ADD CONSTRAINT `fk_corre_login_corre_personal1` FOREIGN KEY (`corre_personal_corre_id`) REFERENCES `corre_personal` (`corre_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `corre_news`
--
ALTER TABLE `corre_news`
  ADD CONSTRAINT `fk_corre_news_corre_personal1` FOREIGN KEY (`corre_personal_corre_id`) REFERENCES `corre_personal` (`corre_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `news_details`
--
ALTER TABLE `news_details`
  ADD CONSTRAINT `fk_news_details_news_available1` FOREIGN KEY (`news_available_news_id`) REFERENCES `news_available` (`news_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_news_details_news_completed1` FOREIGN KEY (`news_completed_news_id`) REFERENCES `news_completed` (`news_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_news_details_news_telecasted1` FOREIGN KEY (`news_telecasted_news_id`) REFERENCES `news_telecasted` (`news_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
