USE Steen;

INSERT INTO tag (nom) VALUES ("Horreur"),
    ("Bac a sable"),
    ("FPS"),
    ("Metroidvania"),
    ("Aventure"),
    ("Action"),
    ("Simulation"),
    ("Stratégie"),
    ("Course"),
    ("RPG"),
    ("Rogue-like"),
    ("Sport"),
    ("Retro"),
    ("VR"),
    ("Arcade"),
    ("Combat"),
    ("Survie"),
    ("Clicker");

INSERT INTO role (nom) VALUES ("Client"), ("Admin");

-- le mot de passe des deux utilisateur est Super2024
INSERT INTO utilisateur (nom, email, mdp, idRole) VALUES ("SuperUtilisateur", "Utilisateur@gmail.com", "$2y$10$NZxH.5R6GaoctqV7ioiaNux/jVufSQCtE.O5brKVfuTk45i0yuA9K", 1),
    ("SuperAdmin", "Admin@gmail.com", "$2y$10$NZxH.5R6GaoctqV7ioiaNux/jVufSQCtE.O5brKVfuTk45i0yuA9K", 2);

INSERT INTO jeu (nom, DateSortie, Description, idDeveloppeur) VALUES ("La Joie De Créer", "2013-03-12", "La joie de création est un jeu d’horreur terrifiant en vue à la première personne.", 1),
    ("La redemption de la mort rouge II", "2018-26-10", "La redemption de la mort rouge II est le deuxième opus de la série qui se déroule avant le premier jeu.", 1),
    ("La légende de Zelda : Souffle de la nature", "2017-03-03", "La légende de Zelda : Souffle de la nature est un jeu en monde ouvert dont le but est de tuer un être maléfique.");

INSERT INTO JEU_A_TAG (idTag, idJeu) VALUES (1, 1),
    (4, 1);
