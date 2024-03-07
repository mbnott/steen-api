USE Steen;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(30) NOT NULL,
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
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(30) NOT NULL,
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
-- Table structure for table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `utilisateur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(90) NOT NULL,
  `email` varchar(90) NOT NULL,
  `mdp` varchar(100) NOT NULL,
  `muet` tinyint(1) NOT NULL,
  `idRole` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `Nom_UNIQUE` (`nom`),
  KEY `fk_Utilisateur_Role1_idx` (`idRole`),
  CONSTRAINT `fk_Utilisateur_Role1` FOREIGN KEY (`idRole`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utilisateur`
--

LOCK TABLES `utilisateur` WRITE;
/*!40000 ALTER TABLE `utilisateur` DISABLE KEYS */;
/*!40000 ALTER TABLE `utilisateur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jeu`
--

DROP TABLE IF EXISTS `jeu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jeu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) NOT NULL,
  `dateSortie` date NOT NULL,
  `description` mediumtext NOT NULL,
  `idDeveloppeur` int(11) NOT NULL,
  PRIMARY KEY (`id`,`idDeveloppeur`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `idDeveloppeur_UNIQUE` (`idDeveloppeur`),
  CONSTRAINT `FK_DEV_JEU` FOREIGN KEY (`idDeveloppeur`) REFERENCES `utilisateur` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
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
-- Table structure for table `token`
--

DROP TABLE IF EXISTS `token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `token` (
  `token` varchar(200) NOT NULL,
  `idUtilisateur` int(11) NOT NULL,
  PRIMARY KEY (`token`),
  UNIQUE KEY `Token_UNIQUE` (`token`),
  KEY `fk_Token_Utilisateur1_idx` (`idUtilisateur`),
  CONSTRAINT `fk_Token_Utilisateur1` FOREIGN KEY (`idUtilisateur`) REFERENCES `utilisateur` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
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
  CONSTRAINT `fk_Tag_has_Jeu_Jeu1` FOREIGN KEY (`idJeu`) REFERENCES `jeu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Tag_has_Jeu_Tag1` FOREIGN KEY (`idTag`) REFERENCES `tag` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
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
  CONSTRAINT `fk_Infraction_Utilisateur1` FOREIGN KEY (`idAdmin`) REFERENCES `utilisateur` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Infraction_Utilisateur2` FOREIGN KEY (`idEmetteur`) REFERENCES `utilisateur` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
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
  CONSTRAINT `fk_Evaluation_Jeu1` FOREIGN KEY (`idJeu`) REFERENCES `jeu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Evaluation_Utilisateur1` FOREIGN KEY (`idUtilisateur`) REFERENCES `utilisateur` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
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
-- Table structure for table `JEU_DANS_BIBLIOTHEQUE`
--

DROP TABLE IF EXISTS `JEU_DANS_BIBLIOTHEQUE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `JEU_DANS_BIBLIOTHEQUE` (
  `idUtilisateur` int(11) NOT NULL,
  `idJeu` int(11) NOT NULL,
  PRIMARY KEY (`idUtilisateur`,`idJeu`),
  KEY `fk_Utilisateur_has_Jeu_Jeu1_idx` (`idJeu`),
  KEY `fk_Utilisateur_has_Jeu_Utilisateur1_idx` (`idUtilisateur`),
  CONSTRAINT `fk_Utilisateur_has_Jeu_Jeu1` FOREIGN KEY (`idJeu`) REFERENCES `jeu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Utilisateur_has_Jeu_Utilisateur1` FOREIGN KEY (`idUtilisateur`) REFERENCES `utilisateur` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `JEU_DANS_BIBLIOTHEQUE`
--

LOCK TABLES `JEU_DANS_BIBLIOTHEQUE` WRITE;
/*!40000 ALTER TABLE `JEU_DANS_BIBLIOTHEQUE` DISABLE KEYS */;
/*!40000 ALTER TABLE `JEU_DANS_BIBLIOTHEQUE` ENABLE KEYS */;
UNLOCK TABLES;