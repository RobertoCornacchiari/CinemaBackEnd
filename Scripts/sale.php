<?php

include_once "config.php";

$stmt = $pdo->query("SELECT sala.id, sala.postiDisponibili FROM sala");

$result = $stmt->fetchAll(PDO::FETCH_ASSOC);

echo json_encode($result);