-- MySQL dump 10.15  Distrib 10.0.31-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: Speach
-- ------------------------------------------------------
-- Server version	10.0.31-MariaDB-0ubuntu0.16.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Participants`
--

DROP TABLE IF EXISTS `Participants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Participants` (
  `participant_id` int(11) NOT NULL AUTO_INCREMENT,
  `participant_name` varchar(255) NOT NULL,
  PRIMARY KEY (`participant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Participants`
--

LOCK TABLES `Participants` WRITE;
/*!40000 ALTER TABLE `Participants` DISABLE KEYS */;
INSERT INTO `Participants` VALUES (1,'Person 1'),(2,'Person 2'),(3,'Person 3'),(4,'Person 4'),(5,'Person 5');
/*!40000 ALTER TABLE `Participants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ScoreSheets`
--

DROP TABLE IF EXISTS `ScoreSheets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ScoreSheets` (
  `scoresheet_id` int(11) NOT NULL AUTO_INCREMENT,
  `scoresheet_key` varchar(10) NOT NULL,
  `task_id` int(11) NOT NULL,
  `original_transcription` longtext,
  `scored_transcription` longtext,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`scoresheet_id`),
  KEY `task_id` (`task_id`),
  CONSTRAINT `ScoreSheets_ibfk_1` FOREIGN KEY (`task_id`) REFERENCES `Tasks` (`task_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ScoreSheets`
--

LOCK TABLES `ScoreSheets` WRITE;
/*!40000 ALTER TABLE `ScoreSheets` DISABLE KEYS */;
INSERT INTO `ScoreSheets` VALUES (1,'A',3,'THIS IS A TEST','THIS IS A TEST','2017-11-06 02:38:49','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `ScoreSheets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TaskTypes`
--

DROP TABLE IF EXISTS `TaskTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TaskTypes` (
  `task_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `task_type_name` varchar(255) NOT NULL,
  PRIMARY KEY (`task_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TaskTypes`
--

LOCK TABLES `TaskTypes` WRITE;
/*!40000 ALTER TABLE `TaskTypes` DISABLE KEYS */;
INSERT INTO `TaskTypes` VALUES (1,'Monologue'),(2,'Monologue IRR'),(3,'Phone'),(4,'Phone IRR'),(5,'Reading'),(6,'Reading IRR');
/*!40000 ALTER TABLE `TaskTypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tasks`
--

DROP TABLE IF EXISTS `Tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tasks` (
  `task_id` int(11) NOT NULL AUTO_INCREMENT,
  `participant_id` int(11) NOT NULL,
  `task_type_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`task_id`),
  KEY `participant_id` (`participant_id`),
  KEY `task_type_id` (`task_type_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `Tasks_ibfk_1` FOREIGN KEY (`participant_id`) REFERENCES `Participants` (`participant_id`),
  CONSTRAINT `Tasks_ibfk_2` FOREIGN KEY (`task_type_id`) REFERENCES `TaskTypes` (`task_type_id`),
  CONSTRAINT `Tasks_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `Users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tasks`
--

LOCK TABLES `Tasks` WRITE;
/*!40000 ALTER TABLE `Tasks` DISABLE KEYS */;
INSERT INTO `Tasks` VALUES (3,1,1,NULL),(4,1,3,1);
/*!40000 ALTER TABLE `Tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Users`
--

DROP TABLE IF EXISTS `Users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) NOT NULL,
  `user_role` varchar(255) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Users`
--

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
INSERT INTO `Users` VALUES (1,'Phil','2');
/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testSpeach`
--

DROP TABLE IF EXISTS `testSpeach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testSpeach` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Monologue` longtext NOT NULL,
  `CreatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testSpeach`
--

LOCK TABLES `testSpeach` WRITE;
/*!40000 ALTER TABLE `testSpeach` DISABLE KEYS */;
INSERT INTO `testSpeach` VALUES (1,'TEST','2017-11-04 05:10:11'),(2,'TEST','2017-11-04 05:11:13'),(3,'\'TEST\'','0000-00-00 00:00:00'),(4,'\'TEST\'','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `testSpeach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'Speach'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-07 23:37:28
