USE Steen;

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
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
-- Table structure for table `token`
--

DROP TABLE IF EXISTS `token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `token` (
  `token` varchar(200) NOT NULL,
  `idUtilisateur` int(11) NOT NULL,
  PRIMARY KEY (`Token`),
  UNIQUE KEY `Token_UNIQUE` (`Token`),
  KEY `fk_Token_Utilisateur1_idx` (`idUtilisateur`),
  CONSTRAINT `fk_Token_Utilisateur1` FOREIGN KEY (`idUtilisateur`) REFERENCES `utilisateur` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `utilisateur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(90) NOT NULL,
  `eMail` varchar(90) NOT NULL,
  `mdp` varchar(100) NOT NULL,
  `muet` tinyint(1) NOT NULL,
  `idRole` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `Nom_UNIQUE` (`Nom`),
  KEY `fk_Utilisateur_Role1_idx` (`idRole`),
  CONSTRAINT `fk_Utilisateur_Role1` FOREIGN KEY (`idRole`) REFERENCES `role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;