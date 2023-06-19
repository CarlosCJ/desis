<?php

namespace Database;

class Connection {

    private static $instance;
    private $connection;

    private function __construct() {
        $this->make_connection();
    }

    public static function getInstance() {
        if (!self::$instance instanceof self)
            self::$instance = new self();

        return self::$instance;
    }

    public function get_database_instance() {
        return $this->connection;
    }

    private function make_connection() {
        $server = "localhost";
        $database = "desis";
        $username = "root";
        $password = "";

        try {
            $conexion = new \PDO("mysql:host=$server;dbname=$database", $username, $password);
            $this->set_names($conexion);
            $this->connection = $conexion;
        } catch (\PDOException $e){
            echo "Falló la conexión: " . $e->getMessage();
        }
    }

    private function set_names($con) {
        $setnames = $con->prepare("SET NAMES 'utf8'");
        $setnames->execute();
    }
}