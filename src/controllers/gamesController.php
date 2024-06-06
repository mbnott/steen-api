<?php

/*
 * Auteurs:     ***REMOVED***, ***REMOVED***, ***REMOVED***
 * Classe:      ***REMOVED***
 * Projet:      Steen
 */

namespace Mbnot\SteenApi\controllers;
use Mbnot\SteenApi\models\HTTP_STATUS;
use Mbnot\SteenApi\models\dbManager;
use Mbnot\SteenApi\models\game;
use Mbnot\SteenApi\models\review;
use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;

class gamesController extends baseController
{
    // Fetches all games, with `tag` and `name` filter
    public function getGames(Request $request, Response $response): Response
    {
        $db = new dbManager();

        // Auth
        if (!self::verifyAuth($request, $db))
            return $response
                ->withStatus(HTTP_STATUS::UNAUTHORIZED);

        // Fetching games
        $fetchedGames = $db->getGames();
        $games = [];

        foreach($fetchedGames as $game)
            array_push($games, new Game(
                $game["id"],
                $game["nom"],
                $game["dateSortie"],
                $game["description"],
                $game["pseudo"],
                floatval($game["note"]),
            ));

        $response->getBody()->write(json_encode($games));

        return $response
            ->withHeader('content-type', 'application/json')
            ->withStatus(HTTP_STATUS::OK);
    }

    // ***REMOVED***, ***REMOVED***
    public function getGame(Request $request, Response $response, array $args) : Response
    {
        $db = new dbManager();

        // Auth
        if (!self::verifyAuth($request, $db))
            return $response
                ->withStatus(HTTP_STATUS::UNAUTHORIZED);

        // Fetching game
        $fetchedGame = $db->getGame($args["id"]);
        if ($fetchedGame === false) // Checking if it exists before
            return $response
                ->withStatus(HTTP_STATUS::NOT_FOUND);

        $response->getBody()->write(json_encode(
            new game($fetchedGame["id"], $fetchedGame["nom"], $fetchedGame["dateSortie"],
            $fetchedGame["description"], $fetchedGame["pseudo"], $fetchedGame["note"])
        ));

        return $response
            ->withHeader('content-type', 'application/json')
            ->withStatus(HTTP_STATUS::OK);
    }

    // ***REMOVED***, ***REMOVED***
    public function addGame(Request $request, Response $response) : Response
    {
        $db = new dbManager();

        // Auth verification
        if (!self::verifyAuth($request, $db))
            return $response
                ->withStatus(HTTP_STATUS::UNAUTHORIZED);

        // Fields verification
        if (!self::verifyFields($request, ["nom", "dateSortie", "description"]))
            return $response
                ->withStatus(HTTP_STATUS::BAD_REQUEST);

        // Getting body data & token to get user id
        $input = json_decode(file_get_contents('php://input'));
        $token = $this->realtoken;

        // Adding game to db
        $result = $db->addGame($input->nom, $input->dateSortie, $input->description, $db->getUserByToken($token));
        if ($result === false)
            return $response
                ->withStatus(HTTP_STATUS::INTERNAL_SERVER_ERROR);

        $response->getBody()->write(json_encode([
            "message" => "Game successfully added!",
            "id" => $result,
        ]));

        return $response
            ->withHeader('content-type', 'application/json')
            ->withStatus(HTTP_STATUS::CREATED);
    }

    // ***REMOVED***
    public function deleteGame(Request $request, Response $response, array $args) : Response
    {
        $db = new dbManager();

        // Auth verification
        if (!self::verifyAuth($request, $db))
            return $response
                ->withStatus(HTTP_STATUS::UNAUTHORIZED);

        // Check if game exists
        $game = $db->getGame($args["id"]);
        if ($game === false)
            return $response
                ->withStatus(HTTP_STATUS::NOT_FOUND);

        // Check if user has the rights
        $user = $db->getUser($db->getUserByToken($this->realtoken));

        if ($user["idRole"] == $db::ADMIN_ID || $user["id"] == $game["idDeveloppeur"]) // If user does not have the rights
        {
            // Attempt to delete the game
            $success = $db->deleteGame($args["id"]);

            if (!$success) // On fail
                return $response
                    ->withStatus(HTTP_STATUS::INTERNAL_SERVER_ERROR);

            // Success
            $response->getBody()->write(json_encode(["message" => "Game successfully deleted!"]));
            return $response
                ->withHeader('content-type', 'application/json')
                ->withStatus(HTTP_STATUS::OK);
        }

        return $response
            ->withStatus(HTTP_STATUS::FORBIDDEN);
    }

    // ***REMOVED***, ***REMOVED***
    public function getReviews(Request $request, Response $response, array $args) : Response
    {
        $db = new dbManager();

        // Auth verification
        if (!self::verifyAuth($request, $db))
            return $response
                ->withStatus(HTTP_STATUS::UNAUTHORIZED);

        // Fetch reviews
        $result = $db->getReviews($args["id"]);

        if ($result === false)
            return $response
                ->withStatus(HTTP_STATUS::NOT_FOUND);

        $reviews = [];
        foreach($result as $review)
            array_push($reviews, new review(
                $review["id"],
                $review["note"],
                $review["datePost"],
                $review["description"],
                $review["idUtilisateur"],
                $review["pseudo"],
                $review["idJeu"],
                $review["jeu"]
            ));

        $response->getBody()->write(json_encode($reviews));

        return $response
            ->withHeader('content-type', 'application/json')
            ->withStatus(HTTP_STATUS::OK);
    }

    // ***REMOVED***, ***REMOVED***
    public function addReview(Request $request, Response $response, array $args) : Response
    {
        $db = new dbManager();

        // Auth verification
        if (!self::verifyAuth($request, $db))
            return $response
                ->withStatus(HTTP_STATUS::UNAUTHORIZED);

        // Fields verification
        if (!self::verifyFields($request, ["note", "description"]))
            return $response
                ->withStatus(HTTP_STATUS::BAD_REQUEST);

        // Check if game exists
        $game = $db->getGame($args["id"]);
        if ($game === false)
            return $response
                ->withStatus(HTTP_STATUS::NOT_FOUND);

        // Getting body data & token to get user id
        $input = json_decode(file_get_contents('php://input'));

        // Adding game to db
        $result = $db->addReview($input->note, $input->description, $db->getUserByToken($this->realtoken), $args["id"]);
        if ($result === false)
            return $response
                ->withStatus(HTTP_STATUS::INTERNAL_SERVER_ERROR);

        $response->getBody()->write(json_encode([
            "message" => "Review successfully added!",
            "id" => $result,
        ]));

        return $response
            ->withHeader('content-type', 'application/json')
            ->withStatus(HTTP_STATUS::CREATED);
    }
}
