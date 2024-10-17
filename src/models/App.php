<?php

declare(strict_types=1);

namespace Mbnot\SteenApi\models;

class App {

    public int $id;
    public string $nom;
    public string $dateSortie;
    public string $description;
    public string $pseudo;
    public ?float $note;

    public function __construct($id, $nom, $dateSortie, $description, $pseudo, $note = null)
    {
        $this->id = $id;
        $this->nom = $nom;
        $this->dateSortie = $dateSortie;
        $this->description = $description;
        $this->pseudo = $pseudo;
        $this->note = $note;
    }
}
