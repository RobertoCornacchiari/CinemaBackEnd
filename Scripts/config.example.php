<?php

//Esempio di file di configurazione
//Creare un file config.php e inserire le seguenti righe
//adattandole alla propria configurazione

ini_set('display_errors', '1');
ini_set('log_errors', '0');

$host = 'your_host';
$db = 'your_db';
$user = 'your_username';
$pass = 'your_password';
$charset = 'utf8';

//Data Source Name
$dsn = "mysql:host=$host;dbname=$db;charset=$charset";

//Oggetto che rappresenta la connessione al database
$pdo = new PDO($dsn, $user, $pass);