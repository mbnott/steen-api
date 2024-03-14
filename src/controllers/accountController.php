<?php

namespace Mbnot\SteenApi\controllers;

use Mbnot\SteenApi\models\dbManager;
use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use Mbnot\SteenApi\Models\HTTP_STATUS;
use OpenApi\Annotations as OA;

class accountController
{
    public function login(Request $request, Response $response): Response
    {
        $tokenHeader = $request->getHeader("token");

        $response->getBody()->write(json_encode([
            "tokenData" => $tokenHeader
        ]));

        return $response
            ->withHeader('content-type', 'application/json')
            ->withStatus(HTTP_STATUS::OK->value);
    }

    public function register(Request $request, Response $response): Response
    {
        // Getting body data
        $input = json_decode(file_get_contents('php://input'));

        // Checking if all fields are present
        $fields = ["username", "email", "password"];
        $missingFields = array_values(array_diff($fields, array_keys((array)$input)));
        if (count($missingFields) > 0)
        {
            // Keys are missing, bad request
            $response->getBody()->write(json_encode([
                "error" => "Bad Request",
                "message" => "Fields are missing from the body of your request",
                "missing" => $missingFields
            ]));
            return $response
                ->withHeader('content-type', 'application/json')
                ->withStatus(HTTP_STATUS::BAD_REQUEST->value);
        }

        // Validating fields
        if (strlen($input->email) <= 5)
        {
            $response->getBody()->write(json_encode([
                "error" => "Bad Request",
                "message" => "Email must be longer than 5 characters"
            ]));
            return $response
                ->withHeader('content-type', 'application/json')
                ->withStatus(HTTP_STATUS::BAD_REQUEST->value);
        }

        // Adding user to db
        $password = password_hash($input->password, PASSWORD_BCRYPT);

        $db = new dbManager();
        $userId = $db->register($input->username, $input->email, $password);
        $token = $db->createToken($userId);

        $response->getBody()->write(json_encode([
            "message" => "Account successfully created!",
            "id" => $userId,
            "token" => $token
        ]));
        return $response
            ->withHeader('content-type', 'application/json')
            ->withStatus(HTTP_STATUS::CREATED->value);
    }
}
