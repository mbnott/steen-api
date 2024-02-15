<?php
global $app;
require '../vendor/autoload.php';

use Mbnot\SteenApi\controllers\indexController;
use Mbnot\SteenApi\controllers\gamesController;

$app->get('/', [indexController::class, 'welcome']);
$app->get('/games', [gamesController::class, 'fetchAll']);
$app->get('/games/{number}', [gamesController::class, 'fetch']);