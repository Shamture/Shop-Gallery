CREATE DATABASE  IF NOT EXISTS `Boutique` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `Boutique`;
-- MySQL dump 10.14  Distrib 5.5.56-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: Boutique
-- ------------------------------------------------------
-- Server version	5.5.56-MariaDB-1~trusty

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
-- Table structure for table `Categorie`
--

DROP TABLE IF EXISTS `Categorie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Categorie` (
  `idCategorie` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) NOT NULL,
  PRIMARY KEY (`idCategorie`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Categorie`
--

LOCK TABLES `Categorie` WRITE;
/*!40000 ALTER TABLE `Categorie` DISABLE KEYS */;
INSERT INTO `Categorie` VALUES (1,'Categoriee1'),(2,'Categoriee2');
/*!40000 ALTER TABLE `Categorie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CategorieTab`
--

DROP TABLE IF EXISTS `CategorieTab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CategorieTab` (
  `idCategorieTab` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idCategorieTab`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CategorieTab`
--

LOCK TABLES `CategorieTab` WRITE;
/*!40000 ALTER TABLE `CategorieTab` DISABLE KEYS */;
INSERT INTO `CategorieTab` VALUES (1,'peindre a huile'),(2,'aquarelle'),(3,'Noir et Blanc'),(4,'Tableau Vide (Cadre)');
/*!40000 ALTER TABLE `CategorieTab` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Contact`
--

DROP TABLE IF EXISTS `Contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Contact` (
  `idContact` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) DEFAULT NULL,
  `prenom` varchar(45) DEFAULT NULL,
  `idTab` int(11) DEFAULT NULL,
  `idProd` int(11) DEFAULT NULL,
  `quantite` int(11) DEFAULT '1',
  `email` varchar(45) NOT NULL,
  `vue` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`idContact`),
  KEY `fk_contact_tableau` (`idTab`),
  CONSTRAINT `fk_contact_tableau` FOREIGN KEY (`idTab`) REFERENCES `Tableau` (`idTableau`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Contact`
--

LOCK TABLES `Contact` WRITE;
/*!40000 ALTER TABLE `Contact` DISABLE KEYS */;
INSERT INTO `Contact` VALUES (1,'youssef','abidi',10,0,1,'youssef.abidi.32@gmail.com',0),(2,'ahmed','bla bla',10,0,1,'ahmed@gmail.com',0),(3,'ahmed','bla bla',10,0,1,'ahmed@gmail.com',0);
/*!40000 ALTER TABLE `Contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Item`
--

DROP TABLE IF EXISTS `Item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Item` (
  `idItem` int(11) NOT NULL AUTO_INCREMENT,
  `info` text NOT NULL,
  `taille` varchar(45) DEFAULT NULL,
  `prix` double DEFAULT NULL,
  `categorie` int(11) NOT NULL,
  `typeBois` varchar(45) DEFAULT NULL,
  `nom` varchar(45) NOT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`idItem`),
  KEY `fk_Item_1_idx` (`categorie`),
  CONSTRAINT `fk_Item_1` FOREIGN KEY (`categorie`) REFERENCES `Categorie` (`idCategorie`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Item`
--

LOCK TABLES `Item` WRITE;
/*!40000 ALTER TABLE `Item` DISABLE KEYS */;
INSERT INTO `Item` VALUES (8,'sjofbnofsbno in odgin oidgn oinpgin ofig nfoni foi foi','100',522.3,1,'Type1','Nom du produit','2017-01-05');
/*!40000 ALTER TABLE `Item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tableau`
--

DROP TABLE IF EXISTS `Tableau`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tableau` (
  `idTableau` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) NOT NULL,
  `taille` varchar(45) DEFAULT NULL,
  `couleur` varchar(45) DEFAULT NULL,
  `prix` varchar(45) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `categorie` int(11) DEFAULT NULL,
  PRIMARY KEY (`idTableau`),
  KEY `fk_categ_tab` (`categorie`),
  CONSTRAINT `fk_categ_tab` FOREIGN KEY (`categorie`) REFERENCES `CategorieTab` (`idCategorieTab`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tableau`
--

LOCK TABLES `Tableau` WRITE;
/*!40000 ALTER TABLE `Tableau` DISABLE KEYS */;
INSERT INTO `Tableau` VALUES (8,'dfgbedfb','200x200cm',NULL,'20,','2017-05-10',1),(9,'rgzikbn','600x200cm',NULL,'54,','2017-05-10',1),(10,'deheth','150x300cm',NULL,'50,','2017-05-10',1),(11,'rzrbzikrn','150x300cmcm',NULL,'50,','2017-05-10',1);
/*!40000 ALTER TABLE `Tableau` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User` (
  `idUser` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(45) NOT NULL,
  `password` varchar(256) NOT NULL,
  `email` varchar(45) NOT NULL,
  PRIMARY KEY (`idUser`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES (1,'youssef','1000:5b42403335633337353232:af2e008e3d447f36541236a43cf7142d33a72c7c527aa53c432dbd4db22823b90ebd1eed9c130415e726eb72878b5797e8f18bffec93a16138745f3e090c6e46','youssef.abidi.32@gmail.com');
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-05-30 17:29:55
