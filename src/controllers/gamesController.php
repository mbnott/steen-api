<?php

namespace Mbnot\SteenApi\controllers;
use Mbnot\SteenApi\models\HTTP_STATUS;
use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use OpenApi\Annotations as OA;

/**
 * @OA\Info(title="SteenApi", version="0.1")
 */
class gamesController
{
    /**
     * @OA\Get(
     *     path="/games",
     *     @OA\Response(response="501", description="Fetches all games. Not yet implemented!")
     * )
     */
    public function fetchAll(Request $request, Response $response, array $args): Response
    {
        //$response->getBody()->write(json_encode());

        return $response
            ->withHeader('content-type', 'application/json')
            ->withStatus(HTTP_STATUS::NOT_YET_IMPLEMENTED->value);
    }
}
