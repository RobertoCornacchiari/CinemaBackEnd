<?php

include_once "config.php";

$stmt = $pdo->query("SELECT proiezione.id, proiezione.dataOra, proiezione.idSala, film.titolo FROM proiezione, film WHERE proiezione.idFilm = film.id ORDER BY film.titolo, proiezione.dataOra");

$result = $stmt->fetchAll(PDO::FETCH_ASSOC);

echo json_encode($result);