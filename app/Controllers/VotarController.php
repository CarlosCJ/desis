<?php

namespace App\Controllers;

use Database\Connection;

class VotarController{
    private $connection;

    public function __construct() {
        $this->connection = Connection::getInstance()->get_database_instance();
    }

    public function index() {
        $votoRun = $_POST['run'];
        $stmt = $this->connection->prepare("SELECT run FROM votaciones WHERE run = :run");
        $stmt->bindParam(':run', $votoRun);
        $stmt->execute();
        $results = $stmt->fetch();
        header('Content-Type: application/json');
        echo json_encode($results);
    }

    public function create() {
        $stmt = $this->connection->prepare("SELECT * FROM regiones");
        $stmt->execute();
        $resultsRegions = $stmt->fetchAll();

        $stmt = $this->connection->prepare("SELECT * FROM candidatos");
        $stmt->execute();
        $resultsCandidatos = $stmt->fetchAll();

        require("../resources/views/votar/create.php");
    }

    public function store($data) {
        try {
            $stmt = $this->connection->prepare("INSERT INTO votaciones 
            (nombre_completo, alias, email, run, web, tv, rrss, amigo, candidatos_idcandidato, comunas_idcomunas) 
            VALUES 
            (:nombre_completo, :alias, :email, :run, :web, :tv, :rrss, :amigo, :candidato, :comuna)");
            $stmt->bindParam(':nombre_completo', $data['nombre_completo']);
            $stmt->bindParam(':alias', $data['alias']);
            $stmt->bindParam(':email', $data['email']);
            $stmt->bindParam(':run', $data['run']);
            $stmt->bindParam(':web', $data['web']);
            $stmt->bindParam(':tv', $data['tv']);
            $stmt->bindParam(':rrss', $data['rrss']);
            $stmt->bindParam(':amigo', $data['amigo']);
            $stmt->bindParam(':candidato', $data['candidato']);
            $stmt->bindParam(':comuna', $data['comuna']);
            $stmt->execute();
        } catch (\PDOException $e){
            echo "Error al ejecutar la consulta: " . $e->getMessage();
        }
    }

}
