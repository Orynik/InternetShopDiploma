-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: Shop
-- ------------------------------------------------------
-- Server version	8.0.25

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
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carts` (
  `Cart_id` int NOT NULL AUTO_INCREMENT,
  `UserName` varchar(100) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Serial` varchar(45) NOT NULL,
  `Manufacturer` varchar(45) NOT NULL,
  `Price` decimal(12,2) NOT NULL,
  `AmountItems` varchar(3) NOT NULL,
  `TimeStamp` varchar(15) NOT NULL,
  PRIMARY KEY (`Cart_id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carts`
--

LOCK TABLES `carts` WRITE;
/*!40000 ALTER TABLE `carts` DISABLE KEYS */;
INSERT INTO `carts` VALUES (60,'Orynik','BAO7-450','BAO','Электромаш',45000.00,'1','1624162850176'),(62,'Orynik','BAO4-450LA-2','BAO','Электромаш',40000.00,'1','1624162957240');
/*!40000 ALTER TABLE `carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manufacturers`
--

DROP TABLE IF EXISTS `manufacturers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manufacturers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Company` varchar(70) NOT NULL,
  `Tel` varchar(18) DEFAULT NULL,
  `Email` varchar(80) DEFAULT NULL,
  `ZipCode` varchar(10) DEFAULT NULL,
  `Country` varchar(50) DEFAULT NULL,
  `City` varchar(70) DEFAULT NULL,
  `Street` varchar(100) DEFAULT NULL,
  `Building` varchar(70) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Manufacturer_Company` (`Company`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manufacturers`
--

LOCK TABLES `manufacturers` WRITE;
/*!40000 ALTER TABLE `manufacturers` DISABLE KEYS */;
INSERT INTO `manufacturers` VALUES (4,'Русэлпром','88003013532','mail@ruselprom.ru','119415','Россия','Москва','Москва','37'),(8,'Элма','89810003004','pawelog448@d4wan.com','663243','Россия','Ржев','Ржев','1'),(9,'Электромаш','88005553535','elektromash@gmail.com','3123123','Молдова','Тирасполь','Молдавская','32');
/*!40000 ALTER TABLE `manufacturers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `motors`
--

DROP TABLE IF EXISTS `motors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `motors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(70) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Serial` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Power` int NOT NULL,
  `RotationSpeed` int NOT NULL,
  `Perfomance` double(10,1) NOT NULL,
  `PowerFactor` double(10,2) NOT NULL,
  `MultiplicityMaximum` int NOT NULL,
  `Sliding` int NOT NULL,
  `OperatingVoltage` int NOT NULL,
  PRIMARY KEY (`id`,`Name`,`Serial`),
  KEY `products_ibfk_1` (`Name`,`Serial`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `motors`
--

LOCK TABLES `motors` WRITE;
/*!40000 ALTER TABLE `motors` DISABLE KEYS */;
INSERT INTO `motors` VALUES (5,'MTF-111-6','MTF',4,900,75.5,0.50,0,0,176),(6,'MTF-112-6','MTF',4,30,74.5,0.99,1,0,220),(7,'MTKF-111-6','MTКF',4,900,75.2,2.00,2,2,220),(8,'MTKF-112-6','MTКF',5,925,76.0,2.00,2,1,220),(9,'BAO7-450','BAO',200,3000,93.5,0.90,3,2,220),(10,'BAO4-450LA-2','BAO',200,3600,94.5,0.89,1,3,220);
/*!40000 ALTER TABLE `motors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(70) NOT NULL,
  `Serial` varchar(50) NOT NULL,
  `LintToImage` text NOT NULL,
  `Manufacturer` varchar(120) NOT NULL,
  `Description` text NOT NULL,
  `Price` decimal(7,2) NOT NULL,
  PRIMARY KEY (`id`,`Name`,`Serial`),
  KEY `Manufacturers_FK_idx` (`Manufacturer`) /*!80000 INVISIBLE */,
  KEY `Name` (`Name`,`Serial`) /*!80000 INVISIBLE */,
  CONSTRAINT `Manufacturers_FK` FOREIGN KEY (`Manufacturer`) REFERENCES `manufacturers` (`Company`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`Name`, `Serial`) REFERENCES `motors` (`Name`, `Serial`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (21,'MTF-111-6','MTF','http://localhost:4444/img/MTF-111-6_MTF.jpg','Элма','',30000.00),(22,'MTF-112-6','MTF','http://localhost:4444/img/MTF-112-6_MTF.jpg','Элма','',25000.00),(24,'MTKF-111-6','MTКF','http://localhost:4444/img/MTKF-111-6_MTКF.jpg','Элма','',23000.00),(25,'BAO7-450','BAO','http://localhost:4444/img/BAO7-450_BAO.jpg','Электромаш','',45000.00),(26,'BAO4-450LA-2','BAO','http://localhost:4444/img/BAO4-450LA-2_BAO.jpg','Электромаш','',40000.00),(27,'MTKF-112-6','MTКF','http://localhost:4444/img/MTKF-112-6_MTКF.jpg','Электромаш','',32000.00);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `serials`
--

DROP TABLE IF EXISTS `serials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `serials` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Serial` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Serial` (`Serial`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `serials`
--

LOCK TABLES `serials` WRITE;
/*!40000 ALTER TABLE `serials` DISABLE KEYS */;
INSERT INTO `serials` VALUES (3,'BAO'),(1,'MTF'),(2,'MTКF');
/*!40000 ALTER TABLE `serials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int unsigned NOT NULL,
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('aef1dc1c-bedc-498b-8b9d-407d83a20575',1624249500,'{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2021-06-21T04:09:09.281Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":true},\"User\":\"Orynik\"}'),('dcd5be6f-7594-4739-9a56-bd539d44837d',1624254915,'{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2021-06-21T05:54:56.577Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":true},\"User\":\"Orynik\"}');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Login` varchar(45) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `FirstName` varchar(100) NOT NULL,
  `Tel` varchar(50) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `Permission` varchar(45) NOT NULL,
  `Address` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Login_UNIQUE` (`Login`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'wqfqwfqf','wqfqwfqf','qwfqwfqwf','5235235235','fqwfqwfqwfq','User',NULL),(4,'fwqf','wqfqwfqf','qwfqwfqwf','5235235235','fqwfqwfqwfq','User',NULL),(6,'fwefw','wqfqwfqf','qwfqwfqwf','5235235235','fqwfqwfqwfq','User',NULL),(7,'Orynik','Krov','Dmit','6435423452','Q1qqqqqqq','Admin',NULL),(8,'Quimer','Krovel','Dmitry','5252352623623','3Kb788EuYnGr2ig','User',NULL),(9,'fefqfqw','fqwfqw','fqwfqw','5252352623623','3Kb788EuYnGr2ig','User',NULL),(10,'qrfqwfq','упцупц','пцупц','5252352623623','3Kb788EuYnGr2ig','User',NULL),(20,'','','','5252352623623','3Kb788EuYnGr2ig','User',NULL),(52,'qweeqwe','','','5252352623623','3Kb788EuYnGr2ig','User',NULL),(56,'fqwfqwfqfqwf','fqwfqwfqf','fqwfqwfqf','5252352623623','3Kb788EuYnGr2ig','User',NULL);
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

-- Dump completed on 2021-06-21 10:49:03
