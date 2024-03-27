<?php

namespace Mbnot\SteenApi\controllers;
use Psr\Http\Message\ResponseInterface as Response;
use Mbnot\SteenApi\models\dbManager;
use Mbnot\SteenApi\models\tag;
use Psr\Http\Message\ServerRequestInterface as Request;
use Mbnot\SteenApi\Models\HTTP_STATUS;

class tagsController {

    public function getTags(Request $request, Response $response): Response
    {
        $db = new dbManager();

        $fetchedTags = $db->getGames();
        $tags = [];

        foreach($fetchedTags as $tag)
        {
            array_push($tag, new tag(
                $tag["id"],
                $tag["nom"]
            ));
        }

        $response->getBody()->write(json_encode(
            $tags
        ));

        return $response
            ->withHeader('content-type', 'application/json')
            ->withStatus(HTTP_STATUS::OK->value);
    }
}