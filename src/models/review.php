<?php

declare(strict_types=1);

namespace Mbnot\SteenApi\models;

class review {

    public int $id;
    public int $note;
    public string $datePost;
    public string $decsription;
    public int $idUtilisateur;
    public int $idJeu;

    public function __construct($id, $note, $datePost, $description, $idUtilisateur, $idJeu)
    {
        $this->id = $id;
        $this->note = $note;
        $this->datePost = $datePost;
        $this->decsription = $description;
        $this->idUtilisateur = $idUtilisateur;
        $this->idJeu = $idJeu;
    }
}