<?php

namespace App\Controllers;

use Database\Connection;

class VotarController{
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
