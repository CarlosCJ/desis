<?php

namespace App\Controllers;

use Database\Connection;

class RegionController {
    private $connection;

    public function __construct() {
        $this->connection = Connection::getInstance()->get_database_instance();
    }

    public function index() {
        $stmt = $this->connection->prepare("SELECT * FROM regiones");
        $stmt->execute();
        $results = $stmt->fetchAll();
        require "../resources/views/region/index.php";
    }

    public function create() {
        require("../resources/views/region/create.php");
    }

    public function store($data) {
        try {
            $stmt = $this->connection->prepare("INSERT INTO regiones (nombre) VALUES (:nombre)");
            $stmt->bindParam(':nombre', $data['nombre']);
            $stmt->execute();
        } catch (\PDOException $e) {
            echo "Error al ejecutar la consulta: " . $e->getMessage();
        }
    }
}