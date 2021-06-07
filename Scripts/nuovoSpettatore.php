<?php

include_once "config.php";

//Ricevo i dati dal body della richiesta in formato JSON

$rawdata = file_get_contents("php://input");
$rawdata = json_decode($rawdata, true);

$recapito = $rawdata['recapito'];
$quanti = $rawdata['quanti'];
$proiezione = $rawdata['proiezione'];

$stmt = $pdo->query("SELECT (sala.postiDisponibili - t.occupati) as posti, sala.postiDisponibili
FROM sala, proiezione, (
        SELECT SUM(assistea.quanti) as occupati
        FROM proiezione, assistea
        WHERE assistea.idProiezione = proiezione.id
        AND assistea.verificato = true
        AND proiezione.id = '$proiezione'
    ) as t
WHERE sala.id = proiezione.idSala 
AND proiezione.id = '$proiezione'");

$stmt = $stmt->fetch(PDO::FETCH_ASSOC);
if ($stmt['posti'] == null){
    $stmt['posti'] = $stmt['postiDisponibili'];
}


if ($stmt['posti'] < $quanti){
    echo json_encode("Posti esauriti");
    exit(0);
}

$check = $pdo->query("SELECT spettatore.id
FROM spettatore
WHERE spettatore.numeroDiTelefono = '$recapito'");
$check = $check->fetch(PDO::FETCH_ASSOC);

if ($check == null) {
    $sql = "INSERT INTO spettatore VALUES(null, :recapito)";
    $inserisci = $pdo->prepare($sql);
    $inserisci->execute(['recapito' => $recapito]);
}
$prepare = "INSERT INTO assistea VALUES(null, :codiceConferma, :quanti, :verificato, :idProiezione, :idSpettatore)";
$esegui = $pdo->prepare($prepare);

$id = $pdo->query("SELECT id FROM spettatore WHERE spettatore.numeroDiTelefono = '$recapito'");
$id = $id->fetch(PDO::FETCH_ASSOC);
$id = $id['id'];

function generateRandomString($length = 6) {
    return substr(str_shuffle(str_repeat($x='0123456789', ceil($length/strlen($x)) )),1,$length);
}

$codice = generateRandomString();

$esegui->execute(['codiceConferma'=>$codice, 'quanti'=>$quanti, 'verificato'=>false, 'idProiezione'=>$proiezione, 'idSpettatore'=>$id]);

echo json_encode($codice);
