<?php

include_once "config.php";

//Ricevo i dati dal body della richiesta in formato JSON

$rawdata = file_get_contents("php://input");
$rawdata = json_decode($rawdata, true);

$titolo = $rawdata['titolo'];
$durata = $rawdata['durata'];
$regista = $rawdata['regista'];

$sql = "INSERT INTO film VALUES(null, :titolo, :durata, :regista)";
$inserisci = $pdo->prepare($sql);
$inserisci->execute(['titolo' => $titolo, 'durata'=> $durata, 'regista'=>$regista]);
echo json_encode("Ok");