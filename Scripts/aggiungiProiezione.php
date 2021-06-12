<?php

include_once "config.php";

//Ricevo i dati dal body della richiesta in formato JSON

$rawdata = file_get_contents("php://input");
$rawdata = json_decode($rawdata, true);

$film = $rawdata['film'];
$sala = $rawdata['sala'];
$data = $rawdata['data'];

/*
$film = "Harry Potter";
$sala = 2;
$data = "2021-06-14T13:00";
*/

$tempo = $pdo->query("SELECT film.durata, film.id FROM film WHERE film.titolo = '$film'");
$tempo = $tempo->fetch(PDO::FETCH_ASSOC);
$durata = $tempo['durata'];

$occupate = $pdo->query("SELECT *
FROM (SELECT proiezione.dataOra, film.durata FROM proiezione, film WHERE proiezione.idFilm = film.id AND proiezione.idSala = '$sala' AND DAY('$data') = DAY(proiezione.dataOra)) as t
WHERE (t.dataOra<='$data' AND DATE_ADD(t.dataOra, INTERVAL t.durata minute) >= '$data')
OR ('$data' <= t.dataOra AND DATE_ADD('$data', INTERVAL '$durata' minute) >= t.dataOra);");

$occupate = $occupate->fetchAll(PDO::FETCH_ASSOC);
if ($occupate != null){
    echo json_encode("Errore");
} else {
    $sql = "INSERT INTO proiezione VALUES(null, :dataOra, :idFilm, :idSala)";
    $inserisci = $pdo->prepare($sql);
    $inserisci->execute(['dataOra' => $data, 'idFilm'=> $tempo['id'], 'idSala'=>$sala]);
    echo json_encode("Ok");
}