-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 09, 2020 at 07:09 PM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.1.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `precision`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `aid` int(11) NOT NULL,
  `uid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`aid`, `uid`) VALUES
(1, 41),
(2, 42),
(3, 43),
(4, 44),
(5, 45);

-- --------------------------------------------------------

--
-- Table structure for table `alloted`
--

CREATE TABLE `alloted` (
  `bid` int(11) NOT NULL,
  `cid` int(11) NOT NULL,
  `status` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `cdate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `alloted`
--

INSERT INTO `alloted` (`bid`, `cid`, `status`, `cdate`) VALUES
(8, 16, 'SCHEDULED', '0000-00-00'),
(1, 15, 'RESCHEDULE', '0000-00-00'),
(19, 18, 'SCHEDULED', '0000-00-00'),
(15, 2, 'RESCHEDULE', '0000-00-00'),
(23, 8, 'SCHEDULED', '0000-00-00'),
(18, 7, 'RESCHEDULE', '0000-00-00'),
(33, 20, 'SCHEDULED', '0000-00-00'),
(39, 11, 'RESCHEDULE', '0000-00-00'),
(29, 18, 'SCHEDULED', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `bid` int(11) NOT NULL,
  `tid` int(11) NOT NULL,
  `custid` int(11) NOT NULL,
  `bdate` date NOT NULL,
  `sdate` date NOT NULL,
  `collection_type` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `amount` bigint(20) NOT NULL,
  `transaction_id` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `result` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `report` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`bid`, `tid`, `custid`, `bdate`, `sdate`, `collection_type`, `amount`, `transaction_id`, `status`, `result`, `report`) VALUES
