-- MariaDB dump 10.17  Distrib 10.4.14-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: cinema
-- ------------------------------------------------------
-- Server version	10.4.14-MariaDB

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
-- Table structure for table `assistea`
--

DROP TABLE IF EXISTS `assistea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assistea` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codiceConferma` varchar(10) NOT NULL,
  `quanti` int(11) NOT NULL DEFAULT 1,
  `verificato` tinyint(1) NOT NULL DEFAULT 0,
  `idProiezione` int(11) NOT NULL,
  `idSpettatore` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idProiezione` (`idProiezione`),
  KEY `idSpettatore` (`idSpettatore`),
  CONSTRAINT `assistea_ibfk_1` FOREIGN KEY (`idProiezione`) REFERENCES `proiezione` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `assistea_ibfk_2` FOREIGN KEY (`idSpettatore`) REFERENCES `spettatore` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assistea`
--

LOCK TABLES `assistea` WRITE;
/*!40000 ALTER TABLE `assistea` DISABLE KEYS */;
INSERT INTO `assistea` VALUES (29,'537094',2,1,14,23),(30,'123507',1,1,14,24),(31,'740638',3,1,18,25),(32,'079863',2,1,18,26),(33,'590724',4,1,18,27),(34,'067492',2,1,18,28),(35,'875310',2,1,20,28),(36,'438092',3,0,20,29),(37,'164589',3,1,20,30),(38,'847069',2,1,20,31),(39,'903184',2,0,18,32),(40,'342968',2,0,18,32);
/*!40000 ALTER TABLE `assistea` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `film`
--

DROP TABLE IF EXISTS `film`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `film` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titolo` varchar(60) NOT NULL,
  `durata` int(11) NOT NULL,
  `regista` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `film`
--

LOCK TABLES `film` WRITE;
/*!40000 ALTER TABLE `film` DISABLE KEYS */;
INSERT INTO `film` VALUES (1,'Le croncache di Narnia',150,'Andrew Adamson'),(2,'Harry Potter',160,'Chris Columbus'),(4,'La carica dei 101',79,'Wolfgang Reitherman'),(8,'Percy Jackson',107,'Thor Freudenthal');
/*!40000 ALTER TABLE `film` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proiezione`
--

DROP TABLE IF EXISTS `proiezione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proiezione` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dataOra` datetime NOT NULL,
  `idFilm` int(11) NOT NULL,
  `idSala` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idFilm` (`idFilm`),
  KEY `idSala` (`idSala`),
  CONSTRAINT `proiezione_ibfk_1` FOREIGN KEY (`idFilm`) REFERENCES `film` (`id`),
  CONSTRAINT `proiezione_ibfk_2` FOREIGN KEY (`idSala`) REFERENCES `sala` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proiezione`
--

LOCK TABLES `proiezione` WRITE;
/*!40000 ALTER TABLE `proiezione` DISABLE KEYS */;
INSERT INTO `proiezione` VALUES (14,'2021-06-17 16:00:00',1,1),(15,'2021-06-17 19:00:00',1,1),(16,'2021-06-18 20:00:00',2,2),(17,'2021-06-19 13:00:00',2,2),(18,'2021-06-13 14:00:00',4,3),(19,'2021-06-15 14:00:00',4,3),(20,'2021-06-15 17:00:00',8,1);
/*!40000 ALTER TABLE `proiezione` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sala`
--

DROP TABLE IF EXISTS `sala`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sala` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `postiDisponibili` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sala`
--

LOCK TABLES `sala` WRITE;
/*!40000 ALTER TABLE `sala` DISABLE KEYS */;
INSERT INTO `sala` VALUES (1,200),(2,350),(3,250);
/*!40000 ALTER TABLE `sala` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spettatore`
--

DROP TABLE IF EXISTS `spettatore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spettatore` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numeroDiTelefono` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spettatore`
--

LOCK TABLES `spettatore` WRITE;
/*!40000 ALTER TABLE `spettatore` DISABLE KEYS */;
INSERT INTO `spettatore` VALUES (23,'3694749638'),(24,'3953884610'),(25,'321888045'),(26,'3916790613'),(27,'3119588313'),(28,'329498876'),(29,'3189898441'),(30,'3975593188'),(31,'3112659905'),(32,'337754137');
/*!40000 ALTER TABLE `spettatore` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-13 11:01:04
