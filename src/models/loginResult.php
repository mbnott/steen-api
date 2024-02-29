<?php

namespace Mbnot\SteenApi\models;

class loginResult
{
    public int $err;
    /*
     * 0 = success
     * 1 = email not found
     * 2 = wrong password
     */
    public bool $success;

    public function __construct(int $err, bool $success) {
        $this->err = $err;
        $this->success = $success;
    }
}