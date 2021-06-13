<?php

include_once "config.php";

$stmt = $pdo->query("SELECT proiezione.id, proiezione.dataOra, proiezione.idSala, film.titolo FROM proiezione, film WHERE proiezione.idFilm = film.id AND DATE_ADD(now(), INTERVAL -10 minute ) < proiezione.dataOra AND DAY(now()) = DAY(proiezione.dataOra)");

$result = $stmt->fetchAll(PDO::FETCH_ASSOC);

echo json_encode($result);