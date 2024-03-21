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
    public function getGames(Request $request, Response $response): Response
    {
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
                $game["note"],
            ));
        }

        $response->getBody()->write(json_encode(
            $games
        ));

        return $response
            ->withHeader('content-type', 'application/json')
            ->withStatus(HTTP_STATUS::OK->value);
    }

    public function getGame(Request $request, Response $response, array $args) : Response
    {
        $db = new dbManager();

        $fetchedGame = $db->getGame();
        $game = [];

        array_push($game, new Game(
            $game["id"],
            $game["nom"],
            $game["dateSortie"],
            $game["description"],
            $game["pseudo"],
            $game["note"],
        ));

        $response->getBody()->write(json_encode(
            $game
        ));

        return $response
            ->withHeader('content-type', 'application/json')
            ->withStatus(HTTP_STATUS::OK->value);
    }

    public function addGame(Request $request, Response $response): Response
    {
        // Getting body data
        $input = json_decode(file_get_contents('php://input'));

        // Checking if all fields are present
        $fields = ["nom", "dateSortie", "description", "idDeveloppeur"];
        $missingFields = array_values(array_diff($fields, array_keys((array)$input)));
        if (count($missingFields) > 0) {
            return $response
                ->withHeader('content-type', 'application/json')
                ->withStatus(HTTP_STATUS::BAD_REQUEST->value);
        }

        // Adding game to db
        $db = new dbManager();
        $gameId = $db->addGame($input->nom, $input->dateSortie, $input->description, $input->idDeveloppeur);

        $response->getBody()->write(json_encode([
            "message" => "Game successfully added!",
            "id" => $gameId,
        ]));
        return $response
            ->withHeader('content-type', 'application/json')
            ->withStatus(HTTP_STATUS::CREATED->value);
    }
}
