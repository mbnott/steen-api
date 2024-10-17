SET sql_mode = 'TRADITIONAL';
USE Steen;

DROP VIEW IF EXISTS getAppsWTag;
CREATE VIEW `getAppsWTag` AS
SELECT app.id,  app.name, app.releaseDate, app.description, user.name AS pseudo, GROUP_CONCAT(tag.name SEPARATOR ',') as tags, AVG(review.note) as note
FROM app
JOIN user ON user.id = app.idDev
JOIN APP_HAS_TAG AS JAT ON JAT.idApp = app.id
JOIN tag ON tag.id = JAT.idTag
LEFT JOIN review ON review.idApp = app.id
GROUP BY app.id;

DROP VIEW IF EXISTS getApps;
CREATE VIEW `getApps` AS
SELECT app.id,  app.name, app.releaseDate, app.description, app.idDev, user.name AS pseudo, AVG(review.note) as note
FROM app
JOIN user ON user.id = app.idDev
LEFT JOIN review ON review.idApp = app.id
GROUP BY app.id;

DROP VIEW IF EXISTS getReviews;
CREATE VIEW `getReviews` AS
SELECT review.id,  review.note, review.creationDate, review.description, user.id as authorId, user.name AS pseudo, app.id as appId, app.name as appName
FROM review
JOIN user ON user.id = review.idUser
JOIN app ON app.id = review.idApp;
