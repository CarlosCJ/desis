<?php

namespace App\Controllers;

use Database\Connection;

class RegionController {
    private $connection;

    public function __construct() {
        $this->connection = Connection::getInstance()->get_database_instance();
    }

    public function index() {

    }

    public function create() {

    }

    public function store($data) {
        try {
            $stmt = $this->connection->prepare("INSERT INTO regiones (nombre) VALUES (:nombre)");
            $stmt->bindParam(':nombre', $data);
            $stmt->execute();
        } catch (\PDOException $e) {
            echo "Error al ejecutar la consulta: " . $e->getMessage();
        }
    }
}