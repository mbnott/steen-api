<?php

/*
 * Auteurs:     ***REMOVED***
 * Classe:      ***REMOVED***
 * Projet:      Steen
 */

declare(strict_types=1);

namespace Mbnot\SteenApi\models;

class tag {

    public int $id;
    public string $nom;

    public function __construct($id, $nom)
    {
        $this->id = $id;
        $this->nom = $nom;
    }
}