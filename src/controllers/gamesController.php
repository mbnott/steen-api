<?php

namespace Mbnot\SteenApi\controllers;
use Mbnot\SteenApi\models\HTTP_STATUS;
use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;

class gamesController
{
    public function fetchAll(Request $request, Response $response, array $args): Response
    {
        //$response->getBody()->write(json_encode());

        return $response
            ->withHeader('content-type', 'application/json')
            ->withStatus(501);
    }
}
