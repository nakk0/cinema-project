<?php
$host = "mariadb";
$username = "root";
$password = "";
$dbname = "cinema";

$connection_string = $_ENV["MYSQL_PRIVATE_URL"];

if (isset($connection_string)) {
  $pattern = "/mysql:\/\/([^:]+):([^@]+)@([^:\/]+):(\d+)\/(.+)/";
  preg_match($pattern, $connection_string, $matches);

  $username = $matches[1];
  $password = $matches[2];
  $host = $matches[3] . ":" . $matches[4];
  $dbname = $matches[5];
}

$conn = new mysqli($host, $username, $password, $dbname);

// Verifica la connessione
if ($conn->connect_error) {
  die("Connessione al database fallita: " . $conn->connect_error);
}

?>