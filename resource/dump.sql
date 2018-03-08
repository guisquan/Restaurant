-- MySQL dump 10.13  Distrib 5.7.21, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: restaurant
-- ------------------------------------------------------
-- Server version	5.7.21-0ubuntu0.16.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `desk`
--

DROP TABLE IF EXISTS `desk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `desk` (
  `did` int(11) NOT NULL AUTO_INCREMENT,
  `dName` varchar(32) DEFAULT NULL,
  `seatNum` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `dState` int(11) DEFAULT NULL,
  PRIMARY KEY (`did`),
  KEY `desk_users_FK` (`uid`),
  CONSTRAINT `desk_users_FK` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `desk`
--

LOCK TABLES `desk` WRITE;
/*!40000 ALTER TABLE `desk` DISABLE KEYS */;
INSERT INTO `desk` (`did`, `dName`, `seatNum`, `uid`, `dState`) VALUES (1,'一号桌',4,2,1),(2,'二号桌',2,2,1);
/*!40000 ALTER TABLE `desk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods`
--

DROP TABLE IF EXISTS `goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods` (
  `gid` int(11) NOT NULL AUTO_INCREMENT,
  `sid` int(11) NOT NULL,
  `gName` varchar(32) DEFAULT NULL,
  `gPrice` varchar(32) DEFAULT NULL,
  `gImage` varchar(256) DEFAULT NULL,
  `gStyle` int(11) DEFAULT NULL COMMENT '1-普通商品，2-热销商品 ，3-推荐商品',
  `cid` int(11) DEFAULT NULL,
  `gState` int(11) DEFAULT NULL,
  PRIMARY KEY (`gid`),
  KEY `goods_style_FK` (`sid`),
  CONSTRAINT `goods_style_FK` FOREIGN KEY (`sid`) REFERENCES `style` (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods`
--

