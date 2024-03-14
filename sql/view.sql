USE Steen;
DROP VIEW IF EXISTS getGamesWTag;
CREATE VIEW `getGamesWTag` AS
SELECT jeu.id,  jeu.nom, jeu.dateSortie, jeu.description, utilisateur.nom AS pseudo, GROUP_CONCAT(tag.nom SEPARATOR ',') as tags, AVG(evaluation.note) as note
FROM jeu
JOIN utilisateur ON utilisateur.id = jeu.idDeveloppeur
JOIN JEU_A_TAG AS JAT ON JAT.idJeu = jeu.id
JOIN tag ON tag.id = JAT.idTag
LEFT JOIN evaluation ON evaluation.idJeu = jeu.id
GROUP BY jeu.id;

DROP VIEW IF EXISTS getGames;
CREATE VIEW `getGames` AS
SELECT jeu.id,  jeu.nom, jeu.dateSortie, jeu.description, utilisateur.nom AS pseudo, AVG(evaluation.note) as note
FROM jeu
JOIN utilisateur ON utilisateur.id = jeu.idDeveloppeur
LEFT JOIN evaluation ON evaluation.idJeu = jeu.id
GROUP BY jeu.id;