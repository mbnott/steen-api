USE Steen;
DROP VIEW IF EXISTS Get_Games;
CREATE VIEW `Get_Games` AS
SELECT jeu.nom, jeu.dateSortie, jeu.description, utilisateur.nom AS pseudo, GROUP_CONCAT(tag.nom SEPARATOR ',') as tag, AVG(evaluation.note) as note
FROM jeu
JOIN utilisateur ON utilisateur.id = jeu.idDeveloppeur
JOIN JEU_A_TAG AS JAT ON JAT.idJeu = jeu.id
JOIN tag ON tag.id = JAT.idTag
LEFT JOIN evaluation ON evaluation.idJeu = jeu.id
