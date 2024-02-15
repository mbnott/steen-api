<?php

namespace Mbnot\SteenApi\controllers;
use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use Mbnot\SteenApi\Models\HTTP_STATUS;

class indexController
{
    /**
     * @OA\Get(
     *     path="/",
     *     @OA\Response(
     *         response="200",
     *         description="Shows a warm welcome message"
     *     )
     * )
     */
    public function welcome(Request $request, Response $response, array $args): Response
    {
        $response->getBody()->write(json_encode([
            "msg" => "Welcome!"
        ]));

        return $response
            ->withHeader('content-type', 'application/json')
            ->withStatus(HTTP_STATUS::OK->value);
    }
}