(1, 8, 20, '2003-12-16', '2018-06-04', 'INHOUSE', 1026, 'T000232616', 'COLLECTED', 'PENDING', 'MEDIUM'),
(2, 4, 15, '2014-05-02', '2002-08-04', 'HOME', 784, 'T000465345', 'COLLECTED', 'PENDING', 'BETTER'),
(3, 6, 6, '2019-07-26', '2020-06-14', 'INHOUSE', 519, 'T000374239', 'CANCELLED_', 'DONE', 'WORST'),
(4, 4, 7, '2007-09-11', '2007-03-13', 'INHOUSE', 2035, 'T000405764', 'CANCELLED_', 'DONE', 'BAD'),
(5, 2, 8, '2014-09-20', '2013-08-05', 'HOME', 1136, 'T000332567', 'CANCELLED_', 'DONE', 'WORST'),
(6, 1, 4, '2019-04-17', '2006-08-11', 'HOME', 1950, 'T000190211', 'SCHEDULED', 'PENDING', 'WORST'),
(7, 16, 11, '1997-10-06', '2005-06-11', 'INHOUSE', 1935, 'T000428097', 'CANCELLED_', 'PENDING', 'WORST'),
(8, 6, 9, '1998-02-13', '2003-06-15', 'INHOUSE', 1675, 'T000565615', 'CANCELLED_', 'PENDING', 'BETTER'),
(9, 17, 17, '2019-03-03', '2000-07-16', 'INHOUSE', 784, 'T000435674', 'CANCELLED_', 'PENDING', 'WORSE'),
(10, 16, 17, '2001-05-26', '2005-02-14', 'HOME', 1570, 'T000105600', 'CANCELLED_', 'PENDING', 'BAD'),
(11, 8, 16, '1996-11-26', '2002-12-20', 'INHOUSE', 416, 'T000196670', 'COMPLETED', 'DONE', 'WORSE'),
(12, 7, 8, '2019-08-27', '2009-02-06', 'INHOUSE', 587, 'T000814112', 'COLLECTED', 'PENDING', 'MEDIUM'),
(13, 10, 20, '2011-02-04', '2019-06-24', 'HOME', 2195, 'T000963125', 'COLLECTED', 'PENDING', 'BETTER'),
(14, 18, 12, '2005-06-17', '2012-09-09', 'HOME', 1336, 'T000132178', 'CANCELLED_', 'PENDING', 'BAD'),
(15, 18, 13, '2012-02-28', '2017-05-14', 'INHOUSE', 1876, 'T000384913', 'SCHEDULED', 'DONE', 'MEDIUM'),
(16, 7, 1, '2003-08-07', '2017-05-07', 'HOME', 295, 'T000361430', 'COLLECTED', 'DONE', 'WORST'),
(17, 4, 6, '2011-06-19', '2009-03-20', 'HOME', 848, 'T000364312', 'COLLECTED', 'PENDING', 'BAD'),
(18, 14, 16, '2005-08-23', '2013-09-26', 'HOME', 495, 'T000669454', 'COMPLETED', 'PENDING', 'BEST'),
(19, 5, 1, '2009-04-15', '2020-02-05', 'HOME', 387, 'T000768619', 'COMPLETED', 'DONE', 'BAD'),
(20, 3, 1, '1994-04-27', '2006-03-25', 'INHOUSE', 2134, 'T000318196', 'COLLECTED', 'PENDING', 'GOOD'),
(21, 13, 1, '2002-03-10', '2011-02-01', 'INHOUSE', 505, 'T000192979', 'SCHEDULED', 'PENDING', 'MEDIUM'),
(22, 6, 10, '2013-04-03', '2016-02-10', 'INHOUSE', 1361, 'T000193946', 'SCHEDULED', 'PENDING', 'MEDIUM'),
(23, 4, 15, '2006-02-23', '2008-12-26', 'HOME', 416, 'T000367687', 'BOOKED', 'PENDING', 'BETTER'),
(24, 12, 10, '2001-02-26', '2020-04-28', 'INHOUSE', 690, 'T000109480', 'COLLECTED', 'PENDING', 'WORST'),
(25, 5, 15, '2014-07-14', '2019-10-09', 'INHOUSE', 651, 'T000305433', 'COMPLETED', 'PENDING', 'WORSE'),
(26, 5, 5, '2011-12-08', '2004-08-08', 'HOME', 985, 'T000435891', 'SCHEDULED', 'DONE', 'WORSE'),
(27, 7, 2, '2011-10-03', '2001-02-05', 'INHOUSE', 1128, 'T000273139', 'SCHEDULED', 'PENDING', 'MEDIUM'),
(28, 7, 14, '2018-12-23', '2017-06-18', 'INHOUSE', 1634, 'T000152752', 'COMPLETED', 'DONE', 'WORST'),
(29, 15, 2, '2017-03-07', '2008-05-10', 'INHOUSE', 617, 'T000387518', 'CANCELLED_', 'PENDING', 'WORSE'),
(30, 12, 6, '2009-02-25', '2011-02-13', 'HOME', 1468, 'T000373558', 'SCHEDULED', 'DONE', 'BETTER'),
(31, 18, 5, '2017-08-25', '2020-04-09', 'HOME', 1708, 'T000278181', 'COMPLETED', 'PENDING', 'GOOD'),
(32, 4, 13, '2018-07-15', '2001-04-24', 'HOME', 2482, 'T000245599', 'COLLECTED', 'DONE', 'MEDIUM'),
(33, 1, 10, '1992-08-27', '2015-02-27', 'HOME', 1901, 'T000187858', 'CANCELLED_', 'PENDING', 'GOOD'),
(34, 16, 1, '1997-01-22', '2007-06-25', 'INHOUSE', 1573, 'T000382394', 'COLLECTED', 'PENDING', 'BAD'),
(35, 14, 3, '2015-08-28', '2004-07-11', 'HOME', 1905, 'T000327918', 'BOOKED', 'PENDING', 'BETTER'),
(36, 15, 17, '1991-10-15', '2020-12-04', 'INHOUSE', 1030, 'T000314336', 'CANCELLED_', 'PENDING', 'WORST'),
(37, 15, 2, '1996-10-12', '2003-12-05', 'HOME', 819, 'T000395921', 'COLLECTED', 'PENDING', 'WORST'),
(38, 16, 12, '2009-06-19', '2004-07-17', 'INHOUSE', 1906, 'T000398278', 'COLLECTED', 'PENDING', 'GOOD'),
(39, 9, 4, '2013-10-01', '2009-03-08', 'INHOUSE', 1372, 'T000451800', 'COLLECTED', 'DONE', 'MEDIUM'),
(40, 7, 19, '2002-05-01', '2007-09-05', 'HOME', 1021, 'T000214839', 'BOOKED', 'PENDING', 'WORSE'),
(41, 9, 8, '2019-05-25', '2011-08-16', 'INHOUSE', 263, 'T000273565', 'SCHEDULED', 'PENDING', 'GOOD'),
(42, 13, 19, '2003-04-25', '2013-04-06', 'HOME', 1409, 'T000158420', 'CANCELLED_', 'DONE', 'BEST'),
(43, 14, 17, '2016-03-15', '2001-01-27', 'HOME', 1278, 'T000355401', 'COMPLETED', 'PENDING', 'MEDIUM'),
(44, 7, 12, '2014-10-28', '2008-03-25', 'HOME', 2475, 'T000331905', 'COMPLETED', 'PENDING', 'WORSE'),
(45, 14, 2, '2007-12-14', '2006-05-20', 'INHOUSE', 1088, 'T000274541', 'COMPLETED', 'PENDING', 'WORSE'),
(46, 11, 20, '2007-04-15', '2011-07-10', 'INHOUSE', 1144, 'T000298537', 'CANCELLED_', 'DONE', 'BEST'),
(47, 7, 17, '2016-02-05', '2006-11-06', 'HOME', 1270, 'T000413419', 'CANCELLED_', 'PENDING', 'BEST'),
(48, 5, 14, '2003-01-09', '2010-01-05', 'INHOUSE', 1186, 'T000286057', 'CANCELLED_', 'DONE', 'WORST'),
(49, 18, 9, '2007-03-11', '2002-08-06', 'INHOUSE', 1079, 'T000914044', 'COLLECTED', 'PENDING', 'GOOD'),
(50, 18, 8, '2007-09-07', '2012-09-03', 'INHOUSE', 760, 'T000183769', 'COLLECTED', 'PENDING', 'BETTER'),
(51, 16, 16, '2016-02-19', '2000-08-18', 'INHOUSE', 1479, 'T000103714', 'SCHEDULED', 'DONE', 'BETTER'),
(52, 9, 12, '2020-08-10', '2005-08-17', 'INHOUSE', 1883, 'T000299062', 'SCHEDULED', 'DONE', 'WORST'),
(53, 4, 8, '2011-09-11', '2017-08-07', 'INHOUSE', 743, 'T000215886', 'CANCELLED_', 'PENDING', 'GOOD'),
(54, 17, 6, '2005-05-07', '2001-06-18', 'INHOUSE', 677, 'T000196659', 'BOOKED', 'PENDING', 'GOOD'),
(55, 11, 3, '1992-12-28', '2018-03-11', 'HOME', 1902, 'T000278467', 'COMPLETED', 'DONE', 'BAD'),
(56, 11, 19, '2001-01-26', '2016-10-01', 'HOME', 1708, 'T000290044', 'CANCELLED_', 'DONE', 'GOOD'),
(57, 4, 17, '2006-08-16', '2018-09-25', 'HOME', 1660, 'T000220046', 'BOOKED', 'DONE', 'WORST'),
(58, 5, 5, '2014-12-14', '2008-05-23', 'HOME', 1060, 'T000366053', 'CANCELLED_', 'DONE', 'MEDIUM'),
(59, 6, 12, '1995-12-07', '2005-08-01', 'HOME', 856, 'T000259203', 'CANCELLED_', 'PENDING', 'BETTER'),
(60, 5, 5, '2005-06-02', '2018-09-07', 'HOME', 470, 'T000429307', 'SCHEDULED', 'DONE', 'MEDIUM'),
(61, 19, 8, '2020-07-08', '2020-07-08', 'INHOUSE', 1028, 'T1582165', 'SCHEDULED', 'PENDING', 'GOOD'),
(62, 6, 8, '2020-07-08', '2020-07-08', 'HOME', 2367, 'T000169860', 'SCHEDULED', 'PENDING', 'GOOD');

