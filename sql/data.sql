USE Steen;

INSERT INTO tag (nom) VALUES ("Horreur"),
    ("Bac a sable"),
    ("FPS"),
    ("Metroidvania");

INSERT INTO role (nom) VALUES ("Client"), ("Admin");

-- le mot de passe des deux utilisateur est Super2024
INSERT INTO utilisateur (nom, email, mdp, idRole) VALUES ("SuperUtilisateur", "Utilisateur@gmail.com", "$2y$10$NZxH.5R6GaoctqV7ioiaNux/jVufSQCtE.O5brKVfuTk45i0yuA9K", 1),
    ("SuperAdmin", "Admin@gmail.com", "$2y$10$NZxH.5R6GaoctqV7ioiaNux/jVufSQCtE.O5brKVfuTk45i0yuA9K", 2);

INSERT INTO jeu (nom, DateSortie, Description, idDeveloppeur) VALUES ("La Joie De Créer", "2013-03-12", "La joie de création est un jeu d’horreur terrifiant en vue à la première personne", 1);

INSERT INTO JEU_A_TAG (idTag, idJeu) VALUES (1, 1);
