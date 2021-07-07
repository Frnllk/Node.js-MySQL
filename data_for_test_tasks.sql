CREATE DATABASE  IF NOT EXISTS `data_for_test` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `data_for_test`;
-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: data_for_test
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
-- Table structure for table `tasks`
--

DROP TABLE IF EXISTS `tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tasks` (
  `task_id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  `time` int NOT NULL,
  `date_start` datetime NOT NULL,
  `date_finish` datetime NOT NULL,
  PRIMARY KEY (`task_id`)
) ENGINE=InnoDB AUTO_INCREMENT=180 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks`
--

LOCK TABLES `tasks` WRITE;
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;
INSERT INTO `tasks` VALUES (160,'Полученные данные 1',1,'2001-01-23 10:37:22','2002-02-23 10:37:25'),(161,'Полученные данные 2',2,'2002-01-23 10:37:22','2003-01-23 10:37:22'),(162,'Полученные данные 3',3,'2003-01-23 10:37:22','2004-01-23 10:37:22'),(163,'Полученные данные 4',4,'2004-01-23 10:37:22','2005-01-23 10:37:22'),(164,'Полученные данные 5',5,'2005-01-23 10:37:22','2006-01-23 10:37:22'),(165,'Полученные данные 6',6,'2006-01-23 10:37:22','2007-01-23 10:37:22'),(166,'Полученные данные 7',7,'2006-01-23 10:37:22','2008-01-23 10:37:22'),(167,'Полученные данные 8',8,'2008-01-23 10:37:22','2009-01-23 10:37:22'),(168,'Полученные данные 9',9,'2009-01-23 10:37:22','2010-01-23 10:37:22'),(169,'Полученные данные 10',10,'2010-01-23 10:37:22','2011-01-23 10:37:22'),(170,'Полученные данные 11',11,'2011-01-23 10:37:22','2012-01-23 10:37:22'),(171,'Полученные данные 12',12,'2012-01-23 10:37:22','2013-01-23 10:37:22'),(172,'Полученные данные 13',13,'2013-01-23 10:37:22','2014-01-23 10:37:22'),(173,'Полученные данные 14',14,'2014-01-23 10:37:22','2015-01-23 10:37:22'),(174,'Полученные данные 15',15,'2015-01-23 10:37:22','2016-01-23 10:37:22'),(175,'Полученные данные 16',16,'2016-01-23 10:37:22','2017-01-23 10:37:22'),(176,'Полученные данные 17',17,'2017-01-23 10:37:22','2018-01-23 10:37:22'),(177,'Полученные данные 18',18,'2018-01-23 10:37:22','2019-01-23 10:37:22'),(178,'Полученные данные 19',19,'2019-01-23 10:37:22','2020-01-23 10:37:25'),(179,'Полученные данные 20',20,'2020-01-23 10:37:22','2020-01-23 10:37:22');
/*!40000 ALTER TABLE `tasks` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-07 18:54:41
