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

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
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
