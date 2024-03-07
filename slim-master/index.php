<?php
use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use Slim\Factory\AppFactory;

require __DIR__ . '/vendor/autoload.php';
require __DIR__ . "/classi/Database.php";
require __DIR__ . "/classi/Movie.php";
require __DIR__ . "/classi/Actor.php";
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
    $conn = Database::getDatabase();

    $query = "SELECT movies.*, languages.name AS original_language_name, directors.name AS director_name
          FROM movies
          LEFT JOIN languages ON movies.original_language = languages.id
          LEFT JOIN directors ON movies.director = directors.id";
    $result = $conn->query($query);

    $movies = [];

    while ($row = $result->fetch_assoc()) {
        $temp = new Movie($row["id"], $row["title"], $row["release_date"], $row["original_language_name"], $row["description"], $row["director_name"], $row["poster"]);
        $return[] = $temp->toArray();
    }

    // Chiudi la connessione al database quando hai finito
    $conn->close();

    $response->getBody()->write(json_encode($return));

    return $response;
});








$app->get('/getActorsByMovie', function (Request $request, Response $response, $args) {
    $return = [];
    $conn = Database::getDatabase();

    $body = $request->getQueryParams();
    $id = $body["id"];

    $query = "SELECT actors.*
                FROM actors
                JOIN actors_movies ON actors_movies.actor_id = actors.id
                WHERE movie_id = $id";
    $result = $conn->query($query);

    if ($result->num_rows == 0) {
        $return["error"] = "nessun attore trovato, id film : " . $id ;
    } else {
        while ($row = $result->fetch_assoc()) {
            $temp = new Actor($row["id"], $row["name"], $row["surname"], $row["birthday"], $row["nationality"], $row["photo"]);
            $return[] = $temp->toArray();
        }
    
    }

    // Chiudi la connessione al database quando hai finito
    $conn->close();

    $response->getBody()->write(json_encode($return));

    return $response;
});








$app->get('/getReviewAverageByMovie', function (Request $request, Response $response, $args) {
    $return = [];
    $conn = Database::getDatabase();

    $body = $request->getQueryParams();
    $id = $body["id"];

    $query = "SELECT reviews.*
                FROM reviews
                WHERE movie_id = $id";
    $result = $conn->query($query);

    if ($result->num_rows == 0) {
        $return["error"] = "nessun attore trovato, id film : " . $id ;
    } else {
        while ($row = $result->fetch_assoc()) {
            //passa anche i dati dell account che ha fatto la review
            $temp = new Review($row["id"], $row["rating"], $row["movie_id"], $row["account_id"], $row["content"]);
            $return[] = $temp->toArray();
        }
    
    }

    // Chiudi la connessione al database quando hai finito
    $conn->close();

    $response->getBody()->write(json_encode($return));

    return $response;
});


$app->run();




