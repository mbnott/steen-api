<?php

namespace Mbnot\SteenApi\controllers;

use Mbnot\SteenApi\models\dbManager;
use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use Mbnot\SteenApi\Models\HTTP_STATUS;
use OpenApi\Annotations as OA;

class accountController extends baseController
{
    public function register(Request $request, Response $response): Response
    {
        // Fields verification
        if (!self::verifyFields($request, ["username", "email", "password"]))
            return $response
                ->withStatus(HTTP_STATUS::BAD_REQUEST);

        // Getting body data
        $input = json_decode(file_get_contents('php://input'));

        // Validating fields
        $username_length = strlen($input->username);
        $email_length = strlen($input->email);
        $password_length = strlen($input->password);
        $isWrong =
            ($email_length < 4 || $email_length > 90) ||
            ($password_length < 8 || $password_length > 200) ||
            ($username_length < 4 || $username_length > 90);
        if ($isWrong)
            return $response->withStatus(HTTP_STATUS::BAD_REQUEST);

        // Adding user to db
        $db = new dbManager();
        $userId = $db->register($input->username, $input->email, $input->password);
        $token = $db->createToken($userId);

        $response->getBody()->write(json_encode([
            "message" => "Account successfully created!",
            "id" => $userId,
            "token" => $token
        ]));
        return $response
            ->withHeader('content-type', 'application/json')
            ->withStatus(HTTP_STATUS::CREATED);
    }

    public function login(Request $request, Response $response): Response
    {
        $input = json_decode(file_get_contents('php://input'));

        // Fields verification
        if (!self::verifyFields($request, ["email", "password"]))
            return $response
                ->withStatus(HTTP_STATUS::BAD_REQUEST);

        $db = new dbManager();

        // Checking credentials
        $result = $db->login($input->email, $input->password);
        if ($result === false)
        {
            // Wrong
            $response->getBody()->write(json_encode([
                "message" => "Wrong credentials given."
            ]));
            return $response
                ->withHeader('content-type', 'application/json')
                ->withStatus(HTTP_STATUS::UNAUTHORIZED);
        }
        // Valid
        $response->getBody()->write(json_encode([
            "token" => $result,
            "userid" => $db->getUserByToken($result)
        ]));
        return $response
            ->withHeader('content-type', 'application/json')
            ->withStatus(HTTP_STATUS::OK);
    }
}
