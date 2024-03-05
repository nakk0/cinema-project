<?php
$servername = "mariadb";
$username = "root";
$password = "";
$dbname = "cinema";

$conn = new mysqli($servername, $username, $password, $dbname);

// Verifica la connessione
if ($conn->connect_error) {
  die("Connessione al database fallita: " . $conn->connect_error);
}

?>