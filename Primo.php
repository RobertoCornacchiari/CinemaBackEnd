<?php

include_once "config.php";

//Ricevo i dati dal body della richiesta in formato JSON
$rawdata = file_get_contents("php://input");
$rawdata = json_decode($rawdata, true);