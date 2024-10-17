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
        $stmt = $this->db->prepare("SELECT * FROM user WHERE email = :email");
        $stmt->execute(["email" => $email]);
        $data = $stmt->fetch();
        if ($data === false)
            return false;
        if (!password_verify($password, $data["password"]))
            return false;
        return $this->createToken($data["id"]);
    }

    // ***REMOVED***
    public function register($name, $email, $password) : string|false
    {
        $stmt = $this->db->prepare("INSERT INTO user (name, email, password, idRole) VALUES (:name, :email, :password, :roleId)");
        $stmt->execute(["name" => $name, "email" => $email, "password" => @password_hash($password, PASSWORD_BCRYPT), "roleId" => self::USER_ID]);
        return $this->db->lastInsertId();
    }

    // ***REMOVED***
    public function getUser($id) : array|false
    {
        $stmt = $this->db->prepare("SELECT * FROM user WHERE id = :id");
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
        $stmt = $this->db->prepare("SELECT idUser FROM token WHERE token = :token");
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
        $stmt = $this->db->prepare("INSERT INTO token (token, idUser) VALUES (:token, :userId)");
        $stmt->execute(["token" => $token, "userId" => $userId]);
        return $token;
    }

    // ***REMOVED***
    public function getApps() : array
    {
        $stmt = $this->db->prepare("SELECT * FROM getApps");
        $stmt->execute();
        return $stmt->fetchAll();
    }

    // ***REMOVED***, ***REMOVED***
    public function getApp($id) : array|false
    {
        $stmt = $this->db->prepare("SELECT * FROM getApps WHERE id = :id");
        $stmt->execute(["id" => $id]);
        return $stmt->fetch() ?? false;
    }

    // ***REMOVED***
    public function addApp($name, $releaseDate, $description, $idDev) : string|false
    {
        $stmt = $this->db->prepare("INSERT INTO app (name, releaseDate, description, idDev) VALUES (:name, :releaseDate, :description, :idDev)");
        $stmt->execute(["name" => $name, "releaseDate" => $releaseDate, "description" => $description, "idDev" => $idDev]);
        return $this->db->lastInsertId();
    }

    // ***REMOVED***
    public function deleteApp($gameId) : bool
    {
        $stmt = $this->db->prepare("DELETE FROM app WHERE id = $gameId");
        return $stmt->execute();
    }

    // ***REMOVED***
    public function getReviews($idApp) : array|false
    {
        $stmtApp = $this->getApp($idApp);
        if ($stmtApp === false)
            return false;
        $stmt = $this->db->prepare("SELECT * FROM getReviews WHERE idApp = :idApp");
        $stmt->execute(["idApp" => $idApp]);
        return $stmt->fetchAll();
    }

    // ***REMOVED***
    public function addReview($note, $description, $idUser, $idApp)
    {
        $stmt = $this->db->prepare("INSERT INTO review (note, description, idUser, idApp) VALUES (:note, :description, :idUser, :idApp)");
        $stmt->execute(["note" => $note, "description" => $description, "idUser" => $idUser, "idApp" => $idApp]);
        return $this->db->lastInsertId();
    }

    // ***REMOVED***
    public function deleteReview($reviewId) : bool
    {
        $stmt = $this->db->prepare("DELETE FROM review WHERE id = $reviewId");
        return $stmt->execute();
    }

    /*public  function getTags() : array
    {
        $stmt = $this->db->prepare("SELECT * FROM getTag");
        $stmt->execute();
        return $stmt->fetchAll();
    }*/
}
