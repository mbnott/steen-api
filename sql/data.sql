USE Steen;

INSERT INTO tag (Nom) VALUES ("Horreur"),
    ("Bac a sable"),
    ("FPS"),
    ("Metroidvania");

INSERT INTO jeu (Nom, DateSortie, Description) VALUES ("La Joie De Créer", "2013-03-12", "La joie de création est un jeu d’horreur terrifiant en vue à la première personne");

INSERT INTO role (Nom) VALUES ("Client"), ("Admin");

-- le mot de passe des deux utilisateur est Super2024
INSERT INTO utilisateur (Nom, EMail, mdp, muet, idRole) VALUES ("SuperUtilisateur", "Utilisateur@gmail.com", "$2y$10$NZxH.5R6GaoctqV7ioiaNux/jVufSQCtE.O5brKVfuTk45i0yuA9K", 0, 1),
    ("SuperAdmin", "Admin@gmail.com", "$2y$10$NZxH.5R6GaoctqV7ioiaNux/jVufSQCtE.O5brKVfuTk45i0yuA9K", 0, 2);

INSERT INTO JEU_A_TAG (idTag, idJeu) VALUES (1, 1);

INSERT INTO UTILISATEUR_DEVELOPPE_JEU (idJeu, idUtilisateur) VALUES (1, 1);

INSERT INTO UTILISATEUR_PUBLIE_JEU (idJeu, idUtilisateur) VALUES (1, 1);
