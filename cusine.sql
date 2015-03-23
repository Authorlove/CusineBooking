-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2015 年 01 月 10 日 08:42
-- 服务器版本: 5.6.12-log
-- PHP 版本: 5.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `cusine`
--
CREATE DATABASE IF NOT EXISTS `cusine` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `cusine`;

-- --------------------------------------------------------

--
-- 表的结构 `address`
--

CREATE TABLE IF NOT EXISTS `address` (
  `addressID` int(11) NOT NULL AUTO_INCREMENT,
  `province` varchar(10) NOT NULL,
  `city` varchar(20) DEFAULT NULL,
  `district` varchar(70) DEFAULT NULL,
  PRIMARY KEY (`addressID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=58 ;

--
-- 转存表中的数据 `address`
--

INSERT INTO `address` (`addressID`, `province`, `city`, `district`) VALUES
(2, '广东', '广州', '番禺区'),
(3, '广东', '广州', '越秀区'),
(4, '广东', '广州', '黄埔区'),
(5, '广东', '广州', '番禺区'),
(6, '广东', '广州', '番禺区'),
(7, '广东', '广州', '海珠区'),
(8, '广东', '广州', '天河区'),
(9, '广东', '广州', '白云区'),
(10, '广东', '广州', '番禺区'),
(11, '广东', '广州', '天河区'),
(12, '广东', '广州', '白云区'),
(13, '广东', '广州', '荔湾区'),
(14, '广东', '广州', '番禺区'),
(15, '广东', '广州', '花都区'),
(16, '广东', '广州', '南沙区'),
(17, '广东', '广州', '荔湾区'),
(36, 'province', 'city', 'district'),
(37, 'province', 'city', 'district'),
(38, 'province', 'city', 'district'),
(39, 'province', 'city', 'district'),
(40, 'province', 'city', 'district'),
(41, 'province', 'city', 'district'),
(42, 'province', 'Lian', 'district'),
(43, 'province', 'city', 'district'),
(44, 'province', 'city', 'district'),
(45, 'province', 'city', 'district'),
(46, 'province', 'city', 'district'),
(47, 'province', 'city', 'district'),
(48, 'province', 'city', 'district'),
(49, 'province', 'city', 'district'),
(50, 'GuangDong', '广州', '番禺区'),
(51, 'GuangDong', '广州', '番禺区'),
(52, 'GuangDong', '广州', '番禺区'),
(53, 'GuangDong', '广州', '番禺区'),
(54, 'GuangDong', '广州', '番禺区'),
(55, '赏析', '广州', '番禺区'),
(56, 'GuangDong', '广州', '番禺区'),
(57, 'GuangDong', '广州', '番禺区');

-- --------------------------------------------------------

--
-- 表的结构 `customer`
--

CREATE TABLE IF NOT EXISTS `customer` (
  `customerID` int(11) NOT NULL AUTO_INCREMENT,
  `customeraccount` varchar(20) NOT NULL,
  `customeremail` varchar(20) NOT NULL,
  `customerpwd` varchar(30) NOT NULL,
  `customerphone` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`customerID`),
  UNIQUE KEY `customeraccount` (`customeraccount`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `customer`
--

INSERT INTO `customer` (`customerID`, `customeraccount`, `customeremail`, `customerpwd`, `customerphone`) VALUES
(1, '123456', '123456@qq.com', '123456', '12345678901');

-- --------------------------------------------------------

--
-- 表的结构 `iorder`
--

CREATE TABLE IF NOT EXISTS `iorder` (
  `orderID` int(11) NOT NULL AUTO_INCREMENT,
  `customerName` varchar(70) NOT NULL,
  `customerPhone` varchar(11) DEFAULT NULL,
  `customerAddress` varchar(30) NOT NULL,
  `orderDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `payOrNot` varchar(2) NOT NULL,
  `confirmOrder` varchar(2) NOT NULL,
  `COMMENT` varchar(100) DEFAULT NULL,
  `transactionCompleted` varchar(2) NOT NULL,
  `productID` int(11) NOT NULL,
  PRIMARY KEY (`orderID`),
  KEY `productID` (`productID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `iorder`
--

INSERT INTO `iorder` (`orderID`, `customerName`, `customerPhone`, `customerAddress`, `orderDate`, `payOrNot`, `confirmOrder`, `COMMENT`, `transactionCompleted`, `productID`) VALUES
(2, 'xingming', '1234567', '11scut', '2015-01-10 06:03:23', 'N', 'N', NULL, 'N', 16),
(3, 'xingming', '1111133', '11111111111', '2015-01-10 08:24:23', 'N', 'N', NULL, 'N', 24),
(4, 'xingming', '11111333333', '11111111111', '2015-01-10 08:28:51', 'N', 'N', NULL, 'N', 27);

-- --------------------------------------------------------

--
-- 表的结构 `product`
--

CREATE TABLE IF NOT EXISTS `product` (
  `productID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `price` float(5,2) DEFAULT NULL,
  `picpath` varchar(1024) DEFAULT NULL,
  `salevolume` int(11) DEFAULT '0',
  `ptype` varchar(10) DEFAULT NULL,
  `sellerID` int(11) DEFAULT NULL,
  `releaseDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`productID`),
  UNIQUE KEY `name` (`name`,`sellerID`),
  KEY `sellerID` (`sellerID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=29 ;

--
-- 转存表中的数据 `product`
--

INSERT INTO `product` (`productID`, `name`, `price`, `picpath`, `salevolume`, `ptype`, `sellerID`, `releaseDate`) VALUES
(2, '魔鬼拉面', 19.50, 'iProductPic\\10012\\魔鬼拉面.jpg', 55, '川菜', 10012, '2015-01-10 05:50:59'),
(4, '豚骨拉面', 29.50, 'iProductPic\\10012\\豚骨拉面.png', 63, '川菜', 10012, '2015-01-10 05:50:31'),
(5, '猪骨拉面', 45.00, 'iProductPic\\10012\\猪骨拉面.jpg', 26, '川菜', 10012, '2015-01-10 05:49:55'),
(6, '闸蟹拉面', 25.00, 'iProductPic\\10012\\闸蟹拉面.jpg', 85, '川菜', 10012, '2015-01-10 05:50:43'),
(7, '原味拉面', 47.00, 'iProductPic\\10012\\原味拉面.jpg', 211, '川菜', 10012, '2015-01-10 05:50:50'),
(8, '瘦肉粉', 25.00, 'iProductPic\\10013\\瘦肉粉.jpg', 85, '川菜', 10013, '2015-01-10 05:52:19'),
(9, '排骨拼鸡腿饭', 19.00, 'iProductPic\\10013\\排骨拼鸡腿饭.jpg', 45, '川菜', 10013, '2015-01-10 05:52:29'),
(10, '蘑菇猪排饭', 45.00, 'iProductPic\\10013\\蘑菇猪排饭.jpg', 25, '川菜', 10013, '2015-01-10 05:52:55'),
(11, '通心粉', 25.00, 'iProductPic\\10013\\通心粉.jpg', 13, '川菜', 10013, '2015-01-10 05:53:05'),
(12, '牛奶包', 8.00, 'iProductPic\\10013\\牛奶包.jpg', 65, '川菜', 10013, '2015-01-10 05:53:12'),
(13, '隆江猪脚饭', 15.00, 'iProductPic\\10014\\隆江猪脚饭.jpg', 35, '川菜', 10014, '2015-01-10 05:54:21'),
(14, '白切鸡饭', 12.00, 'iProductPic\\10014\\白切鸡饭.jpg', 55, '川菜', 10014, '2015-01-10 05:54:31'),
(15, '炸酱粉', 9.00, 'iProductPic\\10014\\炸酱粉.jpg', 35, '川菜', 10014, '2015-01-10 05:54:39'),
(16, '叉烧排骨饭', 18.00, 'iProductPic\\10014\\叉烧排骨饭.jpg', 35, '川菜', 10014, '2015-01-10 05:54:48'),
(17, '紫菜汤', 6.00, 'iProductPic\\10014\\紫菜汤.jpg', 35, '川菜', 10014, '2015-01-10 05:54:55'),
(24, '八珍鱼肚', 55.00, 'iProductPic\\10023\\八珍鱼肚.jpg', 0, '粤菜', 10023, '2015-01-10 06:25:47'),
(25, '鲁福源四大碗', 9.50, 'iProductPic\\10023\\鲁福源四大碗.jpg', 0, '鲁菜', 10023, '2015-01-10 06:26:10'),
(26, '湘西辣猪耳', 66.50, 'iProductPic\\10023\\湘西辣猪耳.jpg', 0, '湘菜', 10023, '2015-01-10 06:27:04'),
(27, '闽南五香卷', 44.00, 'iProductPic\\10023\\闽南五香卷.jpg', 0, '东北菜', 10023, '2015-01-10 06:27:32'),
(28, 'hhhhhhhh', 212.00, 'iProductPic\\10023\\hhhhhhhh.jpg', 0, '江苏菜', 10023, '2015-01-10 07:22:29');

-- --------------------------------------------------------

--
-- 表的结构 `seller`
--

CREATE TABLE IF NOT EXISTS `seller` (
  `sellerID` int(20) NOT NULL AUTO_INCREMENT,
  `account` varchar(20) NOT NULL,
  `storename` varchar(70) NOT NULL,
  `pwd` varchar(30) NOT NULL,
  `sellername` varchar(70) NOT NULL,
  `sellerphone` varchar(11) DEFAULT NULL,
  `addressID` int(11) DEFAULT NULL,
  `storephone` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`sellerID`),
  UNIQUE KEY `account` (`account`,`storename`),
  KEY `addressID` (`addressID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10024 ;

--
-- 转存表中的数据 `seller`
--

INSERT INTO `seller` (`sellerID`, `account`, `storename`, `pwd`, `sellername`, `sellerphone`, `addressID`, `storephone`) VALUES
(10012, '123456789@qq.com', '不二家的拉面', 'jason1qaz', '陈丹', '13660173974', 2, '6633361'),
(10013, '990525051@qq.com', '真功夫', 'jason2wsx', '黄兵', '13660173975', 3, '6633362'),
(10014, '990525052@qq.com', '隆江猪脚饭', 'jason3edc', '梁文道', '13660173976', 4, '6633363'),
(10015, '990525053@qq.com', '生物股长鸡排饭', 'jason4rfv', '游园', '13660173973', 5, '6633364'),
(10016, '990525054@qq.com', '饿窝叔叔', 'jason5tgb', '王浩宇', '13660173972', 6, '6633365'),
(10017, '990525055@qq.com', '兰州拉面', 'jason6yhn', '林力挺', '13660173971', 7, '6633366'),
(10018, '990525056@qq.com', '稻香酒家', 'jason7ujm', '张志伟', '13660173978', 8, '6633367'),
(10019, '990525057@qq.com', '枫叶餐厅', 'jason8ik', '陈啦啦', '13660173921', 9, '6633368'),
(10020, '990525058@qq.com', '千顺寿司', 'jason9ol', '黄旺丹', '13660173911', 10, '6633369'),
(10021, '990525059@qq.com', '瑞尔爷爷', 'jason0p', '王洁洁', '13660173942', 11, '6633351'),
(10023, '1143903090@qq.com', 'scutDB', 'password', 'aizen', '13660225219', 57, '665219');

--
-- 限制导出的表
--

--
-- 限制表 `iorder`
--
ALTER TABLE `iorder`
  ADD CONSTRAINT `iorder_ibfk_1` FOREIGN KEY (`productID`) REFERENCES `product` (`productID`);

--
-- 限制表 `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`sellerID`) REFERENCES `seller` (`sellerID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `seller`
--
ALTER TABLE `seller`
  ADD CONSTRAINT `seller_ibfk_1` FOREIGN KEY (`addressID`) REFERENCES `address` (`addressID`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
