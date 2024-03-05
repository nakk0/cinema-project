<?php
use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use Slim\Factory\AppFactory;

require __DIR__ . '/vendor/autoload.php';
require __DIR__ . "/connection.php";
require __DIR__ . "/classi/Database.php";
require __DIR__ . "/classi/Movie.php";

//sopra non toccare poi cancella questo quando finito
//require i file delle classi
session_cache_limiter(false);
session_start();

$app = AppFactory::create();

$app->addBodyParsingMiddleware();

$app->get('/', function (Request $request, Response $response, $args) {
    $response->getBody()->write("This is the API, how did you get here??");
    return $response;
});

$app->get('/getMovies', function (Request $request, Response $response, $args) {
    $return = [];
    $conn = new Database();
    $conn->getDatabase();

    $conn = new mysqli("mariadb", "root", "", "cinema");

    
    
    

    $query = "SELECT movies.*, languages.name AS original_language_name, directors.name AS director_name
          FROM movies
          LEFT JOIN languages ON movies.original_language = languages.id
          LEFT JOIN directors ON movies.director = directors.id";
$result = $conn->query($query);

$movies = [];

if ($result->num_rows == 0) {
    $return["error"] = true;
} else {
    while ($row = $result->fetch_assoc()) {
        $temp = new Movie($row["id"], $row["title"], $row["release_date"], $row["original_language_name"], $row["description"], $row["director_name"], $row["poster"]);
        $return[] = $temp->toArray();
    }
    
}


    // Chiudi la connessione al database quando hai finito
    $conn->close();

    $response->getBody()->write(json_encode($return));

    return $response;
});


$app->run();




