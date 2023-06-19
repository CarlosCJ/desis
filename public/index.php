<?php

require "../vendor/autoload.php";

$page = $_GET["page"] ?? null;
$page = explode("/", $page);

$resource = $page[0] == "" ? "/" : $page[0];

switch ($resource){
    case "/":
        echo "Estas en el home";
        break;

    case "region":
        echo "Estas en la page de Region";
        break;

    case "comuna":
        echo "Estas en la page de comunas";
        break;

    case "candidato":
        echo "Estas en la pagina de candidatos";
        break;

    default:
        echo "404 Not Found";
        break;
}