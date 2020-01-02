-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 11, 2015 at 03:31 PM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `room_for_rental`
--

-- --------------------------------------------------------

--
-- Table structure for table `adminregistration`
--

CREATE TABLE IF NOT EXISTS `adminregistration` (
  `Email_ID` varchar(20) NOT NULL,
  `Password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `adminregistration`
--

INSERT INTO `adminregistration` (`Email_ID`, `Password`) VALUES
('admin@gmail.com', '1234');

-- --------------------------------------------------------

--
-- Table structure for table `boost_table`
--

CREATE TABLE IF NOT EXISTS `boost_table` (
`Boost_ID` int(6) NOT NULL,
  `Cust_ID` varchar(6) NOT NULL,
  `Room_ID` varchar(6) NOT NULL,
  `Pay_ID` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `customer_table`
--

CREATE TABLE IF NOT EXISTS `customer_table` (
  `Cust_ID` varchar(6) NOT NULL,
  `Name` varchar(20) NOT NULL,
  `Gender` varchar(6) NOT NULL,
  `Dob` date NOT NULL,
  `Address` varchar(100) NOT NULL,
  `Mobile` int(15) NOT NULL,
  `Email` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer_table`
--

INSERT INTO `customer_table` (`Cust_ID`, `Name`, `Gender`, `Dob`, `Address`, `Mobile`, `Email`) VALUES
('52', 'Rahul C', 'male', '1991-03-20', 'Lohegaon', 1234567890, 'rahul@yahoo.com'),
('6', 'raskesh', 'male', '1994-04-04', 'klkl;kl;', 1121234454, 'ghg@ree.ihh'),
('8', 'jkjlkl', 'male', '1998-08-08', 'ffhgf', 123545, 'gfhg@frsd.hh');

-- --------------------------------------------------------

--
-- Table structure for table `cust_table`
--

CREATE TABLE IF NOT EXISTS `cust_table` (
`Cust_ID` int(11) NOT NULL,
  `Name` varchar(20) NOT NULL,
  `Gender` varchar(6) NOT NULL,
  `Dob` date NOT NULL,
  `Address` varchar(100) NOT NULL,
  `Mobile` varchar(10) NOT NULL,
  `Email_ID` varchar(30) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cust_table`
--

INSERT INTO `cust_table` (`Cust_ID`, `Name`, `Gender`, `Dob`, `Address`, `Mobile`, `Email_ID`) VALUES
(1, 'rahul', 'male', '1991-03-20', 'Camp', '9923458898', 'rahulchaubey391@gmail.com'),
(2, 'Imran', 'male', '2015-03-06', 'Mumbai', '9878548754', 'imran@gmail.com'),
(3, 'Ajay', 'male', '2015-03-05', 'Pune', '1845123667', 'ajay@gmail.com'),
(7, 'Rah', 'male', '2015-04-03', 'punemumbai', '4445455445', 'rk@g.com'),
(8, 'Hamid', 'male', '2015-04-15', 'mg road', '7787788124', 'hamid@gmail.com'),
(9, 'Ayesha', 'female', '2015-04-09', 'Pune', '7899445555', 'ayeshagadwale1990@gmail.com'),
(10, 'Pajakata', 'female', '2015-04-23', 'Shivajinagar', '7896622362', 'gayaliprajakta@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `feedback_table`
--

CREATE TABLE IF NOT EXISTS `feedback_table` (
  `Cust_ID` varchar(6) NOT NULL,
  `Room_ID` varchar(6) NOT NULL,
  `Message` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `feedback_table`
--

INSERT INTO `feedback_table` (`Cust_ID`, `Room_ID`, `Message`) VALUES
('1', '34', 'hi how r u ?'),
('1', '34', 'hi............'),
('1', '34', 'hello.........'),
('1', '34', ''),
('1', '36', 'hi....\r\nadmin....\r\nhw r u ?');

-- --------------------------------------------------------

--
-- Table structure for table `genderdemo`
--

CREATE TABLE IF NOT EXISTS `genderdemo` (
  `gender` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `genderdemo`
--

INSERT INTO `genderdemo` (`gender`) VALUES
('Female');

-- --------------------------------------------------------

--
-- Table structure for table `getalert_table`
--

CREATE TABLE IF NOT EXISTS `getalert_table` (
`Alert_ID` int(11) NOT NULL,
  `Cust_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `locality`
--

CREATE TABLE IF NOT EXISTS `locality` (
`locality_id` int(6) NOT NULL,
  `locality` varchar(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `locality`
--

INSERT INTO `locality` (`locality_id`, `locality`) VALUES
(1, 'Narayan Peth'),
(2, 'Camp'),
(3, 'Pulgate'),
(4, 'Nana Peth'),
(5, 'Bhavani Peth'),
(6, 'lohegaon');

-- --------------------------------------------------------

--
-- Table structure for table `login_table`
--

CREATE TABLE IF NOT EXISTS `login_table` (
  `Email_ID` varchar(30) NOT NULL DEFAULT '',
  `Password` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login_table`
--

INSERT INTO `login_table` (`Email_ID`, `Password`) VALUES
('aboli@gmail.com', '1234'),
('ajay@gmail.com', '124'),
('ayeshagadwale1990@gmail.com', '123'),
('gayaliprajakta@gmail.com', '123'),
('hamid@gmail.com', '321'),
('imran@gmail.com', '1236'),
('rah@hotmail.com', '369'),
('rahulchaubey391@gmail.com', '123'),
('rk@g.com', '12');

-- --------------------------------------------------------

--
-- Table structure for table `post_room`
--

CREATE TABLE IF NOT EXISTS `post_room` (
`Room_ID` int(11) NOT NULL,
  `Cust_ID` int(11) NOT NULL,
  `Address` varchar(100) NOT NULL,
  `City` varchar(20) NOT NULL,
  `Locality` varchar(20) NOT NULL,
  `Price` int(10) NOT NULL,
  `Bedroom` enum('RK','1BHK','2BHK','3BHK') NOT NULL,
  `Furnished` varchar(20) NOT NULL,
  `Area` int(10) NOT NULL,
  `Status` varchar(10) NOT NULL DEFAULT 'available',
  `Verification` varchar(15) NOT NULL DEFAULT 'unverify'
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `post_room`
--

INSERT INTO `post_room` (`Room_ID`, `Cust_ID`, `Address`, `City`, `Locality`, `Price`, `Bedroom`, `Furnished`, `Area`, `Status`, `Verification`) VALUES
(8, 1, 'lohegaon', 'pune', 'Nana Peth', 2500, 'RK', 'yes', 750, 'available', 'verified'),
(12, 1, 'pune', 'pune', 'Bhavani Peth', 8000, '3BHK', 'yes', 2000, 'available', 'verified'),
(13, 1, 'lohegaon', 'Pune', 'Nana Peth', 2200, '2BHK', 'yes', 1200, 'available', 'verified'),
(14, 3, 'Flat no11,near deccan zymkhana', 'Mumbai', 'Pulgate', 6000, '1BHK', 'yes', 1000, 'available', 'unverify'),
(16, 2, 'Kondwa', 'Pune', 'Bhavani Peth', 9000, '2BHK', 'yes', 1320, 'available', 'verified'),
(19, 2, 'Kondwa', 'Pune', 'Narayan Peth', 5000, '2BHK', 'no', 1320, 'available', 'verified'),
(20, 2, 'pune', 'Pune', 'Narayan Peth', 8100, '3BHK', 'yes', 501, 'booked', 'verified'),
(21, 2, 'mg road dldsslsf', 'new york', 'lohegaon', 4521233, '1BHK', 'no', 1000, 'available', 'verified'),
(22, 7, 'dsadsa', 'Pune', 'Camp', 7000, '1BHK', 'yes', 123, 'available', 'verified'),
(23, 8, 'camp', 'mumbai', 'Camp', 2546, '1BHK', 'yes', 1245, 'booked', 'verified'),
(24, 8, 'swargate', 'Pune', 'Nana Peth', 6000, '3BHK', 'yes', 25000, 'available', 'verified'),
(25, 2, 'cme dapodi', 'mumbai', 'Nana Peth', 87784, '2BHK', 'yes', 365, 'available', 'verified'),
(26, 2, 'dgfdf', 'fgd', 'Pulgate', 4564, '1BHK', 'yes', 454, 'available', 'unverify'),
(27, 2, 'new', 'new', 'Narayan Peth', 8, 'RK', 'yes', 0, 'available', 'unverify'),
(28, 2, 'borivali', 'Kanpur', 'Bhavani Peth', 4520, '3BHK', 'yes', 5632, 'available', 'verified'),
(29, 1, 'mahavir', 'banaras', 'lohegaon', 5600, '3BHK', 'yes', 1250, 'available', 'unverify'),
(30, 1, 'mg road nr xyz mall', 'Pune', 'Camp', 4502, '1BHK', 'yes', 1200, 'available', 'unverify'),
(31, 1, 'abc mall', 'Kanpur', 'Pulgate', 2540, '1BHK', 'yes', 1254, 'available', 'unverify'),
(32, 1, 'xyz', 'Pune', 'Camp', 2540, '1BHK', 'yes', 2111, 'available', 'unverify'),
(33, 1, 'bnm', 'Pune', 'lohegaon', 1253, 'RK', 'yes', 1235, 'available', 'unverify'),
(34, 1, 'kjl', 'Kanpur', 'Bhavani Peth', 1245, '1BHK', 'yes', 4512, 'available', 'unverify'),
(35, 2, 'mnb', 'nashik', 'Pulgate', 4521, '1BHK', 'yes', 2121, 'available', 'verified'),
(36, 1, 'Near to PC,Block no10', 'Pune', 'Bhavani Peth', 6000, '1BHK', 'yes', 1000, 'available', 'unverify');

-- --------------------------------------------------------

--
-- Table structure for table `post_room_table`
--

CREATE TABLE IF NOT EXISTS `post_room_table` (
`Room_ID` int(6) NOT NULL,
  `Cust_ID` varchar(6) NOT NULL,
  `Address` varchar(100) NOT NULL,
  `City` varchar(20) NOT NULL,
  `Locality` varchar(10) NOT NULL,
  `Price` int(10) NOT NULL,
  `Bedroom` enum('RK','1BHK','2BHK','3BHK') NOT NULL,
  `Furnished` varchar(20) NOT NULL,
  `Area_to` int(10) NOT NULL,
  `Area_from` int(10) NOT NULL,
  `Status` varchar(10) NOT NULL DEFAULT 'inactive',
  `Verified` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `registration`
--

CREATE TABLE IF NOT EXISTS `registration` (
  `Name` varchar(20) NOT NULL,
  `Email_ID` varchar(30) NOT NULL,
  `Password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `registration`
--

INSERT INTO `registration` (`Name`, `Email_ID`, `Password`) VALUES
('Aboli', 'aboli@gmail.com', '1234'),
('Ajay', 'ajay@gmail.com', '124'),
('Ayesha', 'ayeshagadwale1990@gmail.com', '123'),
('Pajakata', 'gayaliprajakta@gmail.com', '123'),
('Hamid', 'hamid@gmail.com', '321'),
('Imran', 'imran@gmail.com', '1236'),
('rahul', 'rah@hotmail.com', '369'),
('Rahul', 'rahulchaubey391@gmail.com', '123'),
('Rah', 'rk@g.com', '12');

-- --------------------------------------------------------

--
-- Table structure for table `requirement_table`
--

CREATE TABLE IF NOT EXISTS `requirement_table` (
`Requirement_ID` int(11) NOT NULL,
  `Cust_ID` int(11) NOT NULL,
  `Address` varchar(20) NOT NULL,
  `City` varchar(20) NOT NULL,
  `Locality` varchar(20) NOT NULL,
  `Budget` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `requirement_table`
--

INSERT INTO `requirement_table` (`Requirement_ID`, `Cust_ID`, `Address`, `City`, `Locality`, `Budget`) VALUES
(1, 1, 'Modi ganpati', 'Pune', 'Bhavani Peth', 6533),
(3, 3, 'dhanori', 'pune', 'Bhavani Peth', 45564),
(4, 7, 'mg road poona clg', 'Pune', 'Bhavani Peth', 97878),
(5, 2, 'Camp', 'Pune', 'lohegaon', 3000),
(6, 2, 'Near Glovar Center', 'Pune', 'Camp', 9000),
(7, 3, 'Near to deccan', 'Pune', 'Camp', 10000),
(8, 1, 'mahavir mandir', 'banaras', 'lohegaon', 6599),
(11, 9, 'near campus', 'mumbai', 'Camp', 12365),
(13, 10, 'mnc', 'mumbai', 'Nana Peth', 45632),
(14, 10, 'xyz', 'Pune', 'Nana Peth', 5632),
(16, 10, 'dfg', 'Pune', 'Narayan Peth', 4545),
(18, 1, 'dapodi', 'Pune', 'Pulgate', 3665);

-- --------------------------------------------------------

--
-- Table structure for table `shortlist_table`
--

CREATE TABLE IF NOT EXISTS `shortlist_table` (
`Shortlist_ID` int(11) NOT NULL,
  `Room_ID` int(11) NOT NULL,
  `Cust_ID` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shortlist_table`
--

INSERT INTO `shortlist_table` (`Shortlist_ID`, `Room_ID`, `Cust_ID`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 2, 1),
(4, 2, 1),
(5, 1, 1),
(6, 9, 4561),
(7, 1, 1),
(8, 8, 1),
(9, 8, 1),
(10, 19, 2),
(11, 16, 2),
(12, 19, 2),
(13, 8, 1),
(14, 8, 1),
(15, 12, 1),
(16, 12, 1),
(17, 12, 1),
(18, 12, 1),
(19, 12, 1),
(20, 12, 1),
(21, 12, 1),
(22, 12, 1),
(23, 12, 1),
(24, 0, 0),
(25, 12, 1),
(26, 0, 0),
(27, 0, 0),
(28, 0, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adminregistration`
--
ALTER TABLE `adminregistration`
 ADD PRIMARY KEY (`Email_ID`);

--
-- Indexes for table `boost_table`
--
ALTER TABLE `boost_table`
 ADD PRIMARY KEY (`Boost_ID`), ADD KEY `Cust_ID` (`Cust_ID`,`Room_ID`,`Pay_ID`);

--
-- Indexes for table `customer_table`
--
ALTER TABLE `customer_table`
 ADD PRIMARY KEY (`Cust_ID`);

--
-- Indexes for table `cust_table`
--
ALTER TABLE `cust_table`
 ADD PRIMARY KEY (`Cust_ID`);

--
-- Indexes for table `feedback_table`
--
ALTER TABLE `feedback_table`
 ADD KEY `Cust_ID` (`Cust_ID`,`Room_ID`), ADD KEY `Room_ID` (`Room_ID`);

--
-- Indexes for table `getalert_table`
--
ALTER TABLE `getalert_table`
 ADD PRIMARY KEY (`Alert_ID`), ADD KEY `Cust_ID` (`Cust_ID`);

--
-- Indexes for table `locality`
--
ALTER TABLE `locality`
 ADD PRIMARY KEY (`locality_id`);

--
-- Indexes for table `login_table`
--
ALTER TABLE `login_table`
 ADD PRIMARY KEY (`Email_ID`);

--
-- Indexes for table `post_room`
--
ALTER TABLE `post_room`
 ADD PRIMARY KEY (`Room_ID`), ADD KEY `Cust_ID` (`Cust_ID`);

--
-- Indexes for table `post_room_table`
--
ALTER TABLE `post_room_table`
 ADD PRIMARY KEY (`Room_ID`), ADD KEY `Cust_ID` (`Cust_ID`);

--
-- Indexes for table `registration`
--
ALTER TABLE `registration`
 ADD PRIMARY KEY (`Email_ID`);

--
-- Indexes for table `requirement_table`
--
ALTER TABLE `requirement_table`
 ADD PRIMARY KEY (`Requirement_ID`), ADD KEY `Cust_ID` (`Cust_ID`), ADD KEY `Cust_ID_2` (`Cust_ID`);

--
-- Indexes for table `shortlist_table`
--
ALTER TABLE `shortlist_table`
 ADD PRIMARY KEY (`Shortlist_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `boost_table`
--
ALTER TABLE `boost_table`
MODIFY `Boost_ID` int(6) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cust_table`
--
ALTER TABLE `cust_table`
MODIFY `Cust_ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `getalert_table`
--
ALTER TABLE `getalert_table`
MODIFY `Alert_ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `locality`
--
ALTER TABLE `locality`
MODIFY `locality_id` int(6) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `post_room`
--
ALTER TABLE `post_room`
MODIFY `Room_ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT for table `post_room_table`
--
ALTER TABLE `post_room_table`
MODIFY `Room_ID` int(6) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `requirement_table`
--
ALTER TABLE `requirement_table`
MODIFY `Requirement_ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `shortlist_table`
--
ALTER TABLE `shortlist_table`
MODIFY `Shortlist_ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=29;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `getalert_table`
--
ALTER TABLE `getalert_table`
ADD CONSTRAINT `getalert_table_ibfk_1` FOREIGN KEY (`Cust_ID`) REFERENCES `cust_table` (`Cust_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `login_table`
--
ALTER TABLE `login_table`
ADD CONSTRAINT `login_table_ibfk_1` FOREIGN KEY (`Email_ID`) REFERENCES `registration` (`Email_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `post_room`
--
ALTER TABLE `post_room`
ADD CONSTRAINT `FOREIGN KEY` FOREIGN KEY (`Cust_ID`) REFERENCES `cust_table` (`Cust_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `post_room_table`
--
ALTER TABLE `post_room_table`
ADD CONSTRAINT `post_room_table_ibfk_1` FOREIGN KEY (`Cust_ID`) REFERENCES `customer_table` (`Cust_ID`);

--
-- Constraints for table `requirement_table`
--
ALTER TABLE `requirement_table`
ADD CONSTRAINT `requirement_table_ibfk_1` FOREIGN KEY (`Cust_ID`) REFERENCES `cust_table` (`Cust_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
