<?php

namespace App\Controllers;

use Database\Connection;
class ComunaController {
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
            $stmt = $this->connection->prepare("INSERT INTO comunas (nombre, regiones_idRegion) VALUES (:nombre, :region_id)");
            $stmt->bindParam(':nombre', $data['nombre']);
            $stmt->bindParam(':region_id', $data['region_id']);
            $stmt->execute();
        } catch (\PDOException $e) {
            echo "Error al ejecutar la consulta: " . $e->getMessage();
        }
    }
}