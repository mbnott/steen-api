<?php

declare(strict_types=1);

namespace Mbnot\SteenApi\models;

use PDO;

require "Constants.php";

class dbManager {

    private readonly PDO $db;
    public const USER_ID = 1;
    public const ADMIN_ID = 2;

    // ***REMOVED***
    public function __construct()
    {
        $dsn = 'mysql:host=' . DB_HOST . ';dbname=' . DB_NAME . ';charset=' . DB_CHARSET;
        $options = [
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
            PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
            PDO::ATTR_EMULATE_PREPARES => false,
        ];

        $this->db = new PDO($dsn, DB_USER, DB_PASSWORD, $options);
    }

    // ***REMOVED***
    public function login($email, $password) : string|false {
        $stmt = $this->db->prepare("SELECT * FROM utilisateur WHERE email = :email");
        $stmt->execute(["email" => $email]);
        $data = $stmt->fetch();
        if ($data === false)
            return false;
        if (!password_verify($password, $data["mdp"]))
            return false;
        return $this->createToken($data["id"]);
    }

    // ***REMOVED***
    public function register($nom, $email, $mdp) : string|false
    {
        $stmt = $this->db->prepare("INSERT INTO utilisateur (nom, email, mdp, idRole) VALUES (:nom, :email, :mdp, :roleId)");
        $stmt->execute(["nom" => $nom, "email" => $email, "mdp" => @password_hash($mdp, PASSWORD_BCRYPT), "roleId" => self::USER_ID]);
        return $this->db->lastInsertId();
    }

    // ***REMOVED***
    public function getUser($id) : array|false
    {
        $stmt = $this->db->prepare("SELECT * FROM utilisateur WHERE id = :id");
        $stmt->execute(["id" => $id]);
        $data = $stmt->fetch();
        if ($data === false)
            return false;
        return $data;
    }

    /**
     * Gets a user based on their token
     * @param $token
     * @return int|false INT if the token is valid and a user was found, false otherwise
     */
    // ***REMOVED***
    public function getUserByToken($token) : int|false
    {
        $stmt = $this->db->prepare("SELECT idUtilisateur FROM token WHERE token = :token");
        $stmt->execute(["token" => $token]);
        $data = $stmt->fetchColumn();
        if ($data === false)
            return false;
        return $data;
    }

    // ***REMOVED***
    public function checkToken($token) : bool {
        $stmt = $this->db->prepare("SELECT token FROM token WHERE token = :token");
        $stmt->execute(["token" => $token]);
        return $stmt->fetchColumn() === $token;
    }

    // ***REMOVED***
    public function createToken($userId) : string
    {
        $token = bin2hex(random_bytes(100));
        $stmt = $this->db->prepare("INSERT INTO token (token, idUtilisateur) VALUES (:token, :userId)");
        $stmt->execute(["token" => $token, "userId" => $userId]);
        return $token;
    }

    // ***REMOVED***
    public function getGames() : array
    {
        $stmt = $this->db->prepare("SELECT * FROM getGames");
        $stmt->execute();
        return $stmt->fetchAll();
    }

    // ***REMOVED***, ***REMOVED***
    public function getGame($id) : array|false
    {
        $stmt = $this->db->prepare("SELECT * FROM getGames WHERE id = :id");
        $stmt->execute(["id" => $id]);
        return $stmt->fetch() ?? false;
    }

    // ***REMOVED***
    public function addGame($nom, $dateSortie, $description, $idDeveloppeur) : string|false
    {
        $stmt = $this->db->prepare("INSERT INTO jeu (nom, dateSortie, description, idDeveloppeur) VALUES (:nom, :dateSortie, :description, :idDeveloppeur)");
        $stmt->execute(["nom" => $nom, "dateSortie" => $dateSortie, "description" => $description, "idDeveloppeur" => $idDeveloppeur]);
        return $this->db->lastInsertId();
    }

    // ***REMOVED***
    public function deleteGame($gameId) : bool
    {
        $stmt = $this->db->prepare("DELETE FROM jeu WHERE id = $gameId");
        return $stmt->execute();
    }

    // ***REMOVED***
    public function getReviews($idJeu) : array|false
    {
        $stmtGame = $this->getGame($idJeu);
        if ($stmtGame === false)
            return false;
        $stmt = $this->db->prepare("SELECT * FROM getReviews WHERE idJeu = :idJeu");
        $stmt->execute(["idJeu" => $idJeu]);
        return $stmt->fetchAll();
    }

    // ***REMOVED***
    public function addReview($note, $description, $idUtilisateur, $idJeu)
    {
        $stmt = $this->db->prepare("INSERT INTO evaluation (note, description, idUtilisateur, idJeu) VALUES (:note, :description, :idUtilisateur, :idJeu)");
        $stmt->execute(["note" => $note, "description" => $description, "idUtilisateur" => $idUtilisateur, "idJeu" => $idJeu]);
        return $this->db->lastInsertId();
    }

    // ***REMOVED***
    public function deleteReview($evaluationId) : bool
    {
        $stmt = $this->db->prepare("DELETE FROM evaluation WHERE id = $evaluationId");
        return $stmt->execute();
    }

    /*public  function getTags() : array
    {
        $stmt = $this->db->prepare("SELECT * FROM getTag");
        $stmt->execute();
        return $stmt->fetchAll();
    }*/
}
