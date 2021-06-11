<?php

include_once "config.php";

$stmt = $pdo->query("SELECT film.titolo FROM film");

$result = $stmt->fetchAll(PDO::FETCH_ASSOC);

echo json_encode($result);