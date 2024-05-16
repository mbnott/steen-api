<?php

/*
 * Auteurs:     ***REMOVED***
 * Classe:      ***REMOVED***
 * Projet:      Steen
 */

namespace Mbnot\SteenApi\models;

enum HTTP_STATUS : int {
    const OK = 200;
    const CREATED = 201;
    const BAD_REQUEST = 400;
    const UNAUTHORIZED = 401;
    const FORBIDDEN = 403;
    const NOT_FOUND = 404;
    const METHOD_NOT_ALLOWED = 405;
    const INTERNAL_SERVER_ERROR = 500;
    const NOT_YET_IMPLEMENTED = 501;
}
