<?php
global $app;
require '../vendor/autoload.php';

use Mbnot\SteenApi\controllers\indexController;
use Mbnot\SteenApi\controllers\AppsController;
use Mbnot\SteenApi\controllers\accountController;

$app->get('/', [indexController::class, 'welcome']);

// Apps
$app->get('/apps', [AppsController::class, 'getApps']);
$app->post('/apps', [AppsController::class, 'addApp']);
$app->get('/apps/{id}', [AppsController::class, 'getApp']);
$app->delete('/apps/{id}', [AppsController::class, 'deleteApp']);
$app->get('/apps/{id}/reviews', [AppsController::class, 'getReviews']);
$app->post('/apps/{id}/reviews', [AppsController::class, 'addReview']); // TODO
$app->delete('/apps/{id}/reviews/{reviewId}', [AppsController::class, 'deleteReview']); // TODO

// Account
$app->post('/account/login', [accountController::class, 'login']);
$app->post('/account/register', [accountController::class, 'register']);
$app->delete('/account/{id}', [accountController::class, 'deleteAccount']); // TODO
$app->get('/account/{id}/library', [accountController::class, 'getLibrary']); // TODO
$app->post('/account/{id}/library', [accountController::class, 'addToLibrary']); // TODO