-- --------------------------------------------------------

--
-- Table structure for table `collector`
--

CREATE TABLE `collector` (
  `cid` int(11) NOT NULL,
  `uid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `collector`
--

INSERT INTO `collector` (`cid`, `uid`) VALUES
(1, 46),
(2, 47),
(3, 48),
(4, 49),
(5, 50),
(6, 51),
(7, 52),
(8, 53),
(9, 54),
(10, 55),
(11, 56),
(12, 57),
(13, 58),
(14, 59),
(15, 60),
(16, 61),
(17, 62),
(18, 63),
(19, 64),
(20, 65);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `custid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `dob` date NOT NULL,
  `blood_group` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `gender` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  `pincode` bigint(20) NOT NULL,
  `email` varchar(30) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`custid`, `uid`, `dob`, `blood_group`, `gender`, `pincode`, `email`) VALUES
(1, 10, '1993-12-08', 'B+', 'F', 999558, 'elwanda_turner@outlook.com'),
(2, 11, '2012-02-10', 'A+', 'F', 468080, 'cicely_hayes@yahoo.com'),
(3, 1, '2012-01-04', 'A+', 'F', 545185, 'sunshine_rodriguez@gmail.com'),
(4, 6, '2018-07-11', 'AB-', 'M', 575327, 'cicely_alexander@gmail.com'),
(5, 12, '1997-02-22', 'B+', 'M', 244222, 'birgit_ramirez@yahoo.com'),
(6, 15, '2020-10-24', 'A-', 'F', 211305, 'lilliana_roberts@outlook.com'),
(7, 13, '2011-07-22', 'A-', 'M', 578867, 'valery_brooks@yahoo.com'),
(8, 14, '2018-05-23', 'B-', 'F', 264806, 'gina_cooper@yahoo.com'),
(9, 16, '2011-01-23', 'B-', 'M', 815565, 'susanna_washington@gmail.com'),
(10, 18, '2006-08-22', 'AB-', 'M', 871076, 'fern_young@yahoo.com'),
(11, 20, '1996-08-13', 'A-', 'F', 387338, 'kaitlyn_long@outlook.com'),
(12, 21, '2005-07-11', 'A+', 'M', 581309, 'marvella_diaz@gmail.com'),
(13, 17, '2010-06-11', 'AB-', 'F', 616980, 'jeanetta_diaz@yahoo.com'),
(14, 2, '2013-05-04', 'B+', 'F', 558976, 'magda_green@gmail.com'),
(15, 23, '2007-11-18', 'A-', 'F', 535701, 'jaymie_jackson@hotmail.com'),
(16, 24, '1990-01-20', 'B-', 'F', 819985, 'marvella_moore@hotmail.com'),
(17, 26, '2004-08-13', 'AB+', 'F', 442717, 'zelda_edwards@yahoo.com'),
(18, 27, '1994-05-23', 'B-', 'F', 194795, 'zelda_king@yahoo.com'),
(19, 19, '2011-03-13', 'AB-', 'F', 692356, 'fern_thompson@yahoo.com'),
(20, 29, '2012-05-13', 'B-', 'F', 158123, 'cicely_adams@gmail.com'),
(21, 22, '2015-07-09', 'AB+', 'F', 961474, 'malika_jackson@outlook.com'),
(22, 25, '1990-07-16', 'AB-', 'F', 767215, 'anja_ward@yahoo.com'),
(23, 28, '1994-03-13', 'A+', 'M', 556956, 'marlena_scott@outlook.com'),
(24, 31, '2005-03-01', 'A+', 'F', 962049, 'laurena_flores@gmail.com'),
(25, 30, '2007-03-27', 'AB-', 'M', 496909, 'celina_cook@yahoo.com'),
(26, 32, '2013-10-14', 'B-', 'F', 596964, 'magda_lewis@hotmail.com'),
(27, 34, '2011-07-03', 'AB+', 'F', 890396, 'vikki_moore@gmail.com'),
(28, 36, '2012-09-27', 'AB-', 'F', 431228, 'magda_murphy@outlook.com'),
(29, 33, '1990-10-15', 'A-', 'F', 797366, 'magda_peterson@hotmail.com'),
(30, 35, '1994-09-08', 'AB+', 'F', 295585, 'lyla_edwards@hotmail.com'),
(31, 37, '2016-04-05', 'AB+', 'M', 920058, 'malena_washington@hotmail.com'),
(32, 38, '2016-09-11', 'B+', 'F', 971020, 'gina_stewart@yahoo.com'),
(33, 39, '2018-11-01', 'A-', 'F', 653559, 'fredrick_long@hotmail.com'),
(34, 40, '1991-03-16', 'AB-', 'M', 478000, 'sunshine_brooks@hotmail.com'),
(35, 4, '1996-11-15', 'A+', 'F', 804044, 'lashunda_powell@outlook.com'),
(36, 5, '1992-10-28', 'B-', 'M', 728052, 'lyla_gonzales@hotmail.com'),
(37, 7, '2008-11-08', 'B+', 'M', 590711, 'foster_rogers@yahoo.com'),
(38, 8, '1999-01-02', 'AB-', 'M', 989199, 'marvis_young@yahoo.com'),
(39, 3, '2012-04-11', 'B+', 'F', 786917, 'lyla_ward@outlook.com'),
(40, 9, '1999-12-20', 'A-', 'F', 706241, 'zola_jenkins@yahoo.com');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `did` int(11) NOT NULL,
  `dname` varchar(30) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`did`, `dname`) VALUES
(1, 'Immunology'),
(2, 'Chemistry'),
(3, 'Surgical Pathology'),
(4, 'Transfusion Services'),
(5, 'Hematology'),
(6, 'Cytology'),
(7, 'Microbiology');

-- --------------------------------------------------------

--
-- Table structure for table `equipment`
--

CREATE TABLE `equipment` (
  `eid` int(11) NOT NULL,
  `ename` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `did` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `working` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `equipment`
--

INSERT INTO `equipment` (`eid`, `ename`, `did`, `quantity`, `working`) VALUES
(1, 'Water Bath', 4, 16, 5),
(2, 'Hot Plate', 3, 17, 6),
(3, 'Rain Gauge', 3, 10, 6),
(4, 'Counting Chamber', 5, 16, 6),
(5, 'Incubator B.O.D Incubator', 7, 15, 3),
(6, 'Semi Auto Analyzer', 4, 18, 4),
(7, 'Haemometer', 6, 17, 5),
(8, 'Microscopes (Monocular & Binocular)', 1, 11, 5),
(9, 'ESR Stand', 1, 18, 5),
(10, 'Glucometer', 1, 18, 9),
(11, 'R.B.C. & W.B.C. Pipette', 3, 17, 5),
(12, 'Deep Fridge', 1, 20, 6),
(13, 'Distilation Apparatus', 1, 12, 6),
(14, 'Hot Air Oven', 5, 13, 9),
(15, 'Colorimeter', 2, 14, 4),
(16, 'hearing Mantle', 2, 17, 4),
(17, 'Dispensing Scale (Digital & Non Digital)', 4, 15, 7),
(18, 'Stirrer', 5, 20, 4),
(19, 'Haemocytometer', 4, 19, 4),
(20, 'Autoclave', 2, 10, 5),
(21, 'Centrifuse Machine (Manual & Electric)', 7, 16, 4),
(22, 'P.H. Meter', 5, 10, 4),
(23, 'Blood Gas Analyzer', 6, 16, 7),
(24, 'Micro Pipette', 5, 17, 6),
(25, 'Blood Cell Counter', 4, 16, 7),
(26, 'Furnace', 5, 20, 7),
(27, 'Auto Analyzer', 6, 17, 5),
(28, 'Stop Watch', 7, 19, 8);

-- --------------------------------------------------------

--
-- Table structure for table `operator`
--

CREATE TABLE `operator` (
  `oid` int(11) NOT NULL,
  `uid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `operator`
--

INSERT INTO `operator` (`oid`, `uid`) VALUES
(1, 66),
(2, 67),
(3, 68),
(4, 69),
(5, 70),
(6, 71),
(7, 72);

-- --------------------------------------------------------

--
-- Table structure for table `requires`
--

CREATE TABLE `requires` (
  `tid` int(11) NOT NULL,
  `eid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `requires`
--

INSERT INTO `requires` (`tid`, `eid`) VALUES
(1, 7),
(1, 12),
(1, 18),
(1, 21),
(2, 6),
(2, 18),
(3, 10),
(3, 13),
(4, 6),
(4, 10),
(4, 16),
(4, 24),
(5, 1),
(5, 16),
(6, 21),
(7, 14),
(7, 25),
(7, 26),
(8, 10),
(8, 22),
(9, 26),
(10, 13),
(10, 21),
(11, 6),
(11, 12),
(11, 14),
(11, 20),
(12, 2),
(12, 15),
(12, 23),
(13, 22),
(13, 26),
(14, 10),
(15, 3),
(16, 23),
(16, 24),
(17, 2),
(17, 5),
(17, 15);

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

CREATE TABLE `test` (
  `tid` int(11) NOT NULL,
  `testname` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `did` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `preparation` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `inhouse` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `test`
--

INSERT INTO `test` (`tid`, `testname`, `did`, `price`, `preparation`, `inhouse`) VALUES
(1, 'T19', 2, 552, 'P6', 1),
(2, 'T20', 4, 1724, 'P12', 1),
(3, 'T4', 3, 1785, 'P20', 1),
(4, 'T14', 7, 454, 'P2', 0),
(5, 'T11', 6, 2428, 'P2', 0),
(6, 'T12', 4, 2367, 'P20', 1),
(7, 'T18', 2, 1859, 'P16', 1),
(8, 'T6', 2, 913, 'P12', 1),
(9, 'T2', 5, 767, 'P3', 1),
(10, 'T16', 5, 1294, 'P12', 0),
(11, 'T17', 7, 2494, 'P1', 1),
(12, 'T5', 1, 1682, 'P17', 1),
(13, 'T9', 2, 2389, 'P19', 1),
(14, 'T15', 4, 1616, 'P9', 1),
(15, 'T1', 2, 1460, 'P20', 1),
(16, 'T7', 5, 1941, 'P14', 0),
(17, 'T8', 4, 609, 'P1', 1),
(18, 'T13', 7, 868, 'P15', 0),
(19, 'T10', 3, 1028, 'P19', 0),
(20, 'T3', 6, 2306, 'P18', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `uid` int(11) NOT NULL,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `phone` bigint(20) NOT NULL,
  `uname` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `pwd` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(10) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`uid`, `name`, `address`, `phone`, `uname`, `pwd`, `type`) VALUES
(1, 'Lyla Butler', '11 Jungle Road, Leominster MA 1453', 3161469757, 'lyla', 'butler', 'CUSTOMER'),
(2, 'Audrea Martin', '700 Oak Street, Brockton MA 2301', 3925292734, 'audrea', 'martin', 'CUSTOMER'),
(3, 'Sunshine Taylor', '2055 Niagara Falls Blvd, Amherst NY 14228', 5734471378, 'sunshine', 'taylor', 'CUSTOMER'),
(4, 'Genie Watson', '1105 Boston Road, Springfield MA 1119', 1163981010, 'genie', 'watson', 'CUSTOMER'),
(5, 'Lorrie Ramirez', '55 Brooksby Village Way, Danvers MA 1923', 6510761020, 'lorrie', 'ramirez', 'CUSTOMER'),
(6, 'Sallie Richardson', '300 Colony Place, Plymouth MA 2360', 7030296959, 'sallie', 'richardson', 'CUSTOMER'),
(7, 'Zelda Smith', '42 Fairhaven Commons Way, Fairhaven MA 2719', 3303021513, 'zelda', 'smith', 'CUSTOMER'),
(8, 'Alphonse Patterson', '101 Sanford Farm Shpg Center, Amsterdam NY 12010', 5706048162, 'alphonse', 'patterson', 'CUSTOMER'),
(9, 'Genie Rivera', '36 Paramount Drive, Raynham MA 2767', 7975616491, 'genie', 'rivera', 'CUSTOMER'),
(10, 'Elwanda Reed', '4133 Veterans Memorial Drive, Batavia NY 14020', 2578265404, 'elwanda', 'reed', 'CUSTOMER'),
(11, 'Carmela Anderson', '1470 S Washington St, North Attleboro MA 2760', 2222272932, 'carmela', 'anderson', 'CUSTOMER'),
(12, 'Stanley Ross', '180 North King Street, Northhampton MA 1060', 8413508979, 'stanley', 'ross', 'CUSTOMER'),
(13, 'Genie Lewis', '301 Massachusetts Ave, Lunenburg MA 1462', 8716596489, 'genie', 'lewis', 'CUSTOMER'),
(14, 'Porsche Robinson', '66-4 Parkhurst Rd, Chelmsford MA 1824', 8366360581, 'porsche', 'robinson', 'CUSTOMER'),
(15, 'Malena Ward', '301 Massachusetts Ave, Lunenburg MA 1462', 5331484335, 'malena', 'ward', 'CUSTOMER'),
(16, 'Sunshine Russell', '550 Providence Hwy, Walpole MA 2081', 3630456532, 'sunshine', 'russell', 'CUSTOMER'),
(17, 'Porsche Allen', '250 Hartford Avenue, Bellingham MA 2019', 8537382850, 'porsche', 'allen', 'CUSTOMER'),
(18, 'Fredrick Gonzalez', '550 Providence Hwy, Walpole MA 2081', 8752666967, 'fredrick', 'gonzalez', 'CUSTOMER'),
(19, 'Marlena Walker', '250 Hartford Avenue, Bellingham MA 2019', 9565589234, 'marlena', 'walker', 'CUSTOMER'),
(20, 'Kaitlyn Barnes', '30 Memorial Drive, Avon MA 2322', 7977881179, 'kaitlyn', 'barnes', 'CUSTOMER'),
(21, 'Carmela Mitchell', '30 Memorial Drive, Avon MA 2322', 9491680530, 'carmela', 'mitchell', 'CUSTOMER'),
(22, 'Lyla Richardson', '2055 Niagara Falls Blvd, Amherst NY 14228', 6848692757, 'lyla', 'richardson', 'CUSTOMER'),
(23, 'Elwanda Jenkins', '100 Charlton Road, Sturbridge MA 1566', 4225126033, 'elwanda', 'jenkins', 'CUSTOMER'),
(24, 'Carmela Lewis', '66-4 Parkhurst Rd, Chelmsford MA 1824', 8845538283, 'carmela', 'lewis', 'CUSTOMER'),
(25, 'Vikki Ward', '70 Pleasant Valley Street, Methuen MA 1844', 7091472881, 'vikki', 'ward', 'CUSTOMER'),
(26, 'Stanley Williams', '72 Main St, North Reading MA 1864', 8816758848, 'stanley', 'williams', 'CUSTOMER'),
(27, 'Alphonse Garcia', '1775 Washington St, Hanover MA 2339', 1428756748, 'alphonse', 'garcia', 'CUSTOMER'),
(28, 'Zelda Lee', '1105 Boston Road, Springfield MA 1119', 7693674280, 'zelda', 'lee', 'CUSTOMER'),
(29, 'Cicely Bell', '36 Paramount Drive, Raynham MA 2767', 6314237197, 'cicely', 'bell', 'CUSTOMER'),
(30, 'Kaitlyn King', '555 East Main St, Orange MA 1364', 2817583300, 'kaitlyn', 'king', 'CUSTOMER'),
(31, 'Sallie Coleman', '6265 Brockport Spencerport Rd, Brockport NY 14420', 7610130790, 'sallie', 'coleman', 'CUSTOMER'),
(32, 'Sergio Jackson', '100 Charlton Road, Sturbridge MA 1566', 3106208455, 'sergio', 'jackson', 'CUSTOMER'),
(33, 'Soraya Torres', '100 Charlton Road, Sturbridge MA 1566', 9448858078, 'soraya', 'torres', 'CUSTOMER'),
(34, 'Gina Perez', '30 Memorial Drive, Avon MA 2322', 4846869544, 'gina', 'perez', 'CUSTOMER'),
(35, 'Dusti Hill', '262 Swansea Mall Dr, Swansea MA 2777', 3357486492, 'dusti', 'hill', 'CUSTOMER'),
(36, 'Lyla Phillips', '742 Main Street, North Oxford MA 1537', 5621232561, 'lyla', 'phillips', 'CUSTOMER'),
(37, 'Cecile Hughes', '700 Oak Street, Brockton MA 2301', 5686492616, 'cecile', 'hughes', 'CUSTOMER'),
(38, 'Caren White', '20 Soojian Dr, Leicester MA 1524', 5870471037, 'caren', 'white', 'CUSTOMER'),
(39, 'Jeanetta Simmons', '677 Timpany Blvd, Gardner MA 1440', 5321096914, 'jeanetta', 'simmons', 'CUSTOMER'),
(40, 'Vikki Harris', '555 Hubbard Ave-Suite 12, Pittsfield MA 1201', 9529847548, 'vikki', 'harris', 'CUSTOMER'),
(41, 'Song Smith', '506 State Road, North Dartmouth MA 2747', 1728264394, 'song', 'smith', 'ADMIN'),
(42, 'Sallie Scott', '700 Oak Street, Brockton MA 2301', 6301211382, 'sallie', 'scott', 'ADMIN'),
(43, 'Susanna Sanchez', '591 Memorial Dr, Chicopee MA 1020', 8912851254, 'susanna', 'sanchez', 'ADMIN'),
(44, 'Lyla Hernandez', '250 Hartford Avenue, Bellingham MA 2019', 6310199836, 'lyla', 'hernandez', 'ADMIN'),
(45, 'Alphonse Cox', '250 Rt 59, Airmont NY 10901', 7831179114, 'alphonse', 'cox', 'ADMIN'),
(46, 'Genie Peterson', '1775 Washington St, Hanover MA 2339', 4051883698, 'genie', 'peterson', 'COLLECTOR'),
(47, 'Jaymie Butler', '30 Memorial Drive, Avon MA 2322', 8897612985, 'jaymie', 'butler', 'COLLECTOR'),
(48, 'Foster Collins', '337 Russell St, Hadley MA 1035', 9133580694, 'foster', 'collins', 'COLLECTOR'),
(49, 'Zelda Richardson', '13858 Rt 31 W, Albion NY 14411', 5291509918, 'zelda', 'richardson', 'COLLECTOR'),
(50, 'Lashunda Morgan', '280 Washington Street, Hudson MA 1749', 5257667304, 'lashunda', 'morgan', 'COLLECTOR'),
(51, 'Valery Rodriguez', '200 Otis Street, Northborough MA 1532', 1964391281, 'valery', 'rodriguez', 'COLLECTOR'),
(52, 'Magda Miller', '1470 S Washington St, North Attleboro MA 2760', 6799220188, 'magda', 'miller', 'COLLECTOR'),
(53, 'Kaitlyn Henderson', '180 North King Street, Northhampton MA 1060', 3131613099, 'kaitlyn', 'henderson', 'COLLECTOR'),
(54, 'Vikki Baker', '141 Washington Ave Extension, Albany NY 12205', 1648330202, 'vikki', 'baker', 'COLLECTOR'),
(55, 'Sergio Martin', '295 Plymouth Street, Halifax MA 2338', 5612969537, 'sergio', 'martin', 'COLLECTOR'),
(56, 'Zola Howard', '180 North King Street, Northhampton MA 1060', 1824850622, 'zola', 'howard', 'COLLECTOR'),
(57, 'Lilliana Johnson', '180 North King Street, Northhampton MA 1060', 4161036888, 'lilliana', 'johnson', 'COLLECTOR'),
(58, 'Susanna Brooks', '1180 Fall River Avenue, Seekonk MA 2771', 9436888213, 'susanna', 'brooks', 'COLLECTOR'),
(59, 'Caren Campbell', '20 Soojian Dr, Leicester MA 1524', 8979859392, 'caren', 'campbell', 'COLLECTOR'),
(60, 'Soraya Jenkins', '70 Pleasant Valley Street, Methuen MA 1844', 2045268538, 'soraya', 'jenkins', 'COLLECTOR'),
(61, 'Malena Gonzales', '301 Massachusetts Ave, Lunenburg MA 1462', 2894941672, 'malena', 'gonzales', 'COLLECTOR'),
(62, 'Jeanetta James', '250 Hartford Avenue, Bellingham MA 2019', 4547049829, 'jeanetta', 'james', 'COLLECTOR'),
(63, 'Stanley Adams', '141 Washington Ave Extension, Albany NY 12205', 6158266407, 'stanley', 'adams', 'COLLECTOR'),
(64, 'Sergio Baker', '13858 Rt 31 W, Albion NY 14411', 4653108202, 'sergio', 'baker', 'COLLECTOR'),
(65, 'Lilliana Flores', '4133 Veterans Memorial Drive, Batavia NY 14020', 6665752883, 'lilliana', 'flores', 'COLLECTOR'),
(66, 'Anja Flores', '1775 Washington St, Hanover MA 2339', 7903301001, 'anja', 'flores', 'OPERATOR'),
(67, 'Birgit Hill', '333 Main Street, Tewksbury MA 1876', 7926131399, 'birgit', 'hill', 'OPERATOR'),
(68, 'Porsche Morgan', '36 Paramount Drive, Raynham MA 2767', 5000431542, 'porsche', 'morgan', 'OPERATOR'),
(69, 'Anja White', '137 Teaticket Hwy, East Falmouth MA 2536', 4828132271, 'anja', 'white', 'OPERATOR'),
(70, 'Elwanda Bell', '280 Washington Street, Hudson MA 1749', 2818998745, 'elwanda', 'bell', 'OPERATOR'),
(71, 'Cicely Collins', '742 Main Street, North Oxford MA 1537', 1245023146, 'cicely', 'collins', 'OPERATOR'),
(72, 'Sallie Coleman', '6265 Brockport Spencerport Rd, Brockport NY 14420', 6215645225, 'sallie', 'coleman', 'OPERATOR');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`aid`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `alloted`
--
ALTER TABLE `alloted`
  ADD KEY `bid` (`bid`),
  ADD KEY `cid` (`cid`);

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`bid`),
  ADD KEY `custid` (`custid`),
  ADD KEY `tid` (`tid`);

--
-- Indexes for table `collector`
--
ALTER TABLE `collector`
  ADD PRIMARY KEY (`cid`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`custid`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`did`);

--
-- Indexes for table `equipment`
--
ALTER TABLE `equipment`
  ADD PRIMARY KEY (`eid`),
  ADD KEY `did` (`did`);

--
-- Indexes for table `operator`
--
ALTER TABLE `operator`
  ADD PRIMARY KEY (`oid`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `requires`
--
ALTER TABLE `requires`
  ADD PRIMARY KEY (`tid`,`eid`),
  ADD KEY `eid` (`eid`);

--
-- Indexes for table `test`
--
ALTER TABLE `test`
  ADD PRIMARY KEY (`tid`),
  ADD UNIQUE KEY `testname` (`testname`),
  ADD KEY `did` (`did`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`uid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `aid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `bid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `collector`
--
ALTER TABLE `collector`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `custid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `did` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `equipment`
--
ALTER TABLE `equipment`
  MODIFY `eid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `operator`
--
ALTER TABLE `operator`
  MODIFY `oid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `requires`
--
ALTER TABLE `requires`
  MODIFY `tid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `test`
--
ALTER TABLE `test`
  MODIFY `tid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`);

--
-- Constraints for table `alloted`
--
ALTER TABLE `alloted`
  ADD CONSTRAINT `alloted_ibfk_1` FOREIGN KEY (`bid`) REFERENCES `booking` (`bid`),
  ADD CONSTRAINT `alloted_ibfk_2` FOREIGN KEY (`cid`) REFERENCES `collector` (`cid`);

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`custid`) REFERENCES `customer` (`custid`),
  ADD CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`tid`) REFERENCES `test` (`tid`);

--
-- Constraints for table `collector`
--
ALTER TABLE `collector`
  ADD CONSTRAINT `collector_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`);

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`);

--
-- Constraints for table `equipment`
--
ALTER TABLE `equipment`
  ADD CONSTRAINT `equipment_ibfk_1` FOREIGN KEY (`did`) REFERENCES `department` (`did`);

--
-- Constraints for table `operator`
--
ALTER TABLE `operator`
  ADD CONSTRAINT `operator_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`);

--
-- Constraints for table `requires`
--
ALTER TABLE `requires`
  ADD CONSTRAINT `requires_ibfk_1` FOREIGN KEY (`tid`) REFERENCES `test` (`tid`),
  ADD CONSTRAINT `requires_ibfk_2` FOREIGN KEY (`eid`) REFERENCES `equipment` (`eid`);

--
-- Constraints for table `test`
--
ALTER TABLE `test`
  ADD CONSTRAINT `test_ibfk_1` FOREIGN KEY (`did`) REFERENCES `department` (`did`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
