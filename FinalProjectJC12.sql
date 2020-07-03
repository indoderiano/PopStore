-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: final_project_jc12
-- ------------------------------------------------------
-- Server version	8.0.19

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `idaddress` int NOT NULL AUTO_INCREMENT,
  `address_details` varchar(200) NOT NULL,
  `iduser` int NOT NULL,
  PRIMARY KEY (`idaddress`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,'Jakarta',8),(2,'Bali',8);
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `idcategory` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idcategory`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'men'),(2,'women'),(3,'all');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `idcomments` int NOT NULL AUTO_INCREMENT,
  `comment` varchar(300) DEFAULT NULL,
  `idproduct` int NOT NULL,
  `iduser` int DEFAULT NULL,
  `createat` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idcomments`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,'this is comment',78,8,'2020-06-28 19:20:16'),(2,'comment',76,13,'2020-06-29 00:18:11'),(3,'reply',76,8,'2020-06-29 00:18:43');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery`
--

DROP TABLE IF EXISTS `delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery` (
  `iddelivery` int NOT NULL AUTO_INCREMENT,
  `delivery_method` varchar(45) NOT NULL,
  `delivery_cost` int NOT NULL DEFAULT '9500',
  `per_weight` int NOT NULL,
  PRIMARY KEY (`iddelivery`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery`
--

