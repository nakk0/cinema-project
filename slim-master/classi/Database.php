<?php

class Database 
{
    private static $conn = null;

    public static function getDatabase() {
        if ($conn === null) {
            $conn = new mysqli("mariadb", "root", "", "cinema");
        }

        return $conn;
    } 
}

