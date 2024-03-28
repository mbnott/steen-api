<?php

// session_start();

use Slim\Factory\AppFactory;

// Chargement automatique des classes
require __DIR__ . '/../vendor/autoload.php';

$app = AppFactory::create();

// Traitement d'erreurs
$app->addErrorMiddleware(true, true, true);

require __DIR__ . '/../routes/web.php';

$app->run();
