<?php

namespace Mbnot\SteenApi\controllers;
use Mbnot\SteenApi\models\HTTP_STATUS;
use Mbnot\SteenApi\models\dbManager;
use Mbnot\SteenApi\models\Game;
use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;


class gamesController
{

    // Fetches all games, with `tag` and `name` filter
    public function fetchAll(Request $request, Response $response): Response
    {
        //$request->getQueryParams();
        $db = new dbManager();

        $fetchedGames = $db->getGames();
        $games = [];

        foreach($fetchedGames as $game)
        {
            array_push($games, new Game(
                $game["id"],
                $game["nom"],
                $game["dateSortie"],
                $game["description"],
                $game["pseudo"],
                $game["tags"],
                $game["note"],
            ));
        }

        $response->getBody()->write(json_encode(
            $games
        ));

        return $response
            ->withHeader('content-type', 'application/json')
            ->withStatus(HTTP_STATUS::NOT_YET_IMPLEMENTED->value);
    }

    public function fetch(Request $request, Response $response, array $args) : Response
    {
        
    }
}
