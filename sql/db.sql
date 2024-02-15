-- MariaDB dump 10.19  Distrib 10.6.16-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: Steen
-- ------------------------------------------------------
-- Server version	10.6.16-MariaDB-0ubuntu0.22.04.1

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

DROP Database if EXISTS Steen;
CREATE Database Steen;
Use Steen;

--
-- Table structure for table `JEU_A_TAG`
--

DROP TABLE IF EXISTS `JEU_A_TAG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `JEU_A_TAG` (
  `idTag` int(11) NOT NULL,
  `idJeu` int(11) NOT NULL,
  PRIMARY KEY (`idTag`,`idJeu`),
  KEY `fk_Tag_has_Jeu_Jeu1_idx` (`idJeu`),
  KEY `fk_Tag_has_Jeu_Tag1_idx` (`idTag`),
  CONSTRAINT `fk_Tag_has_Jeu_Jeu1` FOREIGN KEY (`idJeu`) REFERENCES `jeu` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tag_has_Jeu_Tag1` FOREIGN KEY (`idTag`) REFERENCES `tag` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `JEU_A_TAG`
--

LOCK TABLES `JEU_A_TAG` WRITE;
/*!40000 ALTER TABLE `JEU_A_TAG` DISABLE KEYS */;
/*!40000 ALTER TABLE `JEU_A_TAG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UTILISATEUR_AJOUTE_JEU`
--

DROP TABLE IF EXISTS `UTILISATEUR_AJOUTE_JEU`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UTILISATEUR_AJOUTE_JEU` (
  `idUtilisateur` int(11) NOT NULL,
  `idJeu` int(11) NOT NULL,
  PRIMARY KEY (`idUtilisateur`,`idJeu`),
  KEY `fk_Utilisateur_has_Jeu_Jeu1_idx` (`idJeu`),
  KEY `fk_Utilisateur_has_Jeu_Utilisateur1_idx` (`idUtilisateur`),
  CONSTRAINT `fk_Utilisateur_has_Jeu_Jeu1` FOREIGN KEY (`idJeu`) REFERENCES `jeu` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Utilisateur_has_Jeu_Utilisateur1` FOREIGN KEY (`idUtilisateur`) REFERENCES `utilisateur` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UTILISATEUR_AJOUTE_JEU`
--

LOCK TABLES `UTILISATEUR_AJOUTE_JEU` WRITE;
/*!40000 ALTER TABLE `UTILISATEUR_AJOUTE_JEU` DISABLE KEYS */;
/*!40000 ALTER TABLE `UTILISATEUR_AJOUTE_JEU` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UTILISATEUR_DEVELOPPE_JEU`
--

DROP TABLE IF EXISTS `UTILISATEUR_DEVELOPPE_JEU`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UTILISATEUR_DEVELOPPE_JEU` (
  `idJeu` int(11) NOT NULL,
  `idUtilisateur` int(11) NOT NULL,
  PRIMARY KEY (`idJeu`,`idUtilisateur`),
  KEY `fk_Jeu_has_Utilisateur_Utilisateur1_idx` (`idUtilisateur`),
  KEY `fk_Jeu_has_Utilisateur_Jeu1_idx` (`idJeu`),
  CONSTRAINT `fk_Jeu_has_Utilisateur_Jeu1` FOREIGN KEY (`idJeu`) REFERENCES `jeu` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Jeu_has_Utilisateur_Utilisateur1` FOREIGN KEY (`idUtilisateur`) REFERENCES `utilisateur` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UTILISATEUR_DEVELOPPE_JEU`
--

LOCK TABLES `UTILISATEUR_DEVELOPPE_JEU` WRITE;
/*!40000 ALTER TABLE `UTILISATEUR_DEVELOPPE_JEU` DISABLE KEYS */;
/*!40000 ALTER TABLE `UTILISATEUR_DEVELOPPE_JEU` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UTILISATEUR_PUBLIE_JEU`
--

DROP TABLE IF EXISTS `UTILISATEUR_PUBLIE_JEU`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UTILISATEUR_PUBLIE_JEU` (
  `idJeu` int(11) NOT NULL,
  `idUtilisateur` int(11) NOT NULL,
  PRIMARY KEY (`idJeu`,`idUtilisateur`),
  KEY `fk_Jeu_has_Utilisateur_Utilisateur2_idx` (`idUtilisateur`),
  KEY `fk_Jeu_has_Utilisateur_Jeu2_idx` (`idJeu`),
  CONSTRAINT `fk_Jeu_has_Utilisateur_Jeu2` FOREIGN KEY (`idJeu`) REFERENCES `jeu` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Jeu_has_Utilisateur_Utilisateur2` FOREIGN KEY (`idUtilisateur`) REFERENCES `utilisateur` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UTILISATEUR_PUBLIE_JEU`
--

LOCK TABLES `UTILISATEUR_PUBLIE_JEU` WRITE;
/*!40000 ALTER TABLE `UTILISATEUR_PUBLIE_JEU` DISABLE KEYS */;
/*!40000 ALTER TABLE `UTILISATEUR_PUBLIE_JEU` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evaluation`
--

DROP TABLE IF EXISTS `evaluation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evaluation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `recommander` tinyint(2) NOT NULL,
  `datePost` date NOT NULL,
  `description` mediumtext NOT NULL,
  `idUtilisateur` int(11) NOT NULL,
  `idJeu` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_Evaluation_Utilisateur1_idx` (`idUtilisateur`),
  KEY `fk_Evaluation_Jeu1_idx` (`idJeu`),
  CONSTRAINT `fk_Evaluation_Jeu1` FOREIGN KEY (`idJeu`) REFERENCES `jeu` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Evaluation_Utilisateur1` FOREIGN KEY (`idUtilisateur`) REFERENCES `utilisateur` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evaluation`
--

LOCK TABLES `evaluation` WRITE;
/*!40000 ALTER TABLE `evaluation` DISABLE KEYS */;
/*!40000 ALTER TABLE `evaluation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `infraction`
--

DROP TABLE IF EXISTS `infraction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `infraction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dateCreation` date NOT NULL,
  `datePeremption` date DEFAULT NULL,
  `type` varchar(30) NOT NULL,
  `description` mediumtext NOT NULL,
  `idAdmin` int(11) NOT NULL,
  `idEmetteur` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_Infraction_Utilisateur1_idx` (`idAdmin`),
  KEY `fk_Infraction_Utilisateur2_idx` (`idEmetteur`),
  CONSTRAINT `fk_Infraction_Utilisateur1` FOREIGN KEY (`idAdmin`) REFERENCES `utilisateur` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Infraction_Utilisateur2` FOREIGN KEY (`idEmetteur`) REFERENCES `utilisateur` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `infraction`
--

LOCK TABLES `infraction` WRITE;
/*!40000 ALTER TABLE `infraction` DISABLE KEYS */;
/*!40000 ALTER TABLE `infraction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jeu`
--

DROP TABLE IF EXISTS `jeu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jeu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Nom` varchar(100) NOT NULL,
  `DateSortie` date NOT NULL,
  `Description` mediumtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jeu`
--

LOCK TABLES `jeu` WRITE;
/*!40000 ALTER TABLE `jeu` DISABLE KEYS */;
/*!40000 ALTER TABLE `jeu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Nom` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Nom` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token`
--

DROP TABLE IF EXISTS `token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `token` (
  `Token` varchar(200) NOT NULL,
  `idUtilisateur` int(11) NOT NULL,
  PRIMARY KEY (`Token`),
  UNIQUE KEY `Token_UNIQUE` (`Token`),
  KEY `fk_Token_Utilisateur1_idx` (`idUtilisateur`),
  CONSTRAINT `fk_Token_Utilisateur1` FOREIGN KEY (`idUtilisateur`) REFERENCES `utilisateur` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token`
--

LOCK TABLES `token` WRITE;
/*!40000 ALTER TABLE `token` DISABLE KEYS */;
/*!40000 ALTER TABLE `token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `utilisateur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Nom` varchar(90) NOT NULL,
  `EMail` varchar(90) NOT NULL,
  `mdp` varchar(100) NOT NULL,
  `muet` tinyint(1) NOT NULL,
  `idRole` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `Nom_UNIQUE` (`Nom`),
  KEY `fk_Utilisateur_Role1_idx` (`idRole`),
  CONSTRAINT `fk_Utilisateur_Role1` FOREIGN KEY (`idRole`) REFERENCES `role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utilisateur`
--

LOCK TABLES `utilisateur` WRITE;
/*!40000 ALTER TABLE `utilisateur` DISABLE KEYS */;
/*!40000 ALTER TABLE `utilisateur` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-15 15:53:52

DROP USER IF EXISTS ApiUser@localhost;
FLUSH PRIVILEGES;
CREATE USER ApiUser@localhost IDENTIFIED BY '***REMOVED***';
GRANT ALL PRIVILEGES ON Steen.* TO ApiUser@localhost;
FLUSH PRIVILEGES;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;