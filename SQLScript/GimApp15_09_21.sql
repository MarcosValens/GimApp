-- MySQL dump 10.13  Distrib 5.7.31, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: gimApp
-- ------------------------------------------------------
-- Server version	5.7.31-0ubuntu0.18.04.1

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
-- Table structure for table `Repetition`
--

DROP TABLE IF EXISTS `Repetition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Repetition` (
  `id` bigint(20) NOT NULL,
  `weight` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Repetition`
--

LOCK TABLES `Repetition` WRITE;
/*!40000 ALTER TABLE `Repetition` DISABLE KEYS */;
/*!40000 ALTER TABLE `Repetition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Serie`
--

DROP TABLE IF EXISTS `Serie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Serie` (
  `id` bigint(20) NOT NULL,
  `repetitionID` bigint(20) DEFAULT NULL,
  `exercise_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Serie_Repetition_id_fk` (`repetitionID`),
  KEY `Serie_exercise_id_fk` (`exercise_ID`),
  CONSTRAINT `Serie_Repetition_id_fk` FOREIGN KEY (`repetitionID`) REFERENCES `Repetition` (`id`),
  CONSTRAINT `Serie_exercise_id_fk` FOREIGN KEY (`exercise_ID`) REFERENCES `exercise` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Serie`
--

LOCK TABLES `Serie` WRITE;
/*!40000 ALTER TABLE `Serie` DISABLE KEYS */;
/*!40000 ALTER TABLE `Serie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Teacher`
--

DROP TABLE IF EXISTS `Teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Teacher` (
  `contract_ID` varchar(255) NOT NULL,
  `salary` int(11) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Teacher_ContractID_uindex` (`contract_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Teacher`
--

LOCK TABLES `Teacher` WRITE;
/*!40000 ALTER TABLE `Teacher` DISABLE KEYS */;
/*!40000 ALTER TABLE `Teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Training`
--

DROP TABLE IF EXISTS `Training`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Training` (
  `date` datetime DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `duration` varchar(255) DEFAULT NULL,
  `user_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Training_User_dni_fk` (`user_ID`),
  CONSTRAINT `Training_User_dni_fk` FOREIGN KEY (`user_ID`) REFERENCES `User` (`dni`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Training`
--

LOCK TABLES `Training` WRITE;
/*!40000 ALTER TABLE `Training` DISABLE KEYS */;
/*!40000 ALTER TABLE `Training` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User` (
  `sign_date` datetime NOT NULL,
  `user_name` varchar(15) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `second_name1` varchar(30) DEFAULT NULL,
  `second_name2` varchar(30) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `weight` float DEFAULT NULL,
  `height` float DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `teacherID` bigint(20) NOT NULL,
  `dni` varchar(10) NOT NULL,
  `premium` tinyint(1) DEFAULT '0',
  `phone` varchar(9) DEFAULT NULL,
  PRIMARY KEY (`dni`),
  UNIQUE KEY `User_UserName_uindex` (`user_name`),
  UNIQUE KEY `UserID_DNI_uindex` (`dni`),
  KEY `UserID_Teacher_id_fk` (`teacherID`),
  CONSTRAINT `UserID_Teacher_id_fk` FOREIGN KEY (`teacherID`) REFERENCES `Teacher` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exercise`
--

DROP TABLE IF EXISTS `exercise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exercise` (
  `id` bigint(20) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `video` varchar(255) DEFAULT NULL,
  `training_ID` bigint(20) DEFAULT NULL,
  `muscle` varchar(30) DEFAULT NULL,
  `body_part` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `exercise_Training_id_fk` (`training_ID`),
  CONSTRAINT `exercise_Training_id_fk` FOREIGN KEY (`training_ID`) REFERENCES `Training` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exercise`
--

LOCK TABLES `exercise` WRITE;
/*!40000 ALTER TABLE `exercise` DISABLE KEYS */;
/*!40000 ALTER TABLE `exercise` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-15 21:12:41
