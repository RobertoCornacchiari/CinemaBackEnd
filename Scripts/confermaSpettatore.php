<?php

include_once "config.php";

//Ricevo i dati dal body della richiesta in formato JSON

$rawdata = file_get_contents("php://input");
$rawdata = json_decode($rawdata, true);

$recapito = $rawdata['recapito'];
$quanti = $rawdata['quanti'];
$proiezione = $rawdata['proiezione'];

$stmt = $pdo->prepare("UPDATE assistea SET verificato = true
WHERE assistea.id = (SELECT assistea.id
                     FROM assistea, proiezione, spettatore
                     WHERE assistea.idSpettatore = spettatore.id
AND assistea.idProiezione = proiezione.id
AND assistea.quanti = :quanti
AND spettatore.numeroDiTelefono = :recapito
AND proiezione.id = :proiezione)");
$stmt->execute(["quanti"=>$quanti, "recapito"=>$recapito, "proiezione"=>$proiezione]);
echo json_encode("Ok");