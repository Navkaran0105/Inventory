-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 22, 2017 at 07:38 AM
-- Server version: 5.6.16
-- PHP Version: 5.5.11

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `inventorydb`
--

-- --------------------------------------------------------

--
-- Table structure for table `addcategory`
--

CREATE TABLE IF NOT EXISTS `addcategory` (
  `CategoryName` varchar(50) NOT NULL,
  PRIMARY KEY (`CategoryName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `addcategory`
--

INSERT INTO `addcategory` (`CategoryName`) VALUES
('Bakery'),
('Dine In'),
('Goods'),
('Sweets');

-- --------------------------------------------------------

--
-- Table structure for table `addemp`
--

CREATE TABLE IF NOT EXISTS `addemp` (
  `Name` varchar(50) NOT NULL,
  `Address` varchar(150) NOT NULL,
  `City` varchar(50) NOT NULL,
  `Country` varchar(50) NOT NULL,
  `Gender` varchar(50) NOT NULL,
  `Phone` varchar(50) NOT NULL,
  `EmailID` varchar(50) NOT NULL,
  `Username` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `UserType` varchar(50) NOT NULL,
  `DOB` date NOT NULL,
  PRIMARY KEY (`Username`),
  UNIQUE KEY `Phone` (`Phone`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `addemp`
--

INSERT INTO `addemp` (`Name`, `Address`, `City`, `Country`, `Gender`, `Phone`, `EmailID`, `Username`, `Password`, `UserType`, `DOB`) VALUES
('Manish', '231, Model Town', 'Jalandhar', 'India', 'Male', '9874561230', 'manish@gmail.com', 'manish', '123', 'Admin', '2017-04-10'),
('Mukesh', '1121, UE -I', 'Jalandhar', 'India', 'Male', '9856230147', 'mukesh@gmail.com', 'mukesh', '123', 'Employee', '0000-00-00'),
('Piyush', '111, Model Town', 'Jalandhar', 'India', 'Male', '9874566300', 'piyush@gmail.com', 'piyush', '123', 'Admin', '0000-00-00'),
('Piyush', '90, Model Town', 'Jalandhar', 'India', 'Male', '7564564564', 'piyush@gmail.com', 'piyush2', '321', 'Employee', '1997-07-10'),
('Rahul Dhiman', '21212, UE - II', 'Jalandhar', 'India', 'Male', '8894563333', 'rahuld@gmail.com', 'rahuld', '789', 'Employee', '0000-00-00'),
('Rajesh', '2121, UE - II', 'Jalandhar', 'India', 'Male', '7894561230', 'rajesh@gmail.com', 'rajesh', '123', 'Employee', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `addproduct`
--

CREATE TABLE IF NOT EXISTS `addproduct` (
  `ProductCode` int(10) NOT NULL,
  `ProductName` varchar(200) NOT NULL,
  `Category` varchar(50) NOT NULL,
  `SubCategory` varchar(50) NOT NULL,
  `Rate` int(50) NOT NULL,
  `Stock` int(10) NOT NULL,
  PRIMARY KEY (`ProductCode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `addproduct`
--

INSERT INTO `addproduct` (`ProductCode`, `ProductName`, `Category`, `SubCategory`, `Rate`, `Stock`) VALUES
(100, 'Brittania Good Day Kaju - 100 Gm', 'Bakery', 'Biscuits', 10, -34),
(101, 'Sunfeast Farmlite Almonds Box', 'Bakery', 'Biscuits', 50, -50);

-- --------------------------------------------------------

--
-- Table structure for table `addsubcat`
--

CREATE TABLE IF NOT EXISTS `addsubcat` (
  `CategoryName` varchar(50) NOT NULL,
  `SubCategoryName` varchar(50) NOT NULL,
  PRIMARY KEY (`SubCategoryName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `addsubcat`
--

INSERT INTO `addsubcat` (`CategoryName`, `SubCategoryName`) VALUES
('Bakery', 'Biscuits'),
('Dine In', 'Breakfast'),
('Bakery', 'Cakes'),
('Dine In', 'Dinner'),
('Sweets', 'Sugar'),
('Sweets', 'SugarFree');

-- --------------------------------------------------------

--
-- Table structure for table `addsupplier`
--

CREATE TABLE IF NOT EXISTS `addsupplier` (
  `supplierid` int(10) NOT NULL,
  `suppliername` varchar(100) NOT NULL,
  `address` varchar(150) NOT NULL,
  `city` varchar(100) NOT NULL,
  `country` varchar(100) NOT NULL,
  `gender` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `salestaxno` varchar(100) NOT NULL,
  PRIMARY KEY (`supplierid`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `addsupplier`
--

INSERT INTO `addsupplier` (`supplierid`, `suppliername`, `address`, `city`, `country`, `gender`, `phone`, `salestaxno`) VALUES
(1000, 'ritika', 'jkhj	', 'ghgh', 'India', 'Female', '8284071510', '2555'),
(1001, 'mahesh', 'fgfb', 'fgnf', 'India', 'Male', '9417712562', '3652');

-- --------------------------------------------------------

--
-- Table structure for table `billdetails`
--

CREATE TABLE IF NOT EXISTS `billdetails` (
  `SrNo` int(10) NOT NULL AUTO_INCREMENT,
  `billno` int(100) NOT NULL,
  `choosecategory` varchar(100) NOT NULL,
  `choosesubcategory` varchar(100) NOT NULL,
  `product` varchar(100) NOT NULL,
  `Quantity` int(10) NOT NULL,
  `Cost` int(10) NOT NULL,
  `TotalCost` int(10) NOT NULL,
  PRIMARY KEY (`SrNo`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `billdetails`
--

INSERT INTO `billdetails` (`SrNo`, `billno`, `choosecategory`, `choosesubcategory`, `product`, `Quantity`, `Cost`, `TotalCost`) VALUES
(5, 1, 'Bakery', 'Biscuits', 'Brittania Good Day Kaju - 100 Gm', 50, 9, 450),
(6, 1, 'Bakery', 'Biscuits', 'Sunfeast Farmlite Almonds Box', 40, 8, 320),
(7, 2, 'Bakery', 'Biscuits', 'Brittania Good Day Kaju - 100 Gm', 23, 34, 782),
(8, 2, 'Bakery', 'Biscuits', 'Sunfeast Farmlite Almonds Box', 10, 11, 110);

-- --------------------------------------------------------

--
-- Table structure for table `buyitem`
--

CREATE TABLE IF NOT EXISTS `buyitem` (
  `billno` int(10) NOT NULL,
  `date` date NOT NULL,
  `suppliername` varchar(100) NOT NULL,
  `cost` int(10) NOT NULL,
  PRIMARY KEY (`billno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `buyitem`
--

INSERT INTO `buyitem` (`billno`, `date`, `suppliername`, `cost`) VALUES
(1, '2017-04-10', 'ritika', 770),
(2, '2017-04-12', 'ritika', 892);

-- --------------------------------------------------------

--
-- Table structure for table `sellbilldetails`
--

CREATE TABLE IF NOT EXISTS `sellbilldetails` (
  `SrNo` int(10) NOT NULL AUTO_INCREMENT,
  `billno` int(10) NOT NULL,
  `choosecategory` varchar(100) NOT NULL,
  `choosesubcategory` varchar(100) NOT NULL,
  `product` varchar(100) NOT NULL,
  `quantity` int(10) NOT NULL,
  `cost` int(10) NOT NULL,
  `totalcost` int(10) NOT NULL,
  PRIMARY KEY (`SrNo`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `sellbilldetails`
--

INSERT INTO `sellbilldetails` (`SrNo`, `billno`, `choosecategory`, `choosesubcategory`, `product`, `quantity`, `cost`, `totalcost`) VALUES
(1, 1, 'Bakery', 'Biscuits', 'Brittania Good Day Kaju - 100 Gm', 10, 20, 200),
(2, 1, 'Bakery', 'Biscuits', 'Sunfeast Farmlite Almonds Box', 20, 30, 600),
(3, 2, 'Bakery', 'Biscuits', 'Brittania Good Day Kaju - 100 Gm', 10, 12, 120),
(4, 2, 'Bakery', 'Biscuits', 'Sunfeast Farmlite Almonds Box', 5, 11, 55),
(5, 3, 'Bakery', 'Biscuits', 'Brittania Good Day Kaju - 100 Gm', 10, 15, 150),
(6, 3, 'Bakery', 'Biscuits', 'Sunfeast Farmlite Almonds Box', 2, 12, 24),
(7, 4, 'Bakery', 'Biscuits', 'Brittania Good Day Kaju - 100 Gm', 10, 10, 100),
(8, 4, 'Bakery', 'Biscuits', 'Sunfeast Farmlite Almonds Box', 5, 20, 100),
(9, 5, 'Bakery', 'Biscuits', 'Brittania Good Day Kaju - 100 Gm', 11, 20, 220),
(10, 5, 'Bakery', 'Biscuits', 'Sunfeast Farmlite Almonds Box', 1, 20, 20),
(11, 6, 'Bakery', 'Biscuits', 'Brittania Good Day Kaju - 100 Gm', 11, 11, 121),
(12, 7, 'Bakery', 'Biscuits', 'Brittania Good Day Kaju - 100 Gm', 34, 33, 1122),
(13, 7, 'Bakery', 'Biscuits', 'Sunfeast Farmlite Almonds Box', 35, 6, 210),
(14, 8, 'Bakery', 'Biscuits', 'Brittania Good Day Kaju - 100 Gm', 10, 10, 100),
(15, 8, 'Bakery', 'Biscuits', 'Sunfeast Farmlite Almonds Box', 10, 10, 100),
(16, 9, 'Bakery', 'Biscuits', 'Brittania Good Day Kaju - 100 Gm', 11, 11, 121),
(17, 9, 'Bakery', 'Biscuits', 'Sunfeast Farmlite Almonds Box', 22, 11, 242);

-- --------------------------------------------------------

--
-- Table structure for table `sellitem`
--

CREATE TABLE IF NOT EXISTS `sellitem` (
  `billno` int(10) NOT NULL,
  `date` date NOT NULL,
  `customername` varchar(100) NOT NULL,
  `cost` varchar(10) NOT NULL,
  PRIMARY KEY (`billno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sellitem`
--

INSERT INTO `sellitem` (`billno`, `date`, `customername`, `cost`) VALUES
(1, '2017-04-10', 'ritika', '800'),
(2, '2017-04-06', 'Rajesh', '175'),
(3, '2017-04-11', 'Rajesh', '174'),
(4, '2017-04-11', 'Lovish', '200'),
(5, '2017-04-11', 'Llasd', '240'),
(6, '2017-04-11', 'aa', '121'),
(7, '2017-04-12', 'ghk', '1332'),
(8, '2017-04-12', 'JJJ', '200'),
(9, '2017-04-12', 'sdfsdf', '363');
SET FOREIGN_KEY_CHECKS=1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