LOCK TABLES `goods` WRITE;
/*!40000 ALTER TABLE `goods` DISABLE KEYS */;
INSERT INTO `goods` (`gid`, `sid`, `gName`, `gPrice`, `gImage`, `gStyle`, `cid`, `gState`) VALUES (1,4,'松鼠鲈鱼','15','/images/松鼠鲈鱼.jpg',1,1,1),(2,4,'宫保鸡丁','35','/images/宫保鸡丁.jpg',1,1,1),(3,4,'剁椒鱼头','78','/images/剁椒鱼头.jpg',1,1,1),(5,4,'灯影牛肉','48','/images/灯影牛肉.jpg',2,1,1),(6,4,'夫妻肺片','29','/images/夫妻肺片.jpg',3,1,1);
/*!40000 ALTER TABLE `goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `mId` varchar(32) NOT NULL,
  `mEmail` varchar(128) NOT NULL,
  `message` text NOT NULL,
  `mSubject` varchar(32) NOT NULL,
  `mState` int(11) NOT NULL DEFAULT '0',
  `mDate` date DEFAULT NULL,
  PRIMARY KEY (`mId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` (`mId`, `mEmail`, `message`, `mSubject`, `mState`, `mDate`) VALUES ('9101F2C1D1414AA7A9B04FCB16865BCB','123@qq.com','123123','1',0,'2018-03-06');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order` (
  `oid` varchar(64) NOT NULL,
  `oDate` date DEFAULT NULL,
  `totalPrice` decimal(10,0) DEFAULT NULL,
  `oState` int(11) DEFAULT NULL COMMENT '1-完成 2-下单未结账 3-人跑了，未结账',
  `uid` int(11) DEFAULT NULL,
  `did` int(11) DEFAULT NULL,
  PRIMARY KEY (`oid`),
  KEY `order_users_FK` (`uid`),
  KEY `order_desk_FK` (`did`),
  CONSTRAINT `order_desk_FK` FOREIGN KEY (`did`) REFERENCES `desk` (`did`),
  CONSTRAINT `order_users_FK` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` (`oid`, `oDate`, `totalPrice`, `oState`, `uid`, `did`) VALUES ('00F1AAABC2EA4E53A88D560FB749140E','2018-03-06',0,2,2,2),('1032651A2F0D4BD8B277802CFB52A1CA','2018-03-08',155,2,2,1),('1CF75C22C7864EADA9105DB9D37B0A9E','2018-03-06',50,2,2,1),('2DF758D7BF214A718AFD96FB06F0DEDF','2018-03-06',15,2,2,1),('77B7BEFD905F452289DE3B7942706795','2018-03-06',50,2,2,1),('7DCC24758DA24E5EB8DBF04A91EAE290','2018-03-06',50,2,2,1),('8446EE65453945B18BE174BC7006ADA3','2018-03-06',15,2,2,1),('E58453F33563436DB40F2B304975E3BC','2018-03-06',50,2,2,1),('FCAD9F34E1F74D46956A8B776F2282E5','2018-03-08',35,2,2,1);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderItem`
--

DROP TABLE IF EXISTS `orderItem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orderItem` (
  `oiid` varchar(32) NOT NULL,
  `gid` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `subtotal` decimal(10,0) DEFAULT NULL,
  `oid` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`oiid`),
  KEY `orderItem_goods_FK` (`gid`),
  KEY `orderItem_order_FK` (`oid`),
  CONSTRAINT `orderItem_goods_FK` FOREIGN KEY (`gid`) REFERENCES `goods` (`gid`),
  CONSTRAINT `orderItem_order_FK` FOREIGN KEY (`oid`) REFERENCES `order` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderItem`
--

LOCK TABLES `orderItem` WRITE;
/*!40000 ALTER TABLE `orderItem` DISABLE KEYS */;
INSERT INTO `orderItem` (`oiid`, `gid`, `count`, `subtotal`, `oid`) VALUES ('192E4825A22B4FC9BFED572627F5DE54',1,1,15,'2DF758D7BF214A718AFD96FB06F0DEDF'),('2A08A6FF8442400C8B66696767C86797',2,1,35,'FCAD9F34E1F74D46956A8B776F2282E5'),('5372ACC4A79B4D09BA13BA18AF123646',1,1,15,'7DCC24758DA24E5EB8DBF04A91EAE290'),('5CB57BBC6B8E4864A52F8950EC046F81',1,1,15,'E58453F33563436DB40F2B304975E3BC'),('6071B0734DFA4F62A0E58BD63DD5DE20',5,1,48,'1032651A2F0D4BD8B277802CFB52A1CA'),('64079BD9CD1D4B7897BF6D4C349C730E',2,1,35,'E58453F33563436DB40F2B304975E3BC'),('6B4AC6EBF98E4551A38801B78500DB1A',1,1,15,'77B7BEFD905F452289DE3B7942706795'),('7212B047B4D543D396D0C3B83B91047C',1,1,15,'8446EE65453945B18BE174BC7006ADA3'),('763E996FA34C4FCE88A826BA8BFF5CE3',1,1,15,'1CF75C22C7864EADA9105DB9D37B0A9E'),('86448BF4BB00474D9A3597406E7789ED',6,1,29,'1032651A2F0D4BD8B277802CFB52A1CA'),('8D3A2030EFBA4979B9E0D596428AA9A7',2,1,35,'7DCC24758DA24E5EB8DBF04A91EAE290'),('B28E2D291C7E4BC598658A91574F1A33',3,1,78,'1032651A2F0D4BD8B277802CFB52A1CA'),('BDE63B6417FB4E60AE91CBA0B6131D3C',2,1,35,'1CF75C22C7864EADA9105DB9D37B0A9E'),('C272E694B1C648198B60FC9545683071',2,1,35,'77B7BEFD905F452289DE3B7942706795');
/*!40000 ALTER TABLE `orderItem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `style`
--

DROP TABLE IF EXISTS `style`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `style` (
  `sid` int(11) NOT NULL AUTO_INCREMENT,
  `sName` varchar(32) DEFAULT NULL,
  `spid` int(11) DEFAULT NULL,
  `sPath` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `style`
--

LOCK TABLES `style` WRITE;
/*!40000 ALTER TABLE `style` DISABLE KEYS */;
INSERT INTO `style` (`sid`, `sName`, `spid`, `sPath`) VALUES (1,'美食',NULL,'|1|'),(2,'主食',NULL,'|2|'),(3,'米饭',2,'|2|3|'),(4,'川菜',1,'|1|4|'),(5,'餐具',NULL,'|5|'),(6,'金餐具',5,'|5|6|'),(7,'银餐具',5,'|5|7|'),(8,'青花瓷餐具',5,'|5|8|'),(10,'面',2,'|2|10|');
/*!40000 ALTER TABLE `style` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(32) DEFAULT NULL,
  `userPwd` varchar(128) DEFAULT NULL,
  `userType` int(11) DEFAULT NULL COMMENT '1-管理员 2-普通员工',
  `userState` int(11) DEFAULT NULL COMMENT '1-正常 0-无法正常上班',
  `userImage` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`uid`, `userName`, `userPwd`, `userType`, `userState`, `userImage`) VALUES (1,'gui','admin',1,1,'gui.png'),(2,'test','test',2,1,'test.jpg');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-08 18:21:46
