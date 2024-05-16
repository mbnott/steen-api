<?php

/*
 * Auteurs:     ***REMOVED***, ***REMOVED***
 * Classe:      ***REMOVED***
 * Projet:      Steen
 */

declare(strict_types=1);

namespace Mbnot\SteenApi\models;

class review {

    public int $id;
    public int $note;
    public string $datePost;
    public string $description;
    public int $idUtilisateur;
    public string $pseudo;
    public int $idJeu;
    public string $jeu;

    public function __construct($id, $note, $datePost, $description, $idUtilisateur, $pseudo, $idJeu, $jeu)
    {
        $this->id = $id;
        $this->note = $note;
        $this->datePost = $datePost;
        $this->description = $description;
        $this->idUtilisateur = $idUtilisateur;
        $this->pseudo = $pseudo;
        $this->idJeu = $idJeu;
        $this->jeu = $jeu;
    }
}