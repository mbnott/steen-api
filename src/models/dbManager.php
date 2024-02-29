<?php

declare(strict_types=1);

namespace Mbnot\SteenApi\models;

use PDO;
use Mbnot\SteenApi\models\loginResult;

require "Constants.php";

class dbManager {

    private readonly PDO $db;

    public function __construct()
    {
        $dsn = 'mysql:host=' . DB_HOST . ';dbname=' . DB_NAME . ';charset=' . DB_CHARSET;
        $options = [
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
            PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
            PDO::ATTR_EMULATE_PREPARES => false,
        ];

        $db = new PDO($dsn, DB_USER, DB_PASSWORD, $options);
    }

    public function login($email, $password) : loginResult {
        $stmt = $this->db->prepare("SELECT * FROM Utilisateur WHERE email = :email");
        $stmt->execute(["email" => $email]);
        $data = $stmt->fetch();
        if ($data === false)
            return new loginResult(1, false);

        $passwordHash = password_hash($password, PASSWORD_BCRYPT);
        if ($passwordHash != $data["mdp"])
            return new loginResult(2, false);

        return new loginResult(0, true);
    }

    public function checkToken($userId, $token) : bool {
        $stmt = $this->db->prepare("SELECT * FROM token WHERE token = :token AND idUtilisateur = :userId");
        $stmt->execute(["token" => $token, "userId" => $userId]);
        return $stmt->fetchColumn();
    }

    public function createToken($userId) {
        $p = new OAuthProvider();

        $token = $p->generateToken(80);
        $stmt = $this->db->prepare("");
        // TODO
    }
}
