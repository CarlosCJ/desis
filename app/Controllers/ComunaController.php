<?php

namespace App\Controllers;

use Database\Connection;
class ComunaController {
    private $connection;

    public function __construct() {
        $this->connection = Connection::getInstance()->get_database_instance();
    }

    public function index() {
        $regionId = $_POST['region'];
        $stmt = $this->connection->prepare("SELECT idcomunas, nombre FROM comunas WHERE regiones_idRegion = :regionId ORDER BY nombre ASC");
        $stmt->bindParam(':regionId', $regionId);
        $stmt->execute();
        $results = $stmt->fetchAll();
        $mappedResults = array_map(function ($row) {
            return [
                'id' => $row['idcomunas'],
                'nombre' => $row['nombre']
            ];
        }, $results);
        header('Content-Type: application/json');
        echo json_encode($mappedResults);
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