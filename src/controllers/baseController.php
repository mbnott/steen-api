<?php

namespace Mbnot\SteenApi\controllers;
use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use Mbnot\SteenApi\models\dbManager;

class baseController
{
    /**
     * Verifies the authenticity of the request based on the token, if it was given
     * @param Request $request
     * @param dbManager $db
     * @return bool TRUE if the token is present and valid, FALSE otherwise
     */
    protected function verifyAuth(Request $request, dbManager $db) : bool
    {
        $tokenInput = $request->getHeader("Authorization");

        // Checking auth
        $isAuthorized = false;
        if (isset($tokenInput[0]))
        {
            // token present, now explode
            $exploded = explode(' ', $tokenInput[0]);
            if (isset($exploded[1]))
                return $db->checkToken($exploded[1]);
        }
        return false;
    }

    /**
     * Checks if the fields given are present in the request's JSON body
     * @param Request $request
     * @param array $fields
     * @return bool TRUE if all the fields are present, FALSE otherwise
     */
    protected function verifyFields(Request $request, array $fields) : bool
    {
        $input = json_decode(file_get_contents('php://input'));
        $missingFields = array_values(array_diff($fields, array_keys((array)$input)));
        return count($missingFields) == 0;
    }
}