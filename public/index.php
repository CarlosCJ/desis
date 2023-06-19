<?php

require "../vendor/autoload.php";

use Router\RouterHandler;
use App\Controllers\RegionController;
use App\Controllers\ComunaController;
use App\Controllers\CandidatoController;
use App\Controllers\VotarController;

$page = $_GET["page"] ?? null;
$page = explode("/", $page);

$resource = $page[0] == "" ? "/" : $page[0];
$id = $page[1] ?? null;

$router = new RouterHandler();

switch ($resource){
    case "/":
        $method = $_POST["method"] ?? "get";
        $router->set_method($method);
        $router->set_data($_POST);
        $router->route(VotarController::class, $id);
        break;

    case "region":

        $method = $_POST["method"] ?? "get";
        $router->set_method($method);
        $router->set_data($_POST);
        $router->route(RegionController::class, $id);
        break;

    case "comuna":
        $method = $_POST["method"] ?? "get";
        $router->set_method($method);
        $router->set_data($_POST);
        $router->route(ComunaController::class, $id);
        break;

    case "candidato":
        $method = $_POST["method"] ?? "get";
        $router->set_method($method);
        $router->set_data($_POST);
        $router->route(CandidatoController::class, $id);
        break;

    default:
        echo "404 Not Found";
        break;
}