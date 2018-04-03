-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 31, 2017 at 11:03 AM
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
-- Database: `shoppingdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `addbrand`
--

CREATE TABLE IF NOT EXISTS `addbrand` (
  `BrandID` int(10) NOT NULL AUTO_INCREMENT,
  `BrandName` varchar(100) NOT NULL,
  `BrandPic` varchar(150) NOT NULL,
  PRIMARY KEY (`BrandID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `addbrand`
--

INSERT INTO `addbrand` (`BrandID`, `BrandName`, `BrandPic`) VALUES
(1, 'Levis', '1495014244916Levis-Logo.png'),
(2, 'Arrow', '1495014378503Arrow Logo.jpg'),
(3, 'jack and jones', 'noimagefound.jpg'),
(4, 'united color of benetton', 'noimagefound.jpg'),
(5, 'wrangler', 'noimagefound.jpg'),
(6, 'tommy ', 'noimagefound.jpg'),
(7, 'ck', 'noimagefound.jpg'),
(8, 'biba', 'noimagefound.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `addcat`
--

CREATE TABLE IF NOT EXISTS `addcat` (
  `CatID` int(10) NOT NULL AUTO_INCREMENT,
  `CatName` varchar(100) NOT NULL,
  `CatPic` varchar(150) NOT NULL,
  PRIMARY KEY (`CatID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `addcat`
--

INSERT INTO `addcat` (`CatID`, `CatName`, `CatPic`) VALUES
(2, 'Women Apparels', '1495532986263candles.jpg'),
(3, 'Kids Apparels', 'noimagefound.jpg'),
(5, 'Men Apparels', '1495441967657mens-summer-apparel2.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `addcolor`
--

CREATE TABLE IF NOT EXISTS `addcolor` (
  `ColorId` int(50) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `ColorCode` varchar(100) NOT NULL,
  PRIMARY KEY (`ColorId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `addcolor`
--

INSERT INTO `addcolor` (`ColorId`, `Name`, `ColorCode`) VALUES
(1, 'Black', '#111111'),
(2, 'Green', '#72ed0e');

-- --------------------------------------------------------

--
-- Table structure for table `addocassion`
--

CREATE TABLE IF NOT EXISTS `addocassion` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `OcassionPic` varchar(150) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `addocassion`
--

INSERT INTO `addocassion` (`ID`, `Name`, `OcassionPic`) VALUES
(1, 'PartyWear', 'noimagefound.jpg'),
(2, 'dresses', '1495616251119finish.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `addpics`
--

CREATE TABLE IF NOT EXISTS `addpics` (
  `SrNo` int(100) NOT NULL AUTO_INCREMENT,
  `Productid` int(100) NOT NULL,
  `Prodpic` varchar(150) NOT NULL,
  PRIMARY KEY (`SrNo`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=37 ;

--
-- Dumping data for table `addpics`
--

INSERT INTO `addpics` (`SrNo`, `Productid`, `Prodpic`) VALUES
(2, 10, '1496047871598jeans1.jpg'),
(3, 10, '1496047914034jeans2.jpg'),
(4, 11, '14960480731663.jpg'),
(5, 11, '14960480881414.jpg'),
(6, 12, '14960482332406.jpg'),
(7, 12, '14960482437167.jpg'),
(8, 13, '14960483651389.jpg'),
(9, 13, '149604837608810.jpg'),
(10, 14, '149604849611112.jpg'),
(11, 14, '149604850641213.jpg'),
(12, 15, '1496048991461topp1.jpg'),
(13, 15, '149604901490515.jpg'),
(14, 16, '149604925137618.jpg'),
(15, 16, '149604926966219.jpg'),
(16, 17, '149604956508421.jpg'),
(17, 17, '149604957387822.jpg'),
(18, 18, '149604980817524.jpg'),
(19, 18, '149604982361425.jpg'),
(20, 19, '149605010498627.jpg'),
(21, 19, '149605012083028.jpg'),
(22, 19, '149605012384228.jpg'),
(23, 20, '149605034073630.jpg'),
(24, 20, '149605035027031.jpg'),
(25, 21, '149605062642633.jpg'),
(26, 21, '149605064051734.jpg'),
(27, 22, '149605089461436.jpg'),
(28, 22, '149605090825137.jpg'),
(29, 23, '149605106790739.jpg'),
(30, 23, '149605108589940.jpg'),
(31, 24, '149605135132342.jpg'),
(32, 24, '149605136216743.jpg'),
(33, 25, '149605156270947.jpg'),
(34, 25, '149605157597248.jpg'),
(35, 26, '149605174490050.jpg'),
(36, 26, '149605176362151.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `addproduct`
--

CREATE TABLE IF NOT EXISTS `addproduct` (
  `prodid` int(10) NOT NULL AUTO_INCREMENT,
  `MainCatID` int(10) NOT NULL,
  `subcatid` int(10) NOT NULL,
  `prodname` varchar(100) NOT NULL,
  `brand` int(10) NOT NULL,
  `prodpic` varchar(200) NOT NULL,
  `Ocassion` int(10) NOT NULL,
  `Featured` varchar(5) NOT NULL,
  `Description` varchar(1500) NOT NULL,
  PRIMARY KEY (`prodid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=27 ;

--
-- Dumping data for table `addproduct`
--

INSERT INTO `addproduct` (`prodid`, `MainCatID`, `subcatid`, `prodname`, `brand`, `prodpic`, `Ocassion`, `Featured`, `Description`) VALUES
(10, 5, 111, 'Replay Men Anbass Slim Fit Mid-Rise Clean Look Jeans', 1, '1496047730899jeans.jpg', 2, 'No', '<div class="pdp-productDescriptors">\r\n<div class="pdp-productDescriptorsContainer">\r\n<div>\r\n<h2 class="pdp-product-description-title">Product Details</h2>\r\n<p class="pdp-product-description-content">Black dark wash 5-pocket mid-rise jeans, clean look with light fade, has a button and zip closure, waistband with belt loops</p>\r\n</div>\r\n<div>\r\n<h6 class="pdp-product-description-title">Material &amp; Care</h6>\r\n<p class="pdp-product-description-content">89% cotton, 7% polyester, and 4% elastane <br />Machine-wash cold</p>\r\n</div>\r\n</div>\r\n</div>\r\n<div class="pincode-serviceability">&nbsp;</div>\r\n<div class="meta-container">\r\n<p class="meta-taxInfo meta-info">Tax: Applicable VAT on the basis of exact location &amp; discount will be charged at the time of checkout</p>\r\n<p class="meta-info">100% Original Products</p>\r\n<p class="meta-info">&nbsp;</p>\r\n<p class="meta-info">Card / Cash On Delivery</p>\r\n</div>'),
(11, 5, 111, 'Men Super Skinny Fit Mid-Rise Mildly Distressed Jeans', 5, '14960480460272.jpg', 2, 'No', '<div class="pdp-productDescriptors">\r\n<div class="pdp-productDescriptorsContainer">\r\n<div>\r\n<h2 class="pdp-product-description-title">Product Details</h2>\r\n<p class="pdp-product-description-content">Black dark wash 5-pocket mid-rise jeans, clean look with light fade, has a button and zip closure, waistband with belt loops</p>\r\n</div>\r\n<div>\r\n<h6 class="pdp-product-description-title">Material &amp; Care</h6>\r\n<p class="pdp-product-description-content">89% cotton, 7% polyester, and 4% elastane <br />Machine-wash cold</p>\r\n</div>\r\n</div>\r\n</div>\r\n<div class="pincode-serviceability">&nbsp;</div>\r\n<div class="meta-container">\r\n<p class="meta-taxInfo meta-info">Tax: Applicable VAT on the basis of exact location &amp; discount will be charged at the time of checkout</p>\r\n<p class="meta-info">100% Original Products</p>\r\n<p class="meta-info">&nbsp;</p>\r\n<p class="meta-info">Card / Cash On Delivery</p>\r\n</div>'),
(12, 5, 111, 'Men Mick Super-Skinny Fit Acid Washed Jeans', 3, '14960482095325.jpg', 2, 'No', '<div class="pdp-productDescriptors">\r\n<div class="pdp-productDescriptorsContainer">\r\n<div>\r\n<h2 class="pdp-product-description-title">Product Details</h2>\r\n<p class="pdp-product-description-content">Black dark wash 5-pocket mid-rise jeans, clean look with light fade, has a button and zip closure, waistband with belt loops</p>\r\n</div>\r\n<div>\r\n<h6 class="pdp-product-description-title">Material &amp; Care</h6>\r\n<p class="pdp-product-description-content">89% cotton, 7% polyester, and 4% elastane <br />Machine-wash cold</p>\r\n</div>\r\n</div>\r\n</div>\r\n<div class="pincode-serviceability">&nbsp;</div>\r\n<div class="meta-container">\r\n<p class="meta-taxInfo meta-info">Tax: Applicable VAT on the basis of exact location &amp; discount will be charged at the time of checkout</p>\r\n<p class="meta-info">100% Original Products</p>\r\n<p class="meta-info">&nbsp;</p>\r\n<p class="meta-info">Card / Cash On Delivery</p>\r\n</div>'),
(13, 5, 111, ' Men Washed Fredo Skinny Fit Jeans', 4, '14960483451118.jpg', 2, 'No', '<div class="pdp-productDescriptors">\r\n<div class="pdp-productDescriptorsContainer">\r\n<div>\r\n<h2 class="pdp-product-description-title">Product Details</h2>\r\n<p class="pdp-product-description-content">Black dark wash 5-pocket mid-rise jeans, clean look with light fade, has a button and zip closure, waistband with belt loops</p>\r\n</div>\r\n<div>\r\n<h6 class="pdp-product-description-title">Material &amp; Care</h6>\r\n<p class="pdp-product-description-content">89% cotton, 7% polyester, and 4% elastane <br />Machine-wash cold</p>\r\n</div>\r\n</div>\r\n</div>\r\n<div class="pincode-serviceability">&nbsp;</div>\r\n<div class="meta-container">\r\n<p class="meta-taxInfo meta-info">Tax: Applicable VAT on the basis of exact location &amp; discount will be charged at the time of checkout</p>\r\n<p class="meta-info">100% Original Products</p>\r\n<p class="meta-info">&nbsp;</p>\r\n<p class="meta-info">Card / Cash On Delivery</p>\r\n</div>'),
(14, 5, 111, ' Men Super Skinny Fit Jeans', 6, '149604846488411.jpg', 2, 'No', '<div class="pdp-productDescriptors">\r\n<div class="pdp-productDescriptorsContainer">\r\n<div>\r\n<h2 class="pdp-product-description-title">Product Details</h2>\r\n<p class="pdp-product-description-content">Black dark wash 5-pocket mid-rise jeans, clean look with light fade, has a button and zip closure, waistband with belt loops</p>\r\n</div>\r\n<div>\r\n<h6 class="pdp-product-description-title">Material &amp; Care</h6>\r\n<p class="pdp-product-description-content">89% cotton, 7% polyester, and 4% elastane <br />Machine-wash cold</p>\r\n</div>\r\n</div>\r\n</div>\r\n<div class="pincode-serviceability">&nbsp;</div>\r\n<div class="meta-container">\r\n<p class="meta-taxInfo meta-info">Tax: Applicable VAT on the basis of exact location &amp; discount will be charged at the time of checkout</p>\r\n<p class="meta-info">100% Original Products</p>\r\n<p class="meta-info">&nbsp;</p>\r\n<p class="meta-info">Card / Cash On Delivery</p>\r\n</div>'),
(15, 2, 112, 'RARE  Crepe Blouson Top', 7, '149604894907416.jpg', 2, 'No', '<div class="pdp-productDescriptors">\r\n<div class="pdp-productDescriptorsContainer">\r\n<div>\r\n<h2 class="pdp-product-description-title">Product Details</h2>\r\n<p class="pdp-product-description-content">Burgundy woven blouson&nbsp;top with gathers, has a round neck, sleeveless, criss-cross detail on the back</p>\r\n</div>\r\n<div>\r\n<h6 class="pdp-product-description-title">Material &amp; Care</h6>\r\n<p>Crepe<br />Hand-wash cold</p>\r\n</div>\r\n</div>\r\n</div>\r\n<div class="pincode-serviceability">Tax: Applicable VAT on the basis of exact location &amp; discount will be charged at the time of checkout</div>\r\n<div class="meta-container">\r\n<p class="meta-info">100% Original Products</p>\r\n<p class="meta-info">Card / Cash On Delivery</p>\r\n</div>'),
(16, 2, 112, 'Tokyo Talkies Women Black Solid Top', 3, '149604921346517.jpg', 2, 'No', '<div class="pdp-productDescriptors">\r\n<div class="pdp-productDescriptorsContainer">\r\n<div class="pdp-productDescriptors">\r\n<div class="pdp-productDescriptorsContainer">\r\n<div>\r\n<h2 class="pdp-product-description-title">Product Details</h2>\r\n<p class="pdp-product-description-content"><a class="seolink" href="https://www.myntra.com/black?src=pd">Black</a> <a class="seolink" href="https://www.myntra.com/solid?src=pd">solid</a> woven top, has a round neck, long bell sleeves</p>\r\n</div>\r\n<div>\r\n<h6 class="pdp-product-description-title">Material &amp; Care</h6>\r\n<p class="pdp-product-description-content">Polyester <br />Machine-wash</p>\r\n</div>\r\n</div>\r\n</div>\r\n<div class="pincode-serviceability">Tax: Applicable VAT on the basis of exact location &amp; discount will be charged at the time of checkout</div>\r\n<div class="meta-container">\r\n<p class="meta-info">100% Original Products</p>\r\n<p class="meta-info">Card / Cash On Delivery</p>\r\n</div>\r\n</div>\r\n</div>'),
(17, 2, 113, ' Women  Checked Casual Shirt', 4, '149604951969720.jpg', 2, 'No', '<div class="pdp-productDescriptors">\r\n<div class="pdp-productDescriptorsContainer">\r\n<div>\r\n<h2 class="pdp-product-description-title">Product Details</h2>\r\n<p class="pdp-product-description-content"><a class="seolink" href="https://www.myntra.com/black?src=pd">Black</a> and white checked <a class="seolink" href="https://www.myntra.com/casual?src=pd">casual</a> shirt, has a <a class="seolink" href="https://www.myntra.com/spread?src=pd">spread</a> collar, button placket, long sleeves, two pockets, curved hem</p>\r\n</div>\r\n<div>\r\n<h6 class="pdp-product-description-title">Material &amp; Care</h6>\r\n<p>100% cotton <br />Machine-wash</p>\r\n</div>\r\n</div>\r\n</div>\r\n<div class="pincode-serviceability">Tax: Applicable VAT on the basis of exact location &amp; discount will be charged at the time of checkout</div>\r\n<div class="meta-container">\r\n<p class="meta-info">100% Original Products</p>\r\n<p class="meta-info">Card / Cash On Delivery</p>\r\n</div>'),
(18, 2, 112, 'RARE Georgette Layered Top with Cut-Out Detail', 2, '149604975496523.jpg', 2, 'No', '<div class="pdp-productDescriptors">\r\n<div class="pdp-productDescriptorsContainer">\r\n<div>\r\n<h2 class="pdp-product-description-title">Product Details</h2>\r\n<p class="pdp-product-description-content">Pink woven layered top, has a mandarin collar, a full button placket, three-quarter sleeves, cut-out detail on the back, slightly curved hem</p>\r\n</div>\r\n<div>\r\n<h6 class="pdp-product-description-title">Material &amp; Care</h6>\r\n<p>Georgette<br />Hand-wash</p>\r\n</div>\r\n</div>\r\n</div>\r\n<div class="pincode-serviceability">Tax: Applicable VAT on the basis of exact location &amp; discount will be charged at the time of checkout</div>\r\n<div class="meta-container">\r\n<p class="meta-info">100% Original Products</p>\r\n<p class="meta-info">Card / Cash On Delivery</p>\r\n</div>'),
(19, 2, 113, 'Roadster Women Checked Casual Shirt', 2, '149605007476626.jpg', 2, 'No', '<div class="pdp-productDescriptors">\r\n<div class="pdp-productDescriptorsContainer">\r\n<div>\r\n<h2 class="pdp-product-description-title">Product Details</h2>\r\n<p class="pdp-product-description-content">Red and navy blue checked casual shirt, has a spread collar with button-and-tab closure, button placket, long sleeves with roll-up tabs, two chest pockets, curved hem</p>\r\n</div>\r\n<div>\r\n<h6 class="pdp-product-description-title">Material &amp; Care</h6>\r\n<p class="pdp-product-description-content">Cotton<br />Machine-wash</p>\r\n</div>\r\n</div>\r\n</div>\r\n<div class="meta-container">\r\n<p class="meta-taxInfo meta-info">Tax: Applicable VAT on the basis of exact location &amp; discount will be charged at the time of checkout</p>\r\n<p class="meta-info">100% Original Products</p>\r\n<p class="meta-info">Card / Cash On Delivery</p>\r\n</div>'),
(20, 2, 113, 'Roadster Women Checked Casual Shirt', 5, '149605030443029.jpg', 2, 'No', '<div class="pdp-productDescriptors">\r\n<div class="pdp-productDescriptorsContainer">\r\n<div>\r\n<h2 class="pdp-product-description-title">Product Details</h2>\r\n<p class="pdp-product-description-content">Navy blue, maroon and white checked casual shirt, has a spread collar with button-and-tab closure, button placket, long sleeves with roll-up tabs, two chest pockets, curved hem</p>\r\n</div>\r\n<div>\r\n<h6 class="pdp-product-description-title">Material &amp; Care</h6>\r\n<p class="pdp-product-description-content">Cotton<br />Machine-wash</p>\r\n</div>\r\n</div>\r\n</div>\r\n<div class="meta-container">\r\n<p class="meta-taxInfo meta-info">Tax: Applicable VAT on the basis of exact location &amp; discount will be charged at the time of checkout</p>\r\n<p class="meta-info">100% Original Products</p>\r\n<p class="meta-info">Card / Cash On Delivery</p>\r\n</div>'),
(21, 2, 105, 'BIBA Floral Embroidered Kurta with Skirt & Dupatta', 8, '149605057928432.jpg', 1, 'No', '<div class="pdp-productDescriptors">\r\n<div class="pdp-productDescriptorsContainer">\r\n<div>\r\n<p class="pdp-product-description-content">Yellow and coral orange&nbsp;floral embroidered&nbsp;kurta with skirt and&nbsp;<a class="seolink" href="https://www.myntra.com/dupatta?src=pd">dupatta</a><br />Yellow floral embroidered&nbsp;kurta with sequinned detail, has a mandarin collar with a split V-neckline, short sleeves, side slits, and has an attached lining<br />Coral orange&nbsp;woven skirt with dual-toned effect and zari woven design, has an elasticated waistband, and an attached lining<br />Coral orange&nbsp;dupatta with crushed effect<br /><br /></p>\r\n</div>\r\n<div>\r\n<h6 class="pdp-product-description-title">Material &amp; Care</h6>\r\n<p class="pdp-product-description-content">Shell: 100% viscose<br />Lining: 100% cotton<br />Dry-clean</p>\r\n</div>\r\n</div>\r\n</div>\r\n<div class="meta-container">\r\n<p class="meta-taxInfo meta-info">Tax: Applicable VAT on the basis of exact location &amp; discount will be charged at the time of checkout</p>\r\n<p class="meta-info">100% Original Products</p>\r\n<p class="meta-info">Card / Cash On Delivery</p>\r\n</div>'),
(22, 2, 105, 'PANIT  Printed Kurta with Patiala', 8, '149605085468635.jpg', 2, 'No', '<div class="pdp-productDescriptors">\r\n<div class="pdp-productDescriptorsContainer">\r\n<div>\r\n<h2 class="pdp-product-description-title">Product Details</h2>\r\n<p class="pdp-product-description-content">Black and <a class="seolink" href="https://www.myntra.com/navy-blue?src=pd">navy blue</a> printed <a class="seolink" href="https://www.myntra.com/kurta?src=pd">kurta</a> with <a class="seolink" href="https://www.myntra.com/patiala?src=pd">Patiala</a> <br />Black printed kurta, has a notched mandarin collar, three-quarter sleeves with roll-up tab detail, side slits<br />Navy blue <a class="seolink" href="https://www.myntra.com/printed-patiala?src=pd">printed Patiala</a>, has a waistband with a drawstring fastening</p>\r\n</div>\r\n<div>\r\n<h6 class="pdp-product-description-title">Material &amp; Care</h6>\r\n<p class="pdp-product-description-content">Cotton blend<br />Machine-wash</p>\r\n</div>\r\n</div>\r\n</div>\r\n<div class="meta-container">\r\n<p class="meta-taxInfo meta-info">Tax: Applicable VAT on the basis of exact location &amp; discount will be charged at the time of checkout</p>\r\n<p class="meta-info">100% Original Products</p>\r\n<p class="meta-info">Card / Cash On Delivery</p>\r\n</div>'),
(23, 2, 105, 'Biba  Woven Design Anarkali Churidar Kurta with Dupatta', 8, '149605103672338.jpg', 1, 'No', '<div>\r\n<h2 class="pdp-product-description-title">Product Details</h2>\r\n<p class="pdp-product-description-content">Blue and brick red&nbsp;Anarkali&nbsp;<a class="seolink" href="https://www.myntra.com/churidar-kurta?src=pd">churidar kurta</a>&nbsp;with dupatta<br />Blue and brick red&nbsp;<a class="seolink" href="https://www.myntra.com/anarkali-kurta?src=pd">Anarkali kurta</a> with woven design, has a notched round neck with a concealed full hook-and-eye placket, short sleeves, a slit on the front, an asymmetrical hem, and has an attached inner lining<br />A pair of blue knitted&nbsp;churidar&nbsp;leggings,&nbsp;has an elasticated waistband with an inner drawstring fastening<br /><a class="seolink" href="https://www.myntra.com/blue-dupatta?src=pd">Blue dupatta</a>&nbsp;with thread-work and tassels along both the ends</p>\r\n</div>\r\n<div>\r\n<h6 class="pdp-product-description-title">Material &amp; Care</h6>\r\n<p class="pdp-product-description-content">Shell: polyester and cotton blend<br />Lining: 100% cotton<br />Machine-wash cold</p>\r\n</div>'),
(24, 3, 107, 'GKIDZ Pack of 5 Printed T-shirts', 2, '149605130740641.jpg', 2, 'No', '<div class="pdp-productDescriptors">\r\n<div class="pdp-productDescriptorsContainer">\r\n<div>\r\n<h2 class="pdp-product-description-title">Product Details</h2>\r\n<p>Pack of five T-shirts in blue, white, grey, red and pink, each has a round neck, a button closure on the left shoulder, short sleeves, printed graphics on the front, straight hem</p>\r\n</div>\r\n<div>\r\n<h6 class="pdp-product-description-title">Material &amp; Care</h6>\r\n<p>100% cotton<br />Machine wash warm</p>\r\n</div>\r\n</div>\r\n</div>\r\n<div class="meta-container">\r\n<p class="meta-taxInfo meta-info">Tax: Applicable VAT on the basis of exact location &amp; discount will be charged at the time of checkout</p>\r\n<p class="meta-info">100% Original Products</p>\r\n<p class="meta-info">Card / Cash On Delivery</p>\r\n</div>'),
(25, 3, 107, 'Mickey & Friends Boys  Printed T-shirt', 3, '149605153346446.jpg', 2, 'No', '<div class="pdp-productDescriptors">\r\n<div class="pdp-productDescriptorsContainer">\r\n<div>\r\n<h2 class="pdp-product-description-title">Product Details</h2>\r\n<p class="pdp-product-description-content">Blue printed T-shirt, has a round neck, short sleeves, a solid back</p>\r\n</div>\r\n<div>\r\n<h6 class="pdp-product-description-title">Material &amp; Care</h6>\r\n<p class="pdp-product-description-content">Polyester<br />Machine-wash</p>\r\n</div>\r\n</div>\r\n</div>\r\n<div class="meta-container">\r\n<p class="meta-taxInfo meta-info">Tax: Applicable VAT on the basis of exact location &amp; discount will be charged at the time of checkout</p>\r\n<p class="meta-info">100% Original Products</p>\r\n<p class="meta-info">Card / Cash On Delivery</p>\r\n</div>'),
(26, 3, 107, 'United Colors of Benetton Boys Polo T-shirt', 4, '149605171252149.jpg', 2, 'No', '<div class="pdp-productDescriptors">\r\n<div class="pdp-productDescriptorsContainer">\r\n<div>\r\n<h2 class="pdp-product-description-title">Product Details</h2>\r\n<p>Blue pique knit polo T-shirt, has a ribbed polo collar, short sleeves, a short button placket and vented hem</p>\r\n</div>\r\n<div>\r\n<h6 class="pdp-product-description-title">Material &amp; Care</h6>\r\n<p>100% cotton<br />Machine-wash cold</p>\r\n</div>\r\n</div>\r\n</div>\r\n<div class="meta-container">\r\n<p class="meta-taxInfo meta-info">Tax: Applicable VAT on the basis of exact location &amp; discount will be charged at the time of checkout</p>\r\n<p class="meta-info">100% Original Products</p>\r\n<p class="meta-info">Card / Cash On Delivery</p>\r\n</div>');

-- --------------------------------------------------------

--
-- Table structure for table `addslider`
--

CREATE TABLE IF NOT EXISTS `addslider` (
  `SrNo` int(11) NOT NULL AUTO_INCREMENT,
  `Catid` int(10) NOT NULL,
  `sliderpic` varchar(200) NOT NULL,
  PRIMARY KEY (`SrNo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `addsubcat`
--

CREATE TABLE IF NOT EXISTS `addsubcat` (
  `SubCatID` int(10) NOT NULL AUTO_INCREMENT,
  `MainCatID` int(10) NOT NULL,
  `SubCatName` varchar(100) NOT NULL,
  `SubCatPic` varchar(150) NOT NULL,
  PRIMARY KEY (`SubCatID`),
  KEY `MainCatID` (`MainCatID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=114 ;

--
-- Dumping data for table `addsubcat`
--

INSERT INTO `addsubcat` (`SubCatID`, `MainCatID`, `SubCatName`, `SubCatPic`) VALUES
(102, 2, 'Jeans', 'noimagefound.jpg'),
(103, 3, 'Jeans', 'noimagefound.jpg'),
(104, 5, 'Shirts', 'noimagefound.jpg'),
(105, 2, 'Suits', 'noimagefound.jpg'),
(106, 2, 'T-Shirts', 'noimagefound.jpg'),
(107, 3, 'T-Shirts', 'noimagefound.jpg'),
(108, 3, 'LoungeWear', 'noimagefound.jpg'),
(109, 3, 'Innerwear', 'noimagefound.jpg'),
(110, 5, 'T-Shirts', 'noimagefound.jpg'),
(111, 5, 'Jeans', '1496047431923jeans.jpg'),
(112, 2, 'tops', '149604884987915.jpg'),
(113, 2, 'shirts', '149604940704220.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `addvarient`
--

CREATE TABLE IF NOT EXISTS `addvarient` (
  `SrNo` int(100) NOT NULL AUTO_INCREMENT,
  `Catid` int(100) NOT NULL,
  `SubCatId` int(100) NOT NULL,
  `ProdId` int(100) NOT NULL,
  `ColorId` int(100) NOT NULL,
  `Size` varchar(100) NOT NULL,
  `Stock` varchar(100) NOT NULL,
  `MRP` varchar(20) NOT NULL,
  `Dis` varchar(20) NOT NULL,
  PRIMARY KEY (`SrNo`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `addvarient`
--

INSERT INTO `addvarient` (`SrNo`, `Catid`, `SubCatId`, `ProdId`, `ColorId`, `Size`, `Stock`, `MRP`, `Dis`) VALUES
(9, 2, 105, 21, 2, 'S', '-1', '3500', '10'),
(10, 2, 105, 21, 2, 'M', '-2', '3500', '10'),
(11, 2, 105, 21, 2, 'L', '7', '3500', '10'),
(12, 2, 105, 21, 2, 'XL', '5', '3500', '10'),
(13, 2, 105, 21, 2, 'XXL', '9', '3500', '10'),
(14, 2, 105, 21, 1, 'XL', '5', '4000', '10'),
(15, 2, 105, 21, 1, 'M', '50', '3200', '5'),
(16, 2, 105, 21, 1, 'L', '11', '3600', '50'),
(17, 2, 105, 21, 1, 'XXXL', '27', '1400', '10');

-- --------------------------------------------------------

--
-- Table structure for table `admintable`
--

CREATE TABLE IF NOT EXISTS `admintable` (
  `Name` varchar(50) NOT NULL,
  `Address` varchar(150) NOT NULL,
  `City` varchar(50) NOT NULL,
  `State` varchar(50) NOT NULL,
  `Phone` varchar(50) NOT NULL,
  `Username` varchar(50) NOT NULL,
  `Password` varchar(250) NOT NULL,
  `Gender` varchar(50) NOT NULL,
  `Country` varchar(50) NOT NULL,
  `usertype` varchar(50) NOT NULL,
  PRIMARY KEY (`Username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admintable`
--

INSERT INTO `admintable` (`Name`, `Address`, `City`, `State`, `Phone`, `Username`, `Password`, `Gender`, `Country`, `usertype`) VALUES
('admin', 'admin', 'admin', 'admin', '1234567890', 'admin1@gmail.com', '123', 'Male', 'India', 'admin'),
('admin', 'admin', 'admin', 'admin', '1234567890', 'admin2@gmail.com', 'd1d82677b122a13207787f21195673ef', 'Male', 'USA', 'admin'),
('Admin', 'Admin', 'Admin', 'Admin', 'Admin', 'admin@gmail.com', 'd1d82677b122a13207787f21195673ef', 'Male', 'India', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `bill`
--

CREATE TABLE IF NOT EXISTS `bill` (
  `OrderNo` int(20) NOT NULL AUTO_INCREMENT,
  `Mode` varchar(50) NOT NULL,
  `CardNo` varchar(50) NOT NULL,
  `HolderName` varchar(50) NOT NULL,
  `Company` varchar(50) NOT NULL,
  `Exp` varchar(50) NOT NULL,
  `Cvv` varchar(10) NOT NULL,
  `Address` varchar(150) NOT NULL,
  `Status` varchar(50) NOT NULL,
  `TotalAmount` int(10) NOT NULL,
  `OrderDate` date NOT NULL,
  `Username` varchar(50) NOT NULL,
  PRIMARY KEY (`OrderNo`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `bill`
--

INSERT INTO `bill` (`OrderNo`, `Mode`, `CardNo`, `HolderName`, `Company`, `Exp`, `Cvv`, `Address`, `Status`, `TotalAmount`, `OrderDate`, `Username`) VALUES
(1, 'cod', '', '', '', '', '', 'dfgdfg', 'Payment Received, Processing', 18810, '2017-06-03', 'navkarank@gmail.com'),
(2, 'cod', '', '', '', '', '', '21 Model Town', 'Payment Received, Processing', 6300, '2017-07-22', 'rajesh@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `carttable`
--

CREATE TABLE IF NOT EXISTS `carttable` (
  `SrNo` int(10) NOT NULL AUTO_INCREMENT,
  `ProductID` int(150) NOT NULL,
  `ColorID` int(10) NOT NULL,
  `Size` varchar(50) NOT NULL,
  `Quantity` int(10) NOT NULL,
  `Amount` int(10) NOT NULL,
  `TotalCost` int(10) NOT NULL,
  `ProdPic` varchar(150) NOT NULL,
  `Username` varchar(50) NOT NULL,
  PRIMARY KEY (`SrNo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `discount`
--

CREATE TABLE IF NOT EXISTS `discount` (
  `srno` int(10) NOT NULL AUTO_INCREMENT,
  `coupname` varchar(50) NOT NULL,
  `mintotal` varchar(10) NOT NULL,
  `percentage` varchar(10) NOT NULL,
  `maxdiscount` varchar(10) NOT NULL,
  PRIMARY KEY (`srno`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `discount`
--

INSERT INTO `discount` (`srno`, `coupname`, `mintotal`, `percentage`, `maxdiscount`) VALUES
(5, 'Summer20', '30000', '20', '600');

-- --------------------------------------------------------

--
-- Table structure for table `orderdetails1`
--

CREATE TABLE IF NOT EXISTS `orderdetails1` (
  `SrNo` int(10) NOT NULL AUTO_INCREMENT,
  `ProductID` int(150) NOT NULL,
  `ColorID` int(10) NOT NULL,
  `Size` varchar(50) NOT NULL,
  `Quantity` int(10) NOT NULL,
  `Amount` int(10) NOT NULL,
  `TotalCost` int(10) NOT NULL,
  `ProdPic` varchar(150) NOT NULL,
  `Username` varchar(50) NOT NULL,
  `OrderNo` int(10) NOT NULL,
  PRIMARY KEY (`SrNo`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `orderdetails1`
--

INSERT INTO `orderdetails1` (`SrNo`, `ProductID`, `ColorID`, `Size`, `Quantity`, `Amount`, `TotalCost`, `ProdPic`, `Username`, `OrderNo`) VALUES
(8, 21, 1, 'L', 1, 1800, 1800, '149605057928432.jpg', 'navkarank@gmail.com', 1),
(9, 21, 1, 'XXXL', 1, 1260, 1260, '149605057928432.jpg', 'navkarank@gmail.com', 1),
(10, 21, 2, 'S', 1, 3150, 3150, '149605057928432.jpg', 'navkarank@gmail.com', 1),
(11, 21, 2, 'S', 1, 3150, 3150, '149605057928432.jpg', 'navkarank@gmail.com', 1),
(12, 21, 2, 'XXL', 1, 3150, 3150, '149605057928432.jpg', 'navkarank@gmail.com', 1),
(13, 21, 2, 'XXL', 1, 3150, 3150, '149605057928432.jpg', 'navkarank@gmail.com', 1),
(14, 21, 2, 'M', 1, 3150, 3150, '149605057928432.jpg', 'navkarank@gmail.com', 1),
(15, 21, 2, 'M', 2, 3150, 6300, '149605057928432.jpg', 'rajesh@gmail.com', 2);

-- --------------------------------------------------------

--
-- Table structure for table `rectime`
--

CREATE TABLE IF NOT EXISTS `rectime` (
  `Sno` int(50) NOT NULL AUTO_INCREMENT,
  `username` varchar(52) NOT NULL,
  `time` varchar(150) NOT NULL,
  PRIMARY KEY (`Sno`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `rectime`
--

INSERT INTO `rectime` (`Sno`, `username`, `time`) VALUES
(1, 'shub15907@gmail.com', '1496313798175'),
(2, 'manish@gmail.com', '1500445943565');

-- --------------------------------------------------------

--
-- Table structure for table `signup`
--

CREATE TABLE IF NOT EXISTS `signup` (
  `Name` varchar(50) NOT NULL,
  `Address` varchar(150) NOT NULL,
  `City` varchar(50) NOT NULL,
  `State` varchar(50) NOT NULL,
  `Phone` varchar(50) NOT NULL,
  `Username` varchar(50) NOT NULL,
  `Password` varchar(150) NOT NULL,
  `Gender` varchar(50) NOT NULL,
  `Country` varchar(50) NOT NULL,
  `UserType` varchar(50) NOT NULL,
  `DOB` date NOT NULL,
  `Activated` varchar(50) NOT NULL,
  `ActCode` varchar(50) NOT NULL,
  PRIMARY KEY (`Username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `signup`
--

INSERT INTO `signup` (`Name`, `Address`, `City`, `State`, `Phone`, `Username`, `Password`, `Gender`, `Country`, `UserType`, `DOB`, `Activated`, `ActCode`) VALUES
('Manish', '321, Model Town', 'Jalandhar', 'Punjab', '7894561230', 'manish@gmail.com', 'd1d82677b122a13207787f21195673ef', 'Male', 'India', 'admin', '2010-05-04', 'Yes', ''),
('Navkaran', 'fygj', 'hkvh', 'jhg', '5638328292', 'navkarank@gmail.com', '34a949ad064e909ac8ce5cdc378b596d', 'Male', 'China', 'normal', '2017-06-08', 'Yes', '1496388097223'),
('ABC', '42 Model Town', 'Jalandhar', 'Punjab', '90689078969', 'preettarun@gmail.com', 'd1d82677b122a13207787f21195673ef', 'Male', 'India', 'normal', '2017-06-06', 'No', '1496303378990'),
('Rajesh', '21, Model Town', 'Jalandhar', 'Punjab', '7349579477', 'rajesh@gmail.com', 'd1d82677b122a13207787f21195673ef', 'Male', 'India', 'normal', '2017-05-01', 'Yes', '');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `addsubcat`
--
ALTER TABLE `addsubcat`
  ADD CONSTRAINT `addsubcat_ibfk_1` FOREIGN KEY (`MainCatID`) REFERENCES `addcat` (`CatID`);
SET FOREIGN_KEY_CHECKS=1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
