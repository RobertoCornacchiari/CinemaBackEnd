<?php

include_once "config.php";

$recapito = $_GET['recapito'];

$stmt = $pdo->query("SELECT spettatore.numeroDiTelefono, film.titolo, proiezione.dataOra FROM assistea, spettatore, proiezione, film WHERE assistea.idSpettatore = spettatore.id AND assistea.idProiezione = proiezione.id AND proiezione.idFilm = film.id
AND assistea.verificato = true                                                                                                            
AND assistea.idProiezione IN (SELECT assistea.idProiezione FROM assistea, spettatore WHERE assistea.idSpettatore = spettatore.id AND spettatore.numeroDiTelefono = '$recapito' AND assistea.verificato = 1)
ORDER BY proiezione.dataOra DESC, spettatore.numeroDiTelefono");

$result = $stmt->fetchAll(PDO::FETCH_ASSOC);
if ($result == null)
    echo json_encode("Errore");
else
    echo json_encode($result);