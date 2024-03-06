<?php

class Database 
{
    private static $conn = null;

    public static function getDatabase() {
        if ($conn === null) {
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
        }

        return $conn;
    } 
}

