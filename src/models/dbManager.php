<?php

declare(strict_types=1);

namespace Mbnot\SteenApi\models;

use PDO;
use Mbnot\SteenApi\models\loginResult;

require "Constants.php";

class dbManager {

    private readonly PDO $db;
    private const USER_ID = 1;
    private const ADMIN_ID = 2;

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

    public function login($email, $password) : loginResult {
        $stmt = $this->db->prepare("SELECT * FROM Utilisateur WHERE email = :email");
        $stmt->execute(["email" => $email]);
        $data = $stmt->fetch();
        if ($data === false)
            return new loginResult(1, false);

        if (!password_verify($password, $data["mdp"]))
            return new loginResult(2, false);

        return new loginResult(0, true);
    }

    public function register($nom, $email, $mdp) : string|false
    {
        $stmt = $this->db->prepare("INSERT INTO utilisateur (nom, email, mdp, idRole) VALUES (:nom, :email, :mdp, :roleId)");
        $stmt->execute(["nom" => $nom, "email" => $email, "mdp" => password_hash($mdp, PASSWORD_BCRYPT), "roleId" => self::USER_ID]);
        return $this->db->lastInsertId();
    }

    public function checkToken($userId, $token) : bool {
        $stmt = $this->db->prepare("SELECT token FROM token WHERE token = :token AND idUtilisateur = :userId");
        $stmt->execute(["token" => $token, "userId" => $userId]);
        return count($stmt->fetch()) > 0;
    }

    public function createToken($userId) : string
    {
        $token = bin2hex(random_bytes(16));
        $stmt = $this->db->prepare("INSERT INTO token (token, idUtilisateur) VALUES (:token, :userId)");
        $stmt->execute(["token" => $token, "userId" => $userId]);
        return $token;
    }

    public function getGames() : array
    {
        $stmt = $this->db->prepare("SELECT * FROM getGames");
        $stmt->execute();
        return $stmt->fetchAll();
    }

    public function getGame() : array
    {
        $stmt = $this->db->prepare("SELECT * FROM getGames");
        $stmt->execute();
        return $stmt->fetch();
    }

    public function addGame($nom, $dateSortie, $description, $idDeveloppeur) : string|false
    {
        $stmt = $this->db->prepare("INSERT INTO jeu (nom, dateSortie, description, idDeveloppeur) VALUES (:nom, :dateSortie, :description, :idDeveloppeur)");
        $stmt->execute(["nom" => $nom, "dateSortie" => $dateSortie, "description" => $description, "idDeveloppeur" => $idDeveloppeur]);
        return $this->db->lastInsertId();
    }

    public function deleteGame($gameId) : array
    {
        $stmt = $this->db->prepare("DELETE FROM jeu WHERE id = $gameId");
        $stmt->execute();
        return $stmt;
    }

    public  function getTags() : array
    {
        $stmt = $this->db->prepare("SELECT * FROM getTag");
        $stmt->execute();
        return $stmt->fetchAll();
    }
}
