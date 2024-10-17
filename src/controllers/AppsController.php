<?php

namespace Mbnot\SteenApi\controllers;
use Mbnot\SteenApi\models\HTTP_STATUS;
use Mbnot\SteenApi\models\dbManager;
use Mbnot\SteenApi\models\App;
use Mbnot\SteenApi\models\review;
use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;

class AppsController extends baseController
{
    // Fetches all apps, with `tag` and `name` filter
    public function getApps(Request $request, Response $response): Response
    {
        $db = new dbManager();

        // Auth
        if (!self::verifyAuth($request, $db))
            return $response
                ->withStatus(HTTP_STATUS::UNAUTHORIZED);

        // Fetching apps
        $fetchedApps = $db->getApps();
        $apps = [];

        foreach($fetchedApps as $app)
            array_push($apps, new App(
                $app["id"],
                $app["nom"],
                $app["dateSortie"],
                $app["description"],
                $app["pseudo"],
                floatval($app["note"]),
            ));

        $response->getBody()->write(json_encode($apps));

        return $response
            ->withHeader('content-type', 'application/json')
            ->withStatus(HTTP_STATUS::OK);
    }

    // ***REMOVED***, ***REMOVED***
    public function getApp(Request $request, Response $response, array $args) : Response
    {
        $db = new dbManager();

        // Auth
        if (!self::verifyAuth($request, $db))
            return $response
                ->withStatus(HTTP_STATUS::UNAUTHORIZED);

        // Fetching app
        $fetchedApp = $db->getApp($args["id"]);
        if ($fetchedApp === false) // Checking if it exists before
            return $response
                ->withStatus(HTTP_STATUS::NOT_FOUND);

        $response->getBody()->write(json_encode(
            new App($fetchedApp["id"], $fetchedApp["nom"], $fetchedApp["dateSortie"],
            $fetchedApp["description"], $fetchedApp["pseudo"], $fetchedApp["note"])
        ));

        return $response
            ->withHeader('content-type', 'application/json')
            ->withStatus(HTTP_STATUS::OK);
    }

    // ***REMOVED***, ***REMOVED***
    public function addApp(Request $request, Response $response) : Response
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

        // Adding app to db
        $result = $db->addApp($input->nom, $input->dateSortie, $input->description, $db->getUserByToken($token));
        if ($result === false)
            return $response
                ->withStatus(HTTP_STATUS::INTERNAL_SERVER_ERROR);

        $response->getBody()->write(json_encode([
            "message" => "App successfully added!",
            "id" => $result,
        ]));

        return $response
            ->withHeader('content-type', 'application/json')
            ->withStatus(HTTP_STATUS::CREATED);
    }

    // ***REMOVED***
    public function deleteApp(Request $request, Response $response, array $args) : Response
    {
        $db = new dbManager();

        // Auth verification
        if (!self::verifyAuth($request, $db))
            return $response
                ->withStatus(HTTP_STATUS::UNAUTHORIZED);

        // Check if app exists
        $app = $db->getApp($args["id"]);
        if ($app === false)
            return $response
                ->withStatus(HTTP_STATUS::NOT_FOUND);

        // Check if user has the rights
        $user = $db->getUser($db->getUserByToken($this->realtoken));

        if ($user["idRole"] == $db::ADMIN_ID || $user["id"] == $app["idDeveloppeur"]) // If user does not have the rights
        {
            // Attempt to delete the app
            $success = $db->deleteApp($args["id"]);

            if (!$success) // On fail
                return $response
                    ->withStatus(HTTP_STATUS::INTERNAL_SERVER_ERROR);

            // Success
            $response->getBody()->write(json_encode(["message" => "App successfully deleted!"]));
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

        // Check if app exists
        $app = $db->getApp($args["id"]);
        if ($app === false)
            return $response
                ->withStatus(HTTP_STATUS::NOT_FOUND);

        // Getting body data & token to get user id
        $input = json_decode(file_get_contents('php://input'));

        // Adding app to db
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