LOCK TABLES `delivery` WRITE;
/*!40000 ALTER TABLE `delivery` DISABLE KEYS */;
INSERT INTO `delivery` VALUES (1,'JNE',10000,1000),(2,'J&T',9500,1000),(3,'Grab',15000,3000),(4,'Gosend',16000,3000);
/*!40000 ALTER TABLE `delivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flashsaleproducts`
--

DROP TABLE IF EXISTS `flashsaleproducts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flashsaleproducts` (
  `idflashsaleproduct` int NOT NULL AUTO_INCREMENT,
  `idflashsale` int NOT NULL,
  `idproduct` int NOT NULL,
  `flashsale_price` int NOT NULL,
  `isapproved` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`idflashsaleproduct`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flashsaleproducts`
--

LOCK TABLES `flashsaleproducts` WRITE;
/*!40000 ALTER TABLE `flashsaleproducts` DISABLE KEYS */;
INSERT INTO `flashsaleproducts` VALUES (2,13,70,150000,0),(5,14,70,150000,1),(8,14,74,25000,1),(9,14,73,200000,1),(10,14,69,60000,1),(11,15,73,200000,1),(12,15,69,60000,1),(13,16,68,200000,1),(14,16,73,200000,1),(15,17,73,200000,1),(16,17,69,50000,0),(17,17,68,200000,1),(18,19,75,149000,1),(19,19,77,99000,1),(20,19,73,249000,1),(21,19,68,300000,0),(22,20,76,45000,1),(23,20,77,120000,1),(24,20,78,170000,1),(25,20,73,250000,1),(26,20,68,350000,0),(27,21,75,100000,1),(28,21,76,50000,1),(29,21,77,120000,1),(30,21,78,150000,0),(31,22,75,100000,1),(32,22,76,60000,1),(33,22,77,100000,0),(34,22,78,160000,1),(35,23,75,150000,1),(36,23,77,100000,1),(37,25,79,250000,1),(38,25,75,150000,1),(39,26,79,250000,1),(40,26,75,150000,1),(41,26,78,150000,0),(42,27,75,150000,1),(43,27,76,50000,1),(44,27,77,100000,1),(45,27,78,150000,1),(46,27,73,200000,1),(47,27,69,80000,0),(48,27,68,300000,1);
/*!40000 ALTER TABLE `flashsaleproducts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flashsales`
--

DROP TABLE IF EXISTS `flashsales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flashsales` (
  `idflashsale` int NOT NULL AUTO_INCREMENT,
  `startat` datetime NOT NULL,
  `finishat` datetime NOT NULL,
  `idflashsalestatus` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`idflashsale`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flashsales`
--

LOCK TABLES `flashsales` WRITE;
/*!40000 ALTER TABLE `flashsales` DISABLE KEYS */;
INSERT INTO `flashsales` VALUES (13,'2020-06-26 17:00:00','2020-06-26 18:00:00',3),(14,'2020-06-27 17:00:00','2020-06-27 18:00:00',3),(15,'2020-06-27 21:00:00','2020-06-27 23:00:00',3),(16,'2020-06-27 18:00:00','2020-06-27 20:00:00',3),(17,'2020-06-28 01:00:00','2020-06-28 03:00:00',3),(18,'2020-06-28 15:00:00','2020-06-28 17:00:00',3),(19,'2020-06-28 05:00:00','2020-06-28 07:00:00',3),(20,'2020-06-28 10:00:00','2020-06-28 12:00:00',3),(21,'2020-06-28 20:00:00','2020-06-28 22:00:00',3),(22,'2020-06-28 23:00:00','2020-06-29 01:00:00',3),(23,'2020-06-29 07:00:00','2020-06-29 09:00:00',3),(24,'2020-06-29 20:00:00','2020-06-29 22:00:00',3),(25,'2020-06-29 21:00:00','2020-06-29 23:00:00',3),(26,'2020-06-30 01:00:00','2020-06-30 03:00:00',3),(27,'2020-06-30 11:00:00','2020-06-30 13:00:00',3);
/*!40000 ALTER TABLE `flashsales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flashsalestatus`
--

DROP TABLE IF EXISTS `flashsalestatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flashsalestatus` (
  `idflashsalestatus` int NOT NULL AUTO_INCREMENT,
  `flashsalestatus` varchar(45) NOT NULL,
  PRIMARY KEY (`idflashsalestatus`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flashsalestatus`
--

LOCK TABLES `flashsalestatus` WRITE;
/*!40000 ALTER TABLE `flashsalestatus` DISABLE KEYS */;
INSERT INTO `flashsalestatus` VALUES (1,'accepting request'),(2,'active'),(3,'finished');
/*!40000 ALTER TABLE `flashsalestatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `images` (
  `idimages` int NOT NULL AUTO_INCREMENT,
  `nama` varchar(45) NOT NULL,
  `path` varchar(45) NOT NULL,
  PRIMARY KEY (`idimages`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
INSERT INTO `images` VALUES (1,'','/photo/PRD1591163244641.png'),(2,'testname','/photo/PRD1591163579198.jpg');
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `items` (
  `iditem` int NOT NULL AUTO_INCREMENT,
  `idproduct` int NOT NULL,
  `type` varchar(200) DEFAULT NULL,
  `price` int DEFAULT NULL,
  `weight` int NOT NULL DEFAULT '1000',
  `stock` int DEFAULT NULL,
  `image` varchar(400) DEFAULT NULL,
  `createat` datetime DEFAULT CURRENT_TIMESTAMP,
  `updateat` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`iditem`)
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (72,64,'[\"small\",\"black\"]',NULL,1000,NULL,'[\"/products/PRD1591779947151.png\",\"/products/PRD1591781133605.jpg\"]','2020-06-13 17:13:16','2020-06-13 17:13:16'),(73,64,'[\"small\",\"brown\"]',NULL,1000,NULL,NULL,'2020-06-13 17:13:16','2020-06-13 17:13:16'),(74,64,'[\"big\",\"black\"]',NULL,1000,NULL,NULL,'2020-06-13 17:13:16','2020-06-13 17:13:16'),(75,64,'[\"big\",\"brown\"]',NULL,1000,NULL,NULL,'2020-06-13 17:13:16','2020-06-13 17:13:16'),(76,65,'\"\"',250000,1000,10,'[\"/products/PRD1591886341799.png\",\"/products/PRD1591886341824.jpg\"]','2020-06-13 17:13:16','2020-06-13 17:13:16'),(77,66,'[\"small\"]',NULL,1000,NULL,'[\"/products/PRD1591974161540.png\",\"/products/PRD1591974161570.jpg\"]','2020-06-13 17:13:16','2020-06-13 17:13:16'),(78,66,'[\"big\"]',NULL,1000,NULL,'[\"/products/PRD1591974171971.png\",\"/products/PRD1591974171988.jpg\"]','2020-06-13 17:13:16','2020-06-13 17:13:16'),(79,67,'[\"small\",\"brown\"]',NULL,1000,NULL,'[\"/products/PRD1591981777255.png\",\"/products/PRD1591981777278.jpg\"]','2020-06-13 17:13:16','2020-06-13 17:13:16'),(80,67,'[\"small\",\"black\"]',NULL,1000,NULL,'[\"/products/PRD1591981786387.png\",\"/products/PRD1591981786423.jpg\"]','2020-06-13 17:13:16','2020-06-13 17:13:16'),(81,67,'[\"big\",\"brown\"]',NULL,1000,NULL,'[\"/products/PRD1591981796931.png\",\"/products/PRD1591981796951.jpg\"]','2020-06-13 17:13:16','2020-06-13 17:13:16'),(82,67,'[\"big\",\"black\"]',NULL,1000,NULL,'[\"/products/PRD1591981805942.png\",\"/products/PRD1591981805984.jpg\"]','2020-06-13 17:13:16','2020-06-13 17:13:16'),(83,68,'[\"small\",\"brown\"]',100000,1000,10,'[\"/products/PRD1591993462099.png\",\"/products/PRD1591993462191.jpg\"]','2020-06-13 17:13:16','2020-06-13 17:13:16'),(84,68,'[\"small\",\"black\"]',200000,1000,20,'[\"/products/PRD1591993487719.png\",\"/products/PRD1591993487730.jpg\"]','2020-06-13 17:13:16','2020-06-13 17:13:16'),(85,68,'[\"big\",\"brown\"]',300000,1000,31,'[\"/products/PRD1591993506404.png\",\"/products/PRD1591993506421.jpg\"]','2020-06-13 17:13:16','2020-06-25 05:38:17'),(86,68,'[\"big\",\"black\"]',400000,1000,37,'[\"/products/PRD1591993522334.png\",\"/products/PRD1591993522350.jpg\"]','2020-06-13 17:13:16','2020-06-22 17:43:50'),(87,69,'\"\"',100000,1000,10,'[\"/products/PRD1592072240378.png\",\"/products/PRD1592072240417.jpg\",\"/products/PRD1592072240426.png\",\"/products/PRD1592072252583.png\",\"/products/PRD1592072252608.jpg\"]','2020-06-14 02:17:00','2020-06-28 08:27:14'),(88,70,'[\"42\",\"brown\"]',100000,1000,10,'[\"/products/PRD1592218999774.png\",\"/products/PRD1592218999814.jpg\"]','2020-06-15 19:02:54','2020-06-15 19:03:33'),(89,70,'[\"42\",\"tan\"]',200000,1000,20,'[\"/products/PRD1592219022416.png\",\"/products/PRD1592219022434.jpg\"]','2020-06-15 19:02:54','2020-06-21 13:21:53'),(90,70,'[\"43\",\"brown\"]',300000,1000,12,'[\"/products/PRD1592219052918.png\",\"/products/PRD1592219052936.jpg\"]','2020-06-15 19:02:54','2020-06-22 13:50:59'),(91,70,'[\"43\",\"tan\"]',400000,1000,5,'[\"/products/PRD1592219098546.png\",\"/products/PRD1592219098571.jpg\"]','2020-06-15 19:02:54','2020-06-22 13:50:59'),(92,71,'\"\"',300000,1000,10,NULL,'2020-06-18 09:21:23','2020-06-18 10:00:25'),(93,72,'\"\"',NULL,1000,NULL,NULL,'2020-06-20 20:34:43','2020-06-20 20:34:43'),(94,73,'[\"green\",\"41\"]',400000,1000,10,'[\"/products/PRD1592852326831.jpg\",\"/products/PRD1592852332482.jpg\",\"/products/PRD1592852336705.jpg\",\"/products/PRD1592852344265.jpg\"]','2020-06-23 02:55:39','2020-06-23 03:00:38'),(95,73,'[\"green\",\"42\"]',400000,1000,10,NULL,'2020-06-23 02:55:39','2020-06-23 03:00:49'),(96,73,'[\"green\",\"43\"]',400000,1000,9,NULL,'2020-06-23 02:55:40','2020-06-23 03:00:58'),(97,73,'[\"green\",\"44\"]',400000,1000,8,NULL,'2020-06-23 02:55:40','2020-06-23 03:01:06'),(98,73,'[\"black\",\"41\"]',400000,1000,10,'[\"/products/PRD1592852358248.jpg\",\"/products/PRD1592852363257.jpg\",\"/products/PRD1592852368244.jpg\",\"/products/PRD1592852373416.jpg\"]','2020-06-23 02:55:40','2020-06-23 03:01:15'),(99,73,'[\"black\",\"42\"]',400000,1000,10,NULL,'2020-06-23 02:55:40','2020-06-23 03:01:23'),(100,73,'[\"black\",\"43\"]',420000,1000,10,NULL,'2020-06-23 02:55:40','2020-06-23 03:01:36'),(101,73,'[\"black\",\"44\"]',420000,1000,10,NULL,'2020-06-23 02:55:41','2020-06-23 03:01:44'),(102,74,'\"\"',50000,1000,100,NULL,'2020-06-26 18:05:28','2020-06-26 18:05:47'),(103,75,'[\"blue\"]',200000,1000,100,NULL,'2020-06-28 00:52:42','2020-06-28 00:52:58'),(104,75,'[\"dark gray\"]',200000,1000,100,'[\"/products/PRD1593276784274.jpg\"]','2020-06-28 00:52:42','2020-06-28 00:53:10'),(105,75,'[\"gray\"]',200000,1000,98,'[\"/products/PRD1593276794692.jpg\"]','2020-06-28 00:52:42','2020-06-28 00:53:20'),(106,76,'[\"black\"]',70000,1000,99,'[\"/products/PRD1593276960356.jpg\"]','2020-06-28 00:55:50','2020-06-28 00:56:13'),(107,76,'[\"dark gray\"]',70000,1000,98,NULL,'2020-06-28 00:55:50','2020-06-28 08:30:19'),(108,76,'[\"blue\"]',70000,1000,99,'[\"/products/PRD1593276988859.jpg\"]','2020-06-28 00:55:50','2020-06-28 00:56:36'),(109,76,'[\"gray\"]',70000,1000,100,'[\"/products/PRD1593277002297.jpg\"]','2020-06-28 00:55:50','2020-06-28 00:56:49'),(110,76,'[\"white\"]',70000,1000,97,'[\"/products/PRD1593277015430.jpg\"]','2020-06-28 00:55:51','2020-06-28 00:57:00'),(111,77,'[\"green\"]',150000,1000,97,NULL,'2020-06-28 00:58:48','2020-06-28 00:59:20'),(112,77,'[\"navy\"]',150000,1000,99,'[\"/products/PRD1593277152703.jpg\"]','2020-06-28 00:58:48','2020-06-28 00:59:27'),(113,77,'[\"white\"]',150000,1000,99,'[\"/products/PRD1593277176641.jpg\"]','2020-06-28 00:58:49','2020-06-28 00:59:43'),(114,78,'[\"navy\"]',200000,1000,100,NULL,'2020-06-28 01:01:12','2020-06-28 01:01:21'),(115,78,'[\"blue\"]',200000,1000,98,'[\"/products/PRD1593277288041.jpg\"]','2020-06-28 01:01:12','2020-06-28 01:01:34'),(116,78,'[\"white\"]',200000,1000,98,'[\"/products/PRD1593277300433.jpg\"]','2020-06-28 01:01:12','2020-06-28 01:01:47'),(117,79,'[\"green\",\"42\"]',400000,1000,100,'[\"/products/PRD1593536479022.jpg\"]','2020-06-29 21:03:24','2020-07-01 01:01:19'),(118,79,'[\"green\",\"43\"]',400000,1000,100,'[\"/products/PRD1593536472923.jpg\"]','2020-06-29 21:03:25','2020-07-01 01:01:31'),(119,79,'[\"green\",\"44\"]',400000,1000,99,'[\"/products/PRD1593536711609.jpg\"]','2020-06-29 21:03:25','2020-07-01 01:05:12'),(120,79,'[\"green\",\"45\"]',400000,1000,100,'[\"/products/PRD1593536720724.jpg\"]','2020-06-29 21:03:25','2020-07-01 01:05:21'),(121,79,'[\"black\",\"42\"]',400000,1000,100,'[\"/products/PRD1593536738480.jpg\",\"/products/PRD1593536757793.jpg\",\"/products/PRD1593536765707.jpg\",\"/products/PRD1593536770723.jpg\"]','2020-06-29 21:03:25','2020-07-01 01:06:11'),(122,79,'[\"black\",\"43\"]',400000,1000,100,NULL,'2020-06-29 21:03:25','2020-06-29 21:06:38'),(123,79,'[\"black\",\"44\"]',400000,1000,99,NULL,'2020-06-29 21:03:26','2020-06-29 21:06:45'),(124,79,'[\"black\",\"45\"]',400000,1000,100,NULL,'2020-06-29 21:03:26','2020-06-29 21:06:55'),(125,80,'[\"42\"]',400000,1000,100,NULL,'2020-06-30 01:19:43','2020-06-30 01:20:54'),(126,80,'[\"43\"]',400000,1000,100,NULL,'2020-06-30 01:19:43','2020-06-30 01:21:03'),(127,80,'[\"44\"]',400000,1000,99,NULL,'2020-06-30 01:19:43','2020-06-30 01:21:21'),(128,80,'[\"45\"]',400000,1000,100,NULL,'2020-06-30 01:19:43','2020-06-30 01:21:28');
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `merk`
--

DROP TABLE IF EXISTS `merk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `merk` (
  `idmerk` int NOT NULL AUTO_INCREMENT,
  `merk_name` varchar(45) NOT NULL,
  PRIMARY KEY (`idmerk`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `merk`
--

LOCK TABLES `merk` WRITE;
/*!40000 ALTER TABLE `merk` DISABLE KEYS */;
INSERT INTO `merk` VALUES (1,'adidas'),(2,'nike'),(3,'puma'),(4,'ortuseight'),(5,'uniqlo'),(6,'h&m'),(99,'no merk');
/*!40000 ALTER TABLE `merk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderstatus`
--

DROP TABLE IF EXISTS `orderstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderstatus` (
  `idorderstatus` int NOT NULL AUTO_INCREMENT,
  `orderstatus_name` varchar(80) NOT NULL,
  PRIMARY KEY (`idorderstatus`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderstatus`
--

LOCK TABLES `orderstatus` WRITE;
/*!40000 ALTER TABLE `orderstatus` DISABLE KEYS */;
INSERT INTO `orderstatus` VALUES (1,'On Cart'),(2,'On Progress'),(3,'Delivered'),(4,'Completed'),(5,'Return'),(6,'Refund');
/*!40000 ALTER TABLE `orderstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `packagestatus`
--

DROP TABLE IF EXISTS `packagestatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `packagestatus` (
  `idpackagestatus` int NOT NULL AUTO_INCREMENT,
  `package_status` varchar(45) NOT NULL,
  PRIMARY KEY (`idpackagestatus`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `packagestatus`
--

LOCK TABLES `packagestatus` WRITE;
/*!40000 ALTER TABLE `packagestatus` DISABLE KEYS */;
INSERT INTO `packagestatus` VALUES (1,'Checkout'),(2,'Order Received By Seller'),(3,'On Delivery'),(4,'Delivered'),(5,'Accepted'),(6,'Cancelled');
/*!40000 ALTER TABLE `packagestatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `idpayment` int NOT NULL AUTO_INCREMENT,
  `payment_method` varchar(70) NOT NULL,
  PRIMARY KEY (`idpayment`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,'Transfer'),(2,'CC'),(3,'Cash On Delivery'),(4,'Popcoin');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `idproduct` int NOT NULL AUTO_INCREMENT,
  `idseller` int NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `imagecover` varchar(200) NOT NULL,
  `description` varchar(400) DEFAULT NULL,
  `variant` varchar(200) DEFAULT NULL,
  `isdeleted` tinyint NOT NULL DEFAULT '0',
  `createat` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateat` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `category` varchar(200) NOT NULL,
  `isblocked` tinyint NOT NULL DEFAULT '0',
  `sold` int DEFAULT NULL,
  `product_rating` decimal(2,1) DEFAULT NULL,
  `product_rating_count` int DEFAULT NULL,
  `idcategory` int NOT NULL DEFAULT '3',
  `idmerk` int NOT NULL DEFAULT '99',
  `seen` int NOT NULL DEFAULT '0',
  `isflashsale` tinyint DEFAULT '0',
  PRIMARY KEY (`idproduct`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (68,2,'Boots','[\"/products/CVR1591982770924.png\",\"/products/CVR1591982770942.jpg\"]','Cras ultrices nisi sed molestie pretium. Ut ullamcorper erat congue ex aliquet, ut porttitor nisi dignissim. Ut ut interdum eros. Vestibulum id risus ut felis suscipit pulvinar. Ut ultrices sollicitudin justo, at facilisis nulla fringilla sit amet','[{\"name\":\"size\",\"types\":[\"small\",\"big\"]},{\"name\":\"color\",\"types\":[\"brown\",\"black\"]},{}]',0,'2020-06-13 01:26:10','2020-07-01 00:34:00','',0,9,4.7,3,3,99,3,0),(69,2,'Boot single type','[\"/products/CVR1592072220133.png\",\"/products/CVR1592072220342.jpg\"]','Praesent volutpat consectetur tincidunt. Proin dapibus diam vitae odio rhoncus aliquet. Vivamus ultrices urna massa','[{\"name\":\"\",\"types\":[]}]',0,'2020-06-14 02:17:00','2020-06-27 23:00:01','',0,7,4.0,2,3,99,2,0),(70,1,'Leather Shoe','[\"/products/CVR1592218973119.png\"]','Sed sit amet mattis urna. Quisque ultrices est vel mauris vestibulum feugiat. Etiam ac diam at purus euismod dictum','[{\"name\":\"size\",\"types\":[\"42\",\"43\"]},{\"name\":\"color\",\"types\":[\"brown\",\"tan\"]}]',0,'2020-06-15 19:02:53','2020-06-15 19:02:53','fashion,sepatu,leather,pria',0,12,4.4,8,3,1,6,0),(71,3,'Fossil Buckner Messenger Bag','[\"/products/CVR1592443283546.jpg\",\"/products/CVR1592443491107.jpg\"]','Mauris tempus finibus dui, at faucibus arcu ultrices ut. Maecenas enim nulla, congue euismod maximus sit amet, viverra ac dui. Duis sed congue ex','[{\"name\":\"\",\"types\":[]}]',0,'2020-06-18 09:21:23','2020-06-18 09:24:51','leather,bag,pria,fashion',0,NULL,NULL,NULL,2,2,0,0),(72,1,'Dasi','[\"/products/CVR1592714831727.jpg\"]','Curabitur nibh nunc, auctor nec tortor in, finibus egestas purus. Cras vehicula urna et laoreet vulputate','[{\"name\":\"\",\"types\":[]}]',0,'2020-06-20 20:34:42','2020-06-21 12:47:12','men,dasi,formal',0,NULL,NULL,NULL,1,3,0,0),(73,2,'Sepatu Bola Ortuseight Forte Valkyrie FG','[\"/products/CVR1592852138026.jpg\"]','Cras varius leo quam, eget placerat justo consectetur sed. Ut elit velit, tincidunt eu efficitur at, commodo sed lorem','[{\"name\":\"color\",\"types\":[\"green\",\"black\"]},{\"name\":\"size\",\"types\":[\"41\",\"42\",\"43\",\"44\"]}]',0,'2020-06-23 02:55:38','2020-07-01 00:34:00','sport,sepatu bola,ortuseight,hijau,biru',0,3,4.7,3,1,4,11,0),(74,1,'Kaos Oblong','[\"/products/CVR1593165928279.png\"]','Sed eget purus at enim laoreet tristique. Mauris et tempus sapien. Quisque vel justo pellentesque, interdum purus','[{\"name\":\"\",\"types\":[]}]',0,'2020-06-26 18:05:28','2020-06-26 18:05:28','kaos,hijau',0,NULL,NULL,NULL,3,99,1,0),(75,4,'Sweater Hoodie','[\"/products/CVR1593276762044.jpg\"]','Aenean sit amet orci porta, maximus tellus ut, tincidunt magna. Nam scelerisque tellus et dui sodales ultrices','[{\"name\":\"color\",\"types\":[\"blue\",\"dark gray\",\"gray\"]}]',0,'2020-06-28 00:52:42','2020-07-01 00:34:00','hoodie,jaket',0,2,4.5,2,1,5,27,0),(76,4,'Kaos Dry Crew Neck','[\"/products/CVR1593276950353.jpg\"]','Phasellus malesuada, velit a laoreet mollis, enim purus fringilla purus, sed vehicula magna tortor nec turpis. Vestibulum est augue, accumsan','[{\"name\":\"color\",\"types\":[\"black\",\"dark gray\",\"blue\",\"gray\",\"white\"]}]',0,'2020-06-28 00:55:50','2020-07-01 00:34:00','kaos',0,6,4.5,6,1,5,11,0),(77,4,'Kemeja Flannel Kotak','[\"/products/CVR1593277128660.jpg\"]','Nulla placerat ultricies imperdiet. Suspendisse porta sit amet erat a mattis. Etiam iaculis venenatis est at feugiat','[{\"name\":\"color\",\"types\":[\"green\",\"navy\",\"white\"]}]',0,'2020-06-28 00:58:48','2020-07-01 00:34:00','flannel,kemeja',0,4,4.8,4,1,5,10,0),(78,4,'Kemeja EFC Broadcloth','[\"/products/CVR1593277272355.jpg\"]','In ac nunc ut tortor fringilla vulputate. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer pharetra','[{\"name\":\"color\",\"types\":[\"navy\",\"blue\",\"white\"]}]',0,'2020-06-28 01:01:12','2020-07-01 00:34:00','kemeja,casual,polos',0,3,5.0,3,1,5,26,0),(79,5,'Ortuseight Vorte Valkyrie FG','[\"/products/CVR1593536014898.jpg\"]','Sed ultrices maximus arcu, in finibus erat varius id. Curabitur odio ex, vulputate et mattis ac, gravida at dui. Etiam rhoncus vel lacus vitae cursus. Pellentesque bibendum sem','[{\"name\":\"color\",\"types\":[\"green\",\"black\"]},{\"name\":\"size\",\"types\":[\"42\",\"43\",\"44\",\"45\"]}]',0,'2020-06-29 21:03:24','2020-07-01 00:53:35','sepatu bola,green,black,sepakbola',0,1,5.0,1,1,4,21,0),(80,5,'Ortuseight Catalyst Mistique FG Maroon','[\"/products/CVR1593540340897.jpg\",\"/products/CVR1593540345930.jpg\",\"/products/CVR1593540350022.jpg\",\"/products/CVR1593540353632.jpg\"]','Donec a finibus neque. Quisque luctus, odio in maximus posuere, felis tortor lacinia lacus, sed porttitor risus felis vel leo. Donec ultrices justo sed','[{\"name\":\"size\",\"types\":[\"42\",\"43\",\"44\",\"45\"]}]',0,'2020-06-30 01:19:43','2020-07-01 02:05:54','sepatu bola,maroon,sport',0,NULL,NULL,NULL,1,4,2,0);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seller`
--

DROP TABLE IF EXISTS `seller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seller` (
  `idseller` int NOT NULL AUTO_INCREMENT,
  `iduser` int NOT NULL,
  `namatoko` varchar(100) NOT NULL,
  `alamattoko` varchar(200) DEFAULT NULL,
  `imageprofile` varchar(300) DEFAULT NULL,
  `isverified` tinyint NOT NULL DEFAULT '0',
  `isblocked` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`idseller`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seller`
--

LOCK TABLES `seller` WRITE;
/*!40000 ALTER TABLE `seller` DISABLE KEYS */;
INSERT INTO `seller` VALUES (1,8,'indo store',NULL,NULL,1,0),(2,10,'kate store',NULL,NULL,1,0),(3,9,'Bull Allure',NULL,NULL,1,0),(4,12,'uniqlo','gandaria city','/sellers/SLR1593276588361.png',0,0),(5,14,'ortuseight','Jakarta','/sellers/SLR1593435389481.png',0,0);
/*!40000 ALTER TABLE `seller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status` (
  `idstatus` int NOT NULL AUTO_INCREMENT,
  `status_name` varchar(80) NOT NULL,
  PRIMARY KEY (`idstatus`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` VALUES (1,'checkout'),(2,'paid'),(3,'verified'),(4,'complete'),(5,'expired'),(6,'cancel');
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactiondetails`
--

DROP TABLE IF EXISTS `transactiondetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactiondetails` (
  `idtransactiondetail` int NOT NULL AUTO_INCREMENT,
  `iduser` tinyint NOT NULL,
  `idorderstatus` tinyint NOT NULL,
  `isdeleted` tinyint DEFAULT '0',
  `isselected` tinyint NOT NULL DEFAULT '1',
  `iditem` int NOT NULL,
  `idtransaction` int DEFAULT NULL,
  `idtransactionseller` int DEFAULT NULL,
  `sellerpromo` decimal(2,2) DEFAULT NULL,
  `checkout_price` int DEFAULT NULL,
  `rating` int DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `message` varchar(200) DEFAULT NULL,
  `paid` int DEFAULT NULL,
  `order_updateat` datetime DEFAULT NULL,
  `order_createat` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `seen` int DEFAULT '0',
  PRIMARY KEY (`idtransactiondetail`),
  KEY `id transaction_idx` (`idtransaction`),
  CONSTRAINT `id transaction` FOREIGN KEY (`idtransaction`) REFERENCES `transactions` (`idtransaction`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=162 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactiondetails`
--

LOCK TABLES `transactiondetails` WRITE;
/*!40000 ALTER TABLE `transactiondetails` DISABLE KEYS */;
INSERT INTO `transactiondetails` VALUES (44,8,2,0,1,90,24,29,NULL,NULL,NULL,1,'',NULL,'2020-06-17 12:35:52','2020-06-17 12:34:55',0),(45,8,2,0,1,91,24,29,NULL,NULL,NULL,1,'',NULL,'2020-06-17 12:35:52','2020-06-17 12:34:57',0),(46,8,4,0,1,87,24,30,NULL,NULL,NULL,1,'',NULL,'2020-06-28 16:42:08','2020-06-17 12:35:04',0),(47,8,4,0,1,86,24,30,NULL,NULL,NULL,1,'',NULL,'2020-06-28 16:42:08','2020-06-17 12:35:14',0),(48,8,4,0,1,85,24,30,NULL,NULL,NULL,1,'',NULL,'2020-06-28 16:42:08','2020-06-17 12:35:17',0),(49,8,2,0,1,86,48,55,NULL,400000,NULL,1,'',NULL,'2020-06-20 10:42:43','2020-06-17 18:03:53',0),(50,8,2,0,1,87,25,31,NULL,NULL,NULL,1,'',NULL,'2020-06-18 03:34:20','2020-06-17 18:04:01',0),(51,8,2,0,1,90,25,32,NULL,NULL,NULL,1,'',NULL,'2020-06-18 03:34:20','2020-06-17 18:04:17',0),(52,8,2,0,1,91,25,32,NULL,NULL,NULL,1,'',NULL,'2020-06-18 03:34:20','2020-06-17 18:04:19',0),(53,8,2,0,1,91,26,33,NULL,NULL,NULL,1,'',NULL,'2020-06-18 03:38:26','2020-06-18 03:37:13',0),(54,8,2,0,1,87,27,34,NULL,NULL,NULL,1,'',NULL,'2020-06-18 03:49:05','2020-06-18 03:42:10',0),(55,8,2,0,1,90,28,35,NULL,NULL,NULL,1,'',NULL,'2020-06-18 03:51:51','2020-06-18 03:51:30',0),(56,8,2,0,1,89,29,36,NULL,NULL,NULL,1,'',NULL,'2020-06-18 03:54:05','2020-06-18 03:53:43',0),(57,8,2,0,1,92,30,37,NULL,NULL,NULL,1,'',NULL,'2020-06-18 10:08:44','2020-06-18 10:08:18',0),(58,8,2,0,1,92,31,38,NULL,NULL,NULL,1,'',NULL,'2020-06-18 18:53:38','2020-06-18 18:53:16',0),(59,8,2,0,1,92,32,39,NULL,NULL,NULL,1,'',NULL,'2020-06-19 00:30:44','2020-06-19 00:27:30',0),(60,8,2,0,1,83,33,40,NULL,NULL,NULL,1,'',NULL,'2020-06-19 00:55:56','2020-06-19 00:41:00',0),(61,8,2,0,1,87,33,40,NULL,NULL,NULL,1,'',NULL,'2020-06-19 00:55:56','2020-06-19 00:41:09',0),(62,8,2,0,1,91,33,41,NULL,NULL,NULL,1,'',NULL,'2020-06-19 00:55:56','2020-06-19 00:41:17',0),(63,8,2,0,1,91,34,42,NULL,NULL,NULL,1,'',NULL,'2020-06-19 00:57:49','2020-06-19 00:57:36',0),(64,8,2,0,1,92,35,43,NULL,NULL,NULL,1,'',NULL,'2020-06-19 01:58:25','2020-06-19 01:58:15',0),(65,8,2,0,1,92,36,44,NULL,300000,NULL,1,'',NULL,'2020-06-19 06:10:15','2020-06-19 06:10:00',0),(66,8,2,0,1,87,39,45,NULL,100000,NULL,1,'',NULL,'2020-06-19 12:49:18','2020-06-19 08:02:09',0),(67,8,2,0,1,91,39,46,NULL,400000,NULL,1,'',NULL,'2020-06-19 12:49:18','2020-06-19 08:02:20',0),(68,8,2,0,1,90,39,46,NULL,300000,NULL,1,'',NULL,'2020-06-19 12:49:18','2020-06-19 08:02:23',0),(69,8,2,0,1,92,40,47,NULL,300000,NULL,8,'',NULL,'2020-06-19 15:26:06','2020-06-19 15:17:50',0),(70,8,2,0,1,92,41,48,NULL,300000,NULL,1,'',NULL,'2020-06-19 15:55:19','2020-06-19 15:33:03',0),(71,8,2,0,1,92,42,49,NULL,300000,NULL,1,'',NULL,'2020-06-19 15:56:51','2020-06-19 15:56:39',0),(72,8,2,0,1,92,64,79,NULL,300000,NULL,1,'',NULL,'2020-06-21 21:54:58','2020-06-19 15:57:15',0),(73,8,2,0,1,91,43,50,NULL,400000,NULL,2,'',NULL,'2020-06-20 05:43:15','2020-06-19 17:32:08',0),(74,8,2,0,1,87,44,51,NULL,100000,NULL,1,'',NULL,'2020-06-20 06:18:46','2020-06-20 06:17:36',0),(75,8,2,0,1,85,45,52,NULL,300000,NULL,1,'',NULL,'2020-06-20 06:26:01','2020-06-20 06:25:27',0),(76,8,2,0,1,87,46,53,NULL,100000,NULL,1,'',NULL,'2020-06-20 07:18:08','2020-06-20 07:17:51',0),(77,8,2,0,1,87,47,54,NULL,100000,NULL,2,'testing',NULL,'2020-06-20 07:19:38','2020-06-20 07:18:54',0),(78,8,2,0,1,87,51,59,NULL,100000,NULL,1,'',NULL,'2020-06-20 20:58:05','2020-06-20 07:20:12',0),(79,8,4,0,1,90,50,57,NULL,300000,5,1,'',NULL,'2020-06-22 17:52:55','2020-06-20 11:15:13',0),(80,8,4,0,1,86,52,60,NULL,400000,NULL,5,'',NULL,'2020-06-28 16:42:08','2020-06-20 11:15:14',0),(81,8,2,0,1,85,49,56,NULL,300000,NULL,1,'',NULL,'2020-06-20 12:58:15','2020-06-20 11:15:14',0),(82,8,4,0,1,91,50,57,NULL,400000,4,1,'',NULL,'2020-06-22 17:52:57','2020-06-20 11:15:14',0),(83,8,4,0,1,85,50,58,NULL,300000,NULL,1,'',NULL,'2020-06-28 01:05:38','2020-06-20 13:58:15',0),(84,8,4,0,1,85,52,60,NULL,300000,NULL,1,'',NULL,'2020-06-28 16:42:08','2020-06-20 21:21:38',0),(85,8,4,0,1,87,52,60,NULL,100000,NULL,1,'',NULL,'2020-06-28 16:42:08','2020-06-20 21:21:47',0),(86,8,4,0,1,91,52,61,NULL,400000,4,1,'',NULL,'2020-06-22 17:52:47','2020-06-20 21:21:56',0),(87,8,4,0,1,90,52,61,NULL,300000,5,1,'',NULL,'2020-06-22 17:52:46','2020-06-20 21:21:58',0),(88,8,2,0,1,87,54,63,NULL,100000,NULL,1,'',NULL,'2020-06-21 13:26:32','2020-06-20 21:58:27',0),(89,8,2,0,1,87,53,62,NULL,100000,NULL,1,'',NULL,'2020-06-21 00:03:29','2020-06-20 21:58:27',0),(90,8,2,0,1,91,54,64,NULL,400000,NULL,1,'',NULL,'2020-06-21 13:26:32','2020-06-21 13:05:06',0),(91,8,2,0,1,87,55,65,NULL,100000,NULL,1,'',NULL,'2020-06-21 23:34:59','2020-06-21 13:26:33',0),(92,8,4,0,1,87,56,67,NULL,100000,NULL,1,'',NULL,'2020-06-28 16:42:07','2020-06-21 13:26:33',0),(93,8,2,0,1,91,55,66,NULL,400000,NULL,1,'',NULL,'2020-06-21 13:35:58','2020-06-21 13:33:18',0),(94,8,4,0,1,91,56,68,NULL,400000,4,1,'',NULL,'2020-06-22 17:52:39','2020-06-21 13:37:45',0),(95,8,4,0,1,90,57,69,NULL,300000,5,1,'',NULL,'2020-06-22 17:52:36','2020-06-21 13:50:11',0),(96,8,4,0,1,87,58,70,NULL,100000,4,1,'',NULL,'2020-06-29 08:32:31','2020-06-21 14:20:46',0),(97,8,4,0,1,85,58,70,NULL,300000,5,1,'',NULL,'2020-06-29 08:32:32','2020-06-21 14:27:56',0),(98,8,4,0,1,91,58,71,NULL,400000,NULL,1,'',NULL,'2020-06-22 23:58:49','2020-06-21 14:29:10',0),(99,8,4,0,1,91,59,72,NULL,400000,4,1,'',NULL,'2020-06-22 17:52:27','2020-06-21 15:22:32',0),(100,8,2,0,1,86,65,81,NULL,400000,NULL,1,'',NULL,'2020-06-22 01:03:34','2020-06-21 18:07:48',0),(101,8,4,0,1,91,64,80,NULL,400000,NULL,1,'',NULL,'2020-06-22 23:58:49','2020-06-21 21:50:15',0),(102,8,1,0,0,92,NULL,NULL,NULL,NULL,NULL,11,'',NULL,'2020-07-01 01:27:04','2020-06-22 01:19:32',0),(103,8,2,0,1,86,72,93,NULL,400000,NULL,1,'',NULL,'2020-06-22 16:43:49','2020-06-22 02:03:33',0),(104,11,2,0,1,91,66,82,NULL,400000,NULL,1,'',NULL,'2020-06-22 13:43:41','2020-06-22 13:42:31',0),(105,11,2,0,1,90,66,82,NULL,300000,NULL,1,'',NULL,'2020-06-22 13:43:41','2020-06-22 13:42:33',0),(106,11,1,0,0,89,NULL,NULL,NULL,NULL,NULL,1,'',NULL,'2020-06-22 13:47:39','2020-06-22 13:42:36',0),(107,11,2,0,1,85,66,83,NULL,300000,NULL,1,'',NULL,'2020-06-22 13:43:41','2020-06-22 13:43:22',0),(108,11,2,0,1,91,67,84,NULL,400000,NULL,1,'',NULL,'2020-06-22 13:45:50','2020-06-22 13:45:11',0),(109,11,2,0,1,90,67,84,NULL,300000,NULL,1,'',NULL,'2020-06-22 13:45:50','2020-06-22 13:45:12',0),(110,11,2,0,1,85,67,85,NULL,300000,NULL,1,'',NULL,'2020-06-22 13:45:50','2020-06-22 13:45:12',0),(111,11,2,0,1,91,68,86,NULL,400000,NULL,1,'',NULL,'2020-06-22 13:48:01','2020-06-22 13:47:18',0),(112,11,2,0,1,90,68,86,NULL,300000,NULL,1,'',NULL,'2020-06-22 13:48:01','2020-06-22 13:47:18',0),(113,11,2,0,1,85,68,87,NULL,300000,NULL,1,'',NULL,'2020-06-22 13:48:02','2020-06-22 13:47:18',0),(114,11,2,0,1,91,69,88,NULL,400000,NULL,1,'',NULL,'2020-06-22 13:50:55','2020-06-22 13:48:18',0),(115,11,2,0,1,90,69,88,NULL,300000,NULL,1,'',NULL,'2020-06-22 13:50:55','2020-06-22 13:48:18',0),(116,11,2,0,1,85,69,89,NULL,300000,NULL,1,'',NULL,'2020-06-22 13:50:55','2020-06-22 13:48:18',0),(117,11,4,0,1,91,70,90,NULL,400000,NULL,2,'',NULL,'2020-06-22 23:58:49','2020-06-22 13:50:59',0),(118,11,4,0,1,90,70,90,NULL,300000,NULL,1,'',NULL,'2020-06-22 23:58:49','2020-06-22 13:51:00',0),(119,11,4,0,1,85,70,91,NULL,300000,NULL,1,'',NULL,'2020-06-28 16:42:08','2020-06-22 13:51:00',0),(120,11,4,0,1,87,71,92,NULL,100000,NULL,1,'',NULL,'2020-06-28 16:42:07','2020-06-22 13:57:04',0),(121,8,4,0,1,86,90,115,NULL,400000,4,1,'',NULL,'2020-06-29 08:32:10','2020-06-22 17:43:49',0),(122,8,4,0,1,97,73,94,NULL,400000,5,1,'',NULL,'2020-06-29 08:32:13','2020-06-23 15:46:19',0),(123,8,2,0,1,85,74,95,NULL,300000,NULL,1,'',NULL,'2020-06-23 16:02:35','2020-06-23 15:59:42',0),(124,8,2,0,1,87,74,95,NULL,100000,NULL,1,'',NULL,'2020-06-23 16:02:35','2020-06-23 16:00:40',0),(125,8,1,1,0,101,NULL,NULL,NULL,NULL,NULL,0,'',NULL,'2020-06-28 02:44:01','2020-06-23 16:02:12',0),(126,8,2,0,1,85,75,96,NULL,300000,NULL,1,'',NULL,'2020-06-23 18:00:26','2020-06-23 17:59:57',0),(127,8,2,0,1,87,75,96,NULL,100000,NULL,1,'',NULL,'2020-06-23 18:00:26','2020-06-23 17:59:57',0),(128,8,2,0,1,85,75,96,NULL,300000,NULL,1,'',NULL,'2020-06-23 18:00:26','2020-06-23 17:59:57',0),(129,8,2,0,1,87,75,96,NULL,100000,NULL,1,'',NULL,'2020-06-23 18:00:26','2020-06-23 17:59:58',0),(131,8,2,0,1,87,81,102,NULL,100000,NULL,1,'',NULL,'2020-06-28 08:25:54','2020-06-25 05:38:14',0),(132,8,1,1,0,85,NULL,NULL,NULL,NULL,NULL,0,'',NULL,'2020-06-29 07:34:09','2020-06-25 05:38:14',0),(133,8,4,0,1,87,91,116,NULL,100000,4,1,'',NULL,'2020-06-29 08:34:41','2020-06-25 05:38:14',0),(134,12,1,0,1,90,NULL,NULL,NULL,NULL,NULL,1,'',NULL,NULL,'2020-06-26 01:17:59',0),(135,9,4,0,1,90,76,97,NULL,300000,4,1,'',NULL,'2020-06-26 19:19:59','2020-06-26 19:17:37',0),(136,8,4,0,1,105,77,98,NULL,200000,4,1,'',NULL,'2020-06-28 01:05:49','2020-06-28 01:02:36',0),(137,8,4,0,1,116,77,98,NULL,200000,5,1,'',NULL,'2020-06-28 01:05:50','2020-06-28 01:02:47',0),(138,8,4,0,1,97,78,99,NULL,200000,5,1,'',NULL,'2020-06-28 02:56:29','2020-06-28 01:07:11',0),(139,8,4,0,1,113,79,100,NULL,99000,4,1,'',NULL,'2020-06-28 12:15:10','2020-06-28 06:40:49',0),(140,8,4,0,1,115,80,101,NULL,200000,5,1,'',NULL,'2020-06-28 12:15:11','2020-06-28 07:30:52',0),(141,8,4,0,1,112,82,103,NULL,150000,5,1,'',NULL,'2020-06-28 12:15:18','2020-06-28 08:32:30',0),(142,8,4,0,1,107,82,103,NULL,70000,4,1,'',NULL,'2020-06-28 12:15:14','2020-06-28 08:32:41',0),(143,8,4,0,1,110,83,104,NULL,45000,5,1,'',NULL,'2020-06-28 12:15:22','2020-06-28 11:49:49',0),(144,8,4,0,1,108,84,105,NULL,70000,5,1,'',NULL,'2020-06-28 16:42:14','2020-06-28 16:40:31',0),(145,8,4,0,1,116,84,105,NULL,200000,5,1,'',NULL,'2020-06-28 16:42:17','2020-06-28 16:40:50',0),(146,8,4,0,1,111,85,106,NULL,120000,5,1,'',NULL,'2020-06-28 20:02:32','2020-06-28 20:01:12',0),(147,13,2,0,1,90,86,108,NULL,300000,NULL,1,'',NULL,'2020-06-29 00:21:01','2020-06-29 00:19:23',0),(148,13,4,0,1,105,86,107,NULL,100000,5,1,'',NULL,'2020-06-29 00:24:23','2020-06-29 00:19:34',0),(149,13,4,0,1,110,87,110,NULL,60000,4,1,'',NULL,'2020-06-29 00:24:26','2020-06-29 00:21:21',0),(150,13,4,0,1,87,87,109,NULL,100000,NULL,1,'',NULL,'2020-06-29 07:38:29','2020-06-29 00:21:29',0),(151,8,4,0,1,106,88,111,NULL,70000,4,1,'',NULL,'2020-06-29 06:23:56','2020-06-29 06:21:49',0),(153,8,4,0,1,111,90,114,NULL,100000,5,1,'',NULL,'2020-06-29 08:32:08','2020-06-29 08:23:47',0),(154,8,2,0,1,119,92,117,NULL,250000,NULL,1,'',NULL,'2020-06-29 21:14:00','2020-06-29 21:13:02',0),(155,8,4,0,1,119,93,118,NULL,250000,5,1,'',NULL,'2020-06-30 00:09:06','2020-06-29 21:15:18',0),(156,8,4,0,1,96,94,119,NULL,200000,4,1,'',NULL,'2020-06-30 11:53:22','2020-06-30 11:43:02',0),(157,8,4,0,1,86,94,119,NULL,300000,5,1,'',NULL,'2020-06-30 11:53:25','2020-06-30 11:46:34',0),(158,8,3,0,1,107,96,122,NULL,70000,NULL,1,'',NULL,'2020-07-01 02:08:41','2020-06-30 12:44:13',0),(159,8,4,0,1,110,95,120,NULL,70000,5,1,'',NULL,'2020-07-01 01:30:22','2020-07-01 01:26:50',0),(160,8,3,0,1,123,96,121,NULL,400000,NULL,1,'',NULL,'2020-07-01 02:08:45','2020-07-01 02:02:57',0),(161,8,3,0,1,127,96,121,NULL,400000,NULL,1,'',NULL,'2020-07-01 02:08:45','2020-07-01 02:06:18',0);
/*!40000 ALTER TABLE `transactiondetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions` (
  `idtransaction` int NOT NULL AUTO_INCREMENT,
  `iduser` int NOT NULL,
  `idstatus` int NOT NULL DEFAULT '1',
  `totalprice` int DEFAULT NULL,
  `totaldeliverycost` int DEFAULT NULL,
  `totalworth` int DEFAULT NULL,
  `commerce_promo` int DEFAULT NULL,
  `totalcharge` int DEFAULT NULL,
  `payment_promo` int DEFAULT NULL,
  `totalpayment` int DEFAULT NULL,
  `idpayment` int DEFAULT NULL,
  `paymentproof` varchar(200) DEFAULT NULL,
  `transactioncreateat` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `payat` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateat` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idtransaction`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` VALUES (24,8,3,1500000,30000,1530000,0,1530000,0,1530000,4,'\"/payment/PROOF241592433633430.jpg\"','2020-06-17 12:35:51','2020-06-17 13:35:52','2020-06-20 12:54:06'),(25,8,5,800000,35000,835000,0,835000,0,835000,1,'\"/payment/PROOF251592433767077.png\"','2020-06-18 03:34:19','2020-06-20 15:16:20','2020-06-20 15:16:20'),(26,8,5,400000,15000,415000,0,415000,0,415000,1,NULL,'2020-06-18 03:38:26','2020-06-18 04:38:26','2020-06-18 07:11:30'),(27,8,5,100000,16000,116000,0,116000,0,116000,2,NULL,'2020-06-18 03:49:04','2020-06-18 04:49:05','2020-06-18 07:11:30'),(28,8,5,300000,16000,316000,0,316000,0,316000,1,NULL,'2020-06-18 03:51:50','2020-06-18 04:51:51','2020-06-18 07:11:30'),(29,8,5,200000,15000,215000,0,215000,0,215000,1,NULL,'2020-06-18 03:54:04','2020-06-18 04:54:04','2020-06-18 07:11:30'),(30,8,5,300000,10000,310000,0,310000,0,310000,1,NULL,'2020-06-18 10:08:43','2020-06-18 11:08:44','2020-06-18 18:52:28'),(31,8,5,300000,10000,310000,0,310000,0,310000,1,NULL,'2020-06-18 18:53:36','2020-06-18 19:53:37','2020-06-18 20:06:26'),(32,8,5,300000,15000,315000,0,315000,0,315000,1,NULL,'2020-06-19 00:30:44','2020-06-19 01:30:44','2020-06-19 01:30:44'),(33,8,5,600000,25000,625000,0,625000,0,625000,1,NULL,'2020-06-19 00:55:55','2020-06-19 01:55:56','2020-06-19 01:55:56'),(34,8,5,400000,10000,410000,0,410000,0,410000,1,NULL,'2020-06-19 00:57:48','2020-06-19 01:57:49','2020-06-19 01:57:50'),(35,8,5,300000,10000,310000,0,310000,0,310000,1,NULL,'2020-06-19 01:58:24','2020-06-19 02:58:25','2020-06-19 02:58:58'),(36,8,5,300000,16000,316000,0,316000,0,316000,1,'\"/payment/PROOF361592518237391.jpg\"','2020-06-19 06:10:14','2020-06-20 23:51:29','2020-06-20 23:51:30'),(39,8,5,800000,25000,825000,0,825000,0,825000,1,NULL,'2020-06-19 12:49:17','2020-06-19 13:49:17','2020-06-19 14:01:30'),(40,8,5,2400000,45000,2445000,0,2445000,0,2445000,1,NULL,'2020-06-19 15:26:05','2020-06-19 16:26:05','2020-06-19 16:29:22'),(41,8,5,300000,16000,316000,0,316000,0,316000,1,NULL,'2020-06-19 15:55:19','2020-06-19 16:55:19','2020-06-19 18:30:24'),(42,8,5,300000,9500,309500,0,309500,0,309500,1,NULL,'2020-06-19 15:56:50','2020-06-19 16:56:51','2020-06-19 18:30:24'),(43,8,5,400000,15000,415000,0,415000,0,415000,1,NULL,'2020-06-20 05:42:58','2020-06-20 06:42:59','2020-06-20 06:50:50'),(44,8,5,100000,15000,115000,0,115000,0,115000,1,NULL,'2020-06-20 06:18:45','2020-06-20 07:18:45','2020-06-20 06:56:02'),(45,8,5,300000,10000,310000,0,310000,0,310000,2,NULL,'2020-06-20 06:26:00','2020-06-20 07:26:00','2020-06-20 07:04:05'),(46,8,5,100000,10000,110000,0,110000,0,110000,1,NULL,'2020-06-20 07:18:07','2020-06-20 08:18:08','2020-06-20 07:18:54'),(47,8,5,200000,16000,216000,0,216000,0,216000,1,NULL,'2020-06-20 07:19:37','2020-06-20 08:19:38','2020-06-20 07:20:12'),(48,8,5,400000,10000,410000,0,410000,0,410000,1,NULL,'2020-06-20 10:42:42','2020-06-20 11:42:42','2020-06-20 11:43:10'),(49,8,5,300000,16000,316000,0,316000,0,316000,1,NULL,'2020-06-20 12:58:14','2020-06-20 13:58:15','2020-06-20 13:58:15'),(50,8,3,1000000,24500,1024500,0,1024500,0,1024500,1,'\"/payment/PROOF501592646528661.png\"','2020-06-20 17:28:26','2020-06-20 18:28:26','2020-06-20 17:49:40'),(51,8,5,100000,10000,110000,0,110000,0,110000,1,NULL,'2020-06-20 20:58:04','2020-06-20 21:58:05','2020-06-20 21:59:44'),(52,8,3,3100000,60000,3160000,0,3160000,0,3160000,1,'\"/payment/PROOF521592660932982.png\"','2020-06-20 21:42:55','2020-06-20 22:42:56','2020-06-20 21:52:09'),(53,8,5,100000,10000,110000,0,110000,0,110000,1,NULL,'2020-06-21 00:03:28','2020-06-21 01:03:28','2020-06-21 13:26:35'),(54,8,5,500000,26000,526000,0,526000,0,526000,2,NULL,'2020-06-21 13:26:31','2020-06-21 14:26:32','2020-06-21 13:33:18'),(55,8,5,500000,25000,525000,0,525000,0,525000,1,NULL,'2020-06-21 13:35:57','2020-06-21 14:35:57','2020-06-21 13:37:45'),(56,8,3,500000,20000,520000,0,520000,0,520000,1,'\"/payment/PROOF561592721299702.jpg\"','2020-06-21 13:49:02','2020-06-21 14:49:02','2020-06-21 15:08:13'),(57,8,3,300000,16000,316000,0,316000,0,316000,1,'\"/payment/PROOF571592723038954.jpg\"','2020-06-21 14:21:22','2020-06-21 15:21:22','2020-06-21 16:08:55'),(58,8,3,800000,25000,825000,0,825000,0,825000,2,'\"/payment/PROOF581592723118590.png\"','2020-06-21 14:29:24','2020-06-21 15:29:25','2020-06-22 01:08:11'),(59,8,3,400000,16000,416000,0,416000,0,416000,1,'\"/payment/PROOF591592726912849.png\"','2020-06-21 15:22:42','2020-06-21 16:22:42','2020-06-21 22:22:04'),(60,8,1,400000,10000,410000,0,410000,0,410000,1,NULL,'2020-06-21 18:08:11','2020-06-21 19:08:12','2020-06-21 18:08:11'),(61,8,1,400000,10000,410000,0,410000,0,410000,1,NULL,'2020-06-21 18:08:19','2020-06-21 19:08:20','2020-06-21 18:08:19'),(62,8,1,700000,25000,725000,0,725000,0,725000,1,NULL,'2020-06-21 21:50:58','2020-06-21 22:50:58','2020-06-21 21:50:58'),(63,8,1,700000,25000,725000,0,725000,0,725000,1,NULL,'2020-06-21 21:54:13','2020-06-21 22:54:14','2020-06-21 21:54:13'),(64,8,3,700000,25000,725000,0,725000,0,725000,1,'\"/payment/PROOF641592749223039.png\"','2020-06-21 21:54:57','2020-06-21 22:54:57','2020-06-22 16:44:03'),(65,8,5,400000,16000,416000,0,416000,0,416000,1,NULL,'2020-06-22 01:03:33','2020-06-22 02:03:33','2020-06-22 02:03:34'),(66,11,5,1000000,25000,1025000,0,1025000,0,1025000,1,NULL,'2020-06-22 13:43:40','2020-06-22 14:43:41','2020-06-22 13:45:11'),(67,11,5,1000000,25000,1025000,0,1025000,0,1025000,1,NULL,'2020-06-22 13:45:49','2020-06-22 14:45:50','2020-06-22 13:47:18'),(68,11,5,1000000,26000,1026000,0,1026000,0,1026000,1,NULL,'2020-06-22 13:48:01','2020-06-22 14:48:01','2020-06-22 13:48:18'),(69,11,5,1000000,25000,1025000,0,1025000,0,1025000,1,NULL,'2020-06-22 13:50:54','2020-06-22 14:50:54','2020-06-22 13:50:59'),(70,11,3,1400000,25000,1425000,0,1425000,0,1425000,1,'\"/payment/PROOF701592805184655.jpg\"','2020-06-22 13:52:55','2020-06-22 14:52:55','2020-06-22 18:45:00'),(71,11,3,100000,15000,115000,0,115000,0,115000,1,'\"/payment/PROOF711592805463495.jpg\"','2020-06-22 13:57:18','2020-06-22 14:57:19','2020-06-22 16:44:01'),(72,8,5,400000,15000,415000,0,415000,0,415000,1,NULL,'2020-06-22 16:43:48','2020-06-22 17:43:49','2020-06-22 17:43:50'),(73,8,3,400000,15000,415000,0,415000,0,415000,1,'\"/payment/PROOF731592899372106.jpg\"','2020-06-23 15:46:43','2020-06-23 16:46:43','2020-06-23 16:04:30'),(74,8,5,400000,15000,415000,0,415000,0,415000,1,NULL,'2020-06-23 16:02:34','2020-06-23 17:02:34','2020-06-23 17:59:57'),(75,8,5,800000,38000,838000,0,838000,0,838000,1,NULL,'2020-06-23 18:00:25','2020-06-23 19:00:26','2020-06-25 05:38:16'),(76,9,3,300000,15000,315000,0,315000,0,315000,1,'\"/payment/PROOF761593170276616.jpg\"','2020-06-26 19:17:46','2020-06-26 20:17:47','2020-06-26 19:18:41'),(77,8,3,400000,15000,415000,0,415000,0,415000,1,'\"/payment/PROOF771593277447010.png\"','2020-06-28 01:03:52','2020-06-28 02:03:53','2020-06-28 01:04:19'),(78,8,3,200000,10000,210000,0,210000,0,210000,1,'\"/payment/PROOF781593283880429.png\"','2020-06-28 02:45:44','2020-06-28 03:45:45','2020-06-28 02:51:52'),(79,8,3,99000,10000,109000,0,109000,0,109000,4,NULL,'2020-06-28 06:57:47','2020-06-28 07:57:47','2020-06-28 06:57:47'),(80,8,3,200000,10000,210000,0,210000,0,210000,4,NULL,'2020-06-28 07:59:53','2020-06-28 08:59:54','2020-06-28 07:59:53'),(81,8,5,100000,9500,109500,0,109500,0,109500,1,NULL,'2020-06-28 08:25:53','2020-06-28 09:25:54','2020-06-28 08:27:13'),(82,8,3,220000,20000,240000,0,240000,0,240000,4,NULL,'2020-06-28 08:33:15','2020-06-28 09:33:16','2020-06-28 08:33:15'),(83,8,3,45000,15000,60000,0,60000,0,60000,4,NULL,'2020-06-28 11:50:12','2020-06-28 12:50:12','2020-06-28 11:50:12'),(84,8,3,270000,15000,285000,0,285000,0,285000,4,NULL,'2020-06-28 16:41:19','2020-06-28 17:41:20','2020-06-28 16:41:19'),(85,8,3,120000,10000,130000,0,130000,0,130000,4,NULL,'2020-06-28 20:01:28','2020-06-28 21:01:29','2020-06-28 20:01:28'),(86,13,3,400000,25000,425000,0,425000,0,425000,4,NULL,'2020-06-29 00:21:00','2020-06-29 01:21:01','2020-06-29 00:21:00'),(87,13,3,160000,31000,191000,0,191000,0,191000,1,'\"/payment/PROOF871593361365918.png\"','2020-06-29 00:22:35','2020-06-29 01:22:36','2020-06-29 00:23:05'),(88,8,3,70000,9500,79500,0,79500,0,79500,4,NULL,'2020-06-29 06:22:17','2020-06-29 07:22:18','2020-06-29 06:22:17'),(90,8,3,500000,19500,519500,0,519500,0,519500,4,NULL,'2020-06-29 08:24:13','2020-06-29 09:24:13','2020-06-29 08:24:13'),(91,8,3,100000,9500,109500,0,109500,0,109500,1,'\"/payment/PROOF911593390810282.png\"','2020-06-29 08:33:22','2020-06-29 09:33:22','2020-06-29 08:33:43'),(92,8,5,250000,10000,260000,0,260000,0,260000,1,NULL,'2020-06-29 21:13:59','2020-06-29 22:14:00','2020-06-29 21:15:18'),(93,8,3,250000,10000,260000,0,260000,0,260000,1,'\"/payment/PROOF931593436873981.png\"','2020-06-29 21:17:47','2020-06-29 23:19:37','2020-06-29 21:21:29'),(94,8,3,500000,15000,515000,0,515000,0,515000,4,NULL,'2020-06-30 11:49:49','2020-06-30 12:49:49','2020-06-30 11:49:49'),(95,8,3,70000,9500,79500,0,79500,0,79500,4,NULL,'2020-07-01 01:28:02','2020-07-01 02:28:03','2020-07-01 01:28:02'),(96,8,3,870000,25000,895000,0,895000,0,895000,4,NULL,'2020-07-01 02:06:54','2020-07-01 03:06:55','2020-07-01 02:06:54');
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactionsellers`
--

DROP TABLE IF EXISTS `transactionsellers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactionsellers` (
  `idtransactionseller` int NOT NULL AUTO_INCREMENT,
  `idtransaction` int NOT NULL,
  `idseller` int NOT NULL,
  `iddelivery` int NOT NULL,
  `idpackagestatus` int NOT NULL DEFAULT '1',
  `courier_code` varchar(45) DEFAULT NULL,
  `recipient` varchar(45) DEFAULT NULL,
  `totalqty` int NOT NULL,
  `totalweight` int DEFAULT NULL,
  `seller_delivery_cost` int NOT NULL,
  `seller_items_price` int NOT NULL,
  `total_price` int NOT NULL,
  `package_updateat` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `package_createat` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `seller_cancel_reason` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idtransactionseller`)
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactionsellers`
--

LOCK TABLES `transactionsellers` WRITE;
/*!40000 ALTER TABLE `transactionsellers` DISABLE KEYS */;
INSERT INTO `transactionsellers` VALUES (29,24,1,3,6,'1234567',NULL,2,NULL,15000,700000,715000,'2020-06-20 17:57:47','2020-06-17 12:35:52','Stock is not enough , please reorder'),(30,24,2,3,4,'1242134','bu',3,NULL,15000,800000,815000,'2020-06-28 01:04:52','2020-06-17 12:35:52',NULL),(31,25,2,3,1,NULL,NULL,1,NULL,15000,100000,115000,'2020-06-20 12:38:26','2020-06-18 03:34:19',NULL),(32,25,1,1,1,NULL,NULL,2,NULL,20000,700000,720000,'2020-06-20 12:38:26','2020-06-18 03:34:19',NULL),(33,26,1,3,1,NULL,NULL,1,NULL,15000,400000,415000,'2020-06-20 12:38:26','2020-06-18 03:38:26',NULL),(34,27,2,4,1,NULL,NULL,1,NULL,16000,100000,116000,'2020-06-20 12:38:26','2020-06-18 03:49:04',NULL),(35,28,1,4,1,NULL,NULL,1,NULL,16000,300000,316000,'2020-06-20 12:38:26','2020-06-18 03:51:50',NULL),(36,29,1,3,1,NULL,NULL,1,NULL,15000,200000,215000,'2020-06-20 12:38:26','2020-06-18 03:54:04',NULL),(37,30,3,1,1,NULL,NULL,1,NULL,10000,300000,310000,'2020-06-20 12:38:26','2020-06-18 10:08:43',NULL),(38,31,3,1,1,NULL,NULL,1,NULL,10000,300000,310000,'2020-06-20 12:38:26','2020-06-18 18:53:37',NULL),(39,32,3,3,1,NULL,NULL,1,NULL,15000,300000,315000,'2020-06-20 12:38:26','2020-06-19 00:30:44',NULL),(40,33,2,3,1,NULL,NULL,2,NULL,15000,200000,215000,'2020-06-20 12:38:26','2020-06-19 00:55:56',NULL),(41,33,1,1,1,NULL,NULL,1,NULL,10000,400000,410000,'2020-06-20 12:38:26','2020-06-19 00:55:56',NULL),(42,34,1,1,1,NULL,NULL,1,1000,10000,400000,410000,'2020-06-20 12:38:26','2020-06-19 00:57:48',NULL),(43,35,3,1,1,NULL,NULL,1,1000,10000,300000,310000,'2020-06-20 12:38:26','2020-06-19 01:58:25',NULL),(44,36,3,4,1,NULL,NULL,1,1000,16000,300000,316000,'2020-06-20 12:38:26','2020-06-19 06:10:15',NULL),(45,39,2,1,1,NULL,NULL,1,1000,10000,100000,110000,'2020-06-20 12:38:26','2020-06-19 12:49:17',NULL),(46,39,1,3,1,NULL,NULL,2,2000,15000,700000,715000,'2020-06-20 12:38:26','2020-06-19 12:49:17',NULL),(47,40,3,3,1,NULL,NULL,8,8000,45000,2400000,2445000,'2020-06-20 12:38:26','2020-06-19 15:26:05',NULL),(48,41,3,4,1,NULL,NULL,1,1000,16000,300000,316000,'2020-06-20 12:38:26','2020-06-19 15:55:19',NULL),(49,42,3,2,1,NULL,NULL,1,1000,9500,300000,309500,'2020-06-20 12:38:26','2020-06-19 15:56:51',NULL),(50,43,1,3,1,NULL,NULL,1,1000,15000,400000,415000,'2020-06-20 12:38:26','2020-06-20 05:42:58',NULL),(51,44,2,3,1,NULL,NULL,1,1000,15000,100000,115000,'2020-06-20 12:38:26','2020-06-20 06:18:45',NULL),(52,45,2,1,1,NULL,NULL,1,1000,10000,300000,310000,'2020-06-20 12:38:26','2020-06-20 06:26:00',NULL),(53,46,2,1,1,NULL,NULL,1,1000,10000,100000,110000,'2020-06-20 12:38:26','2020-06-20 07:18:08',NULL),(54,47,2,4,1,NULL,NULL,2,2000,16000,200000,216000,'2020-06-20 12:38:26','2020-06-20 07:19:37',NULL),(55,48,2,1,1,NULL,NULL,1,1000,10000,400000,410000,'2020-06-20 12:38:26','2020-06-20 10:42:42',NULL),(56,49,2,4,1,NULL,NULL,1,1000,16000,300000,316000,'2020-06-20 12:58:15','2020-06-20 12:58:15',NULL),(57,50,1,3,4,'123456','bu resi',2,2000,15000,700000,715000,'2020-06-21 22:16:50','2020-06-20 17:28:26',NULL),(58,50,2,2,4,'2345234','ibu',1,1000,9500,300000,309500,'2020-06-23 16:07:55','2020-06-20 17:28:26',NULL),(59,51,2,1,1,NULL,NULL,1,1000,10000,100000,110000,'2020-06-20 20:58:04','2020-06-20 20:58:04',NULL),(60,52,2,3,4,'3564577','pak',7,7000,45000,2400000,2445000,'2020-06-28 01:04:59','2020-06-20 21:42:55',NULL),(61,52,1,3,4,'1234','oma',2,2000,15000,700000,715000,'2020-06-21 22:13:58','2020-06-20 21:42:56',NULL),(62,53,2,1,1,NULL,NULL,1,1000,10000,100000,110000,'2020-06-21 00:03:28','2020-06-21 00:03:28',NULL),(63,54,2,1,1,NULL,NULL,1,1000,10000,100000,110000,'2020-06-21 13:26:31','2020-06-21 13:26:31',NULL),(64,54,1,4,1,NULL,NULL,1,1000,16000,400000,416000,'2020-06-21 13:26:32','2020-06-21 13:26:32',NULL),(65,55,2,1,1,NULL,NULL,1,1000,10000,100000,110000,'2020-06-21 13:35:57','2020-06-21 13:35:57',NULL),(66,55,1,3,1,NULL,NULL,1,1000,15000,400000,415000,'2020-06-21 13:35:57','2020-06-21 13:35:57',NULL),(67,56,2,1,4,'2344323','adik',1,1000,10000,100000,110000,'2020-06-28 01:05:06','2020-06-21 13:49:02',NULL),(68,56,1,1,4,'847583','adik',1,1000,10000,400000,410000,'2020-06-22 16:57:55','2020-06-21 13:49:02',NULL),(69,57,1,4,4,'333','om',1,1000,16000,300000,316000,'2020-06-22 16:57:46','2020-06-21 14:21:22',NULL),(70,58,2,3,4,'234234','pak',2,2000,15000,400000,415000,'2020-06-28 01:05:14','2020-06-21 14:29:24',NULL),(71,58,1,1,4,'1344','kakak',1,1000,10000,400000,410000,'2020-06-22 18:20:06','2020-06-21 14:29:25',NULL),(72,59,1,4,4,'2345','bang',1,1000,16000,400000,416000,'2020-06-22 16:44:34','2020-06-21 15:22:42',NULL),(73,60,2,1,1,NULL,NULL,1,1000,10000,400000,410000,'2020-06-21 18:08:11','2020-06-21 18:08:11',NULL),(74,61,2,1,1,NULL,NULL,1,1000,10000,400000,410000,'2020-06-21 18:08:19','2020-06-21 18:08:19',NULL),(75,62,3,3,1,NULL,NULL,1,1000,15000,300000,315000,'2020-06-21 21:50:58','2020-06-21 21:50:58',NULL),(76,62,1,1,1,NULL,NULL,1,1000,10000,400000,410000,'2020-06-21 21:50:58','2020-06-21 21:50:58',NULL),(77,63,3,3,1,NULL,NULL,1,1000,15000,300000,315000,'2020-06-21 21:54:13','2020-06-21 21:54:13',NULL),(78,63,1,1,1,NULL,NULL,1,1000,10000,400000,410000,'2020-06-21 21:54:14','2020-06-21 21:54:14',NULL),(79,64,3,3,2,NULL,NULL,1,1000,15000,300000,315000,'2020-06-22 16:44:03','2020-06-21 21:54:57',NULL),(80,64,1,1,4,'45677','abang',1,1000,10000,400000,410000,'2020-06-22 18:19:59','2020-06-21 21:54:57',NULL),(81,65,2,4,1,NULL,NULL,1,1000,16000,400000,416000,'2020-06-22 01:03:33','2020-06-22 01:03:33',NULL),(82,66,1,3,1,NULL,NULL,2,2000,15000,700000,715000,'2020-06-22 13:43:41','2020-06-22 13:43:41',NULL),(83,66,2,1,1,NULL,NULL,1,1000,10000,300000,310000,'2020-06-22 13:43:41','2020-06-22 13:43:41',NULL),(84,67,1,3,1,NULL,NULL,2,2000,15000,700000,715000,'2020-06-22 13:45:49','2020-06-22 13:45:49',NULL),(85,67,2,1,1,NULL,NULL,1,1000,10000,300000,310000,'2020-06-22 13:45:50','2020-06-22 13:45:50',NULL),(86,68,1,4,1,NULL,NULL,2,2000,16000,700000,716000,'2020-06-22 13:48:01','2020-06-22 13:48:01',NULL),(87,68,2,1,1,NULL,NULL,1,1000,10000,300000,310000,'2020-06-22 13:48:01','2020-06-22 13:48:01',NULL),(88,69,1,3,1,NULL,NULL,2,2000,15000,700000,715000,'2020-06-22 13:50:54','2020-06-22 13:50:54',NULL),(89,69,2,1,1,NULL,NULL,1,1000,10000,300000,310000,'2020-06-22 13:50:54','2020-06-22 13:50:54',NULL),(90,70,1,3,4,'12344','cucu',3,3000,15000,1100000,1115000,'2020-06-22 18:45:29','2020-06-22 13:52:55',NULL),(91,70,2,1,4,'1234134','ibu',1,1000,10000,300000,310000,'2020-06-28 01:05:19','2020-06-22 13:52:55',NULL),(92,71,2,3,4,'234234','abang',1,1000,15000,100000,115000,'2020-06-28 01:05:25','2020-06-22 13:57:19',NULL),(93,72,2,3,1,NULL,NULL,1,1000,15000,400000,415000,'2020-06-22 16:43:48','2020-06-22 16:43:48',NULL),(94,73,2,3,4,'34653465','pak',1,1000,15000,400000,415000,'2020-06-23 16:07:48','2020-06-23 15:46:43',NULL),(95,74,2,3,1,NULL,NULL,2,2000,15000,400000,415000,'2020-06-23 16:02:34','2020-06-23 16:02:34',NULL),(96,75,2,2,1,NULL,NULL,4,4000,38000,800000,838000,'2020-06-23 18:00:25','2020-06-23 18:00:25',NULL),(97,76,1,3,4,'123123','marcello',1,1000,15000,300000,315000,'2020-06-26 19:19:14','2020-06-26 19:17:46',NULL),(98,77,4,3,4,'245245','bu',2,2000,15000,400000,415000,'2020-06-28 01:05:30','2020-06-28 01:03:53',NULL),(99,78,2,1,4,'14134','ibu',1,1000,10000,200000,210000,'2020-06-28 02:52:31','2020-06-28 02:45:44',NULL),(100,79,4,1,4,'425245','mas',1,1000,10000,99000,109000,'2020-06-28 12:14:41','2020-06-28 06:57:47',NULL),(101,80,4,1,4,'74674567','pak',1,1000,10000,200000,210000,'2020-06-28 12:14:47','2020-06-28 07:59:54',NULL),(102,81,2,2,1,NULL,NULL,1,1000,9500,100000,109500,'2020-06-28 08:25:53','2020-06-28 08:25:53',NULL),(103,82,4,1,4,'1344','om',2,2000,20000,220000,240000,'2020-06-28 12:14:52','2020-06-28 08:33:15',NULL),(104,83,4,3,4,'356732','mba',1,1000,15000,45000,60000,'2020-06-28 12:14:58','2020-06-28 11:50:12',NULL),(105,84,4,3,4,'121234','om',2,2000,15000,270000,285000,'2020-06-28 16:41:59','2020-06-28 16:41:20',NULL),(106,85,4,1,4,'234134','pak',1,1000,10000,120000,130000,'2020-06-28 20:02:24','2020-06-28 20:01:28',NULL),(107,86,4,3,4,'23451324','mba',1,1000,15000,100000,115000,'2020-06-29 00:23:51','2020-06-29 00:21:00',NULL),(108,86,1,1,2,NULL,NULL,1,1000,10000,300000,310000,'2020-06-29 00:21:00','2020-06-29 00:21:00',NULL),(109,87,2,3,4,'11234324','pak',1,1000,15000,100000,115000,'2020-06-29 00:25:01','2020-06-29 00:22:36',NULL),(110,87,4,4,4,'235145','828238',1,1000,16000,60000,76000,'2020-06-29 00:23:55','2020-06-29 00:22:36',NULL),(111,88,4,2,4,'42342344','bu',1,1000,9500,70000,79500,'2020-06-29 06:23:12','2020-06-29 06:22:17',NULL),(114,90,4,1,4,'1434324','mba',1,1000,10000,100000,110000,'2020-06-29 08:28:54','2020-06-29 08:24:13',NULL),(115,90,2,2,4,'1231234','adik',1,1000,9500,400000,409500,'2020-06-29 08:28:49','2020-06-29 08:24:13',NULL),(116,91,2,2,4,'452544545','bu',1,1000,9500,100000,109500,'2020-06-29 08:34:29','2020-06-29 08:33:22',NULL),(117,92,5,1,1,NULL,NULL,1,1000,10000,250000,260000,'2020-06-29 21:14:00','2020-06-29 21:14:00',NULL),(118,93,5,1,4,'522345245','pak',1,1000,10000,250000,260000,'2020-06-30 00:04:24','2020-06-29 21:17:47',NULL),(119,94,2,3,4,'674865646','pak',2,2000,15000,500000,515000,'2020-06-30 11:53:07','2020-06-30 11:49:49',NULL),(120,95,4,2,4,'84898487','mas',1,1000,9500,70000,79500,'2020-07-01 01:29:02','2020-07-01 01:28:02',NULL),(121,96,5,3,4,'2983485235284','om',2,2000,15000,800000,815000,'2020-07-01 02:08:45','2020-07-01 02:06:55',NULL),(122,96,4,1,4,'83273472655','om',1,1000,10000,70000,80000,'2020-07-01 02:08:41','2020-07-01 02:06:55',NULL);
/*!40000 ALTER TABLE `transactionsellers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `iduser` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(200) DEFAULT 'this username does not have password',
  `role` varchar(45) NOT NULL DEFAULT 'user',
  `address` varchar(200) DEFAULT NULL,
  `isverified` tinyint NOT NULL DEFAULT '0',
  `isseller` tinyint DEFAULT '0',
  `lastlogin` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createat` datetime DEFAULT CURRENT_TIMESTAMP,
  `isadmin` tinyint DEFAULT '0',
  `isuser` tinyint DEFAULT '1',
  `popcoin` int DEFAULT '0',
  PRIMARY KEY (`iduser`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (8,'indo','mde50526@gmail.com','e0479b0c57556f9cf719c5a3f4b187921ec6998f6e2981399ab8f8e02791e084','user','building A',1,0,'2020-07-01 02:08:11','2020-06-13 17:05:45',1,1,77500),(9,'ronaldo','mde50526@gmail.com','e0479b0c57556f9cf719c5a3f4b187921ec6998f6e2981399ab8f8e02791e084','user','building R',1,1,'2020-06-26 19:19:23','2020-06-13 17:05:45',0,1,0),(10,'kate','mde50526@gmail.com','e0479b0c57556f9cf719c5a3f4b187921ec6998f6e2981399ab8f8e02791e084','user','building K',1,1,'2020-06-30 11:50:39','2020-06-13 17:05:45',0,1,0),(11,'dwayne','mde50526@gmail.com','e0479b0c57556f9cf719c5a3f4b187921ec6998f6e2981399ab8f8e02791e084','user','Building D',1,0,'2020-06-22 13:29:04','2020-06-22 13:28:59',0,1,0),(12,'tadashi','mde50526@gmail.com','e0479b0c57556f9cf719c5a3f4b187921ec6998f6e2981399ab8f8e02791e084','user','Japan',1,1,'2020-07-01 02:07:33','2020-06-26 01:17:12',0,1,3000000),(13,'cristiano','mde50526@gmail.com','e0479b0c57556f9cf719c5a3f4b187921ec6998f6e2981399ab8f8e02791e084','user','Italia',1,0,'2020-06-30 12:06:31','2020-06-28 23:17:31',0,1,575000),(14,'jokowi','mde50526@gmail.com','e0479b0c57556f9cf719c5a3f4b187921ec6998f6e2981399ab8f8e02791e084','user','Istana Merdeka',1,1,'2020-07-01 02:07:15','2020-06-29 20:10:55',0,1,0),(15,'budi','mde50526@gmail.com','e0479b0c57556f9cf719c5a3f4b187921ec6998f6e2981399ab8f8e02791e084','user','Jakarta',0,0,'2020-06-29 20:18:29','2020-06-29 20:18:25',0,1,0),(16,'andi','mde50526@gmail.com','e0479b0c57556f9cf719c5a3f4b187921ec6998f6e2981399ab8f8e02791e084','user','Jakarta',0,0,'2020-06-29 20:20:48','2020-06-29 20:20:44',0,1,0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlist`
--

DROP TABLE IF EXISTS `wishlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wishlist` (
  `idwishlist` int NOT NULL AUTO_INCREMENT,
  `iduser` int NOT NULL,
  `idproduct` int NOT NULL,
  `createat` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idwishlist`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlist`
--

LOCK TABLES `wishlist` WRITE;
/*!40000 ALTER TABLE `wishlist` DISABLE KEYS */;
INSERT INTO `wishlist` VALUES (6,8,77,'2020-06-28 20:01:08'),(8,13,76,'2020-06-29 00:18:04'),(9,13,75,'2020-06-29 00:19:36');
/*!40000 ALTER TABLE `wishlist` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-07-01  2:23:48
