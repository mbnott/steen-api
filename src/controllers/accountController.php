<?php

namespace Mbnot\SteenApi\controllers;

use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use Mbnot\SteenApi\Models\HTTP_STATUS;
use OpenApi\Annotations as OA;


class accountController
{
    public function welcome(Request $request, Response $response, array $args): Response
    {
        $tokenHeader = $request->getHeader("token");


        $response->getBody()->write(json_encode([
            "tokenData" => $tokenHeader
        ]));

        return $response
            ->withHeader('content-type', 'application/json')
            ->withStatus(HTTP_STATUS::OK->value);
    }
}
