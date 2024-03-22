<?php
global $app;
require '../vendor/autoload.php';

use Mbnot\SteenApi\controllers\indexController;
use Mbnot\SteenApi\controllers\gamesController;
use Mbnot\SteenApi\controllers\accountController;
use Mbnot\SteenApi\controllers\tagsController;

$app->get('/', [indexController::class, 'welcome']);

// Games
$app->get('/games', [gamesController::class, 'getGames']);
$app->post('/games', [gamesController::class, 'addGame']);
$app->get('/games/{id}', [gamesController::class, 'getGame']);
$app->delete('/games/{id}', [gamesController::class, 'deleteGame']); // TODO
$app->get('/games/{id}/reviews', [gamesController::class, 'getReviews']); // TODO
$app->post('/games/{id}/reviews', [gamesController::class, 'addReview']); // TODO
$app->delete('/games/{id}/reviews/{reviewId}', [gamesController::class, 'deleteReview']); // TODO

// Account
$app->post('/account/login', [accountController::class, 'login']); // TODO: returns a new token for the given account, if all data matches
$app->post('/account/register', [accountController::class, 'register']);
$app->delete('/account/{id}', [accountController::class, 'deleteAccount']); // TODO
$app->get('/account/{id}/library', [accountController::class, 'getLibrary']); // TODO
$app->post('/account/{id}/library', [accountController::class, 'addGame']); // TODO
$app->get('/account/{id}/infractions', [accountController::class, 'getInfractions']); // TODO
$app->post('/account/{id}/infractions', [accountController::class, 'addInfraction']); // TODO
$app->delete('/account/{id}/infractions/{infractionId}', [accountController::class, 'deleteInfraction']); // TODO

// Tags
$app->get('/tags', [tagsController::class, 'getTags']);
$app->post('/tags', [tagsController::class, 'addTag']); // TODO
$app->delete('/tags/{id}', [tagsController::class, 'deleteTag']); // TODO