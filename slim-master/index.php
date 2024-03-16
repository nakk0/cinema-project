<?php
use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use Slim\Factory\AppFactory;

require __DIR__ . '/vendor/autoload.php';
require __DIR__ . "/classi/Database.php";
require __DIR__ . "/classi/Movie.php";
require __DIR__ . "/classi/Actor.php";
require __DIR__ . "/classi/Genre.php";
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

    $body = json_decode($request->getBody(), true); // Decodifica il JSON nel corpo della richiesta
    $id = $body["id"] ?? null; // Ottiene il valore "id" dal JSON

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

    $body = json_decode($request->getBody(), true);

    if (isset($body["id"])) {
        $id = $body["id"];

        $query = "SELECT AVG(rating) as av
                    FROM reviews
                    WHERE movie_id = ?";

        $stmt = $conn->prepare($query);

        $stmt->bind_param("i", $id);

        $stmt->execute();

        $result = $stmt->get_result();

        if ($result) {
            if ($result->num_rows > 0) {
                $row = $result->fetch_assoc();
                $return = $row["av"];
            } else {
                $return["error"] = "Il film non ha recensioni";
            }
        } else {
            $return["error"] = "Errore nella query: " . $conn->error;
        }

        $stmt->close();
    } else {
        $return["error"] = "Il campo 'id' non è presente nel corpo della richiesta";
    }

    $conn->close();

    $response->getBody()->write(json_encode($return));

    return $response;
});







$app->get('/getMovieByGenre', function (Request $request, Response $response, $args) {
    $return = [];
    $conn = Database::getDatabase();

    $body = json_decode($request->getBody(), true); // Decodifica il JSON nel corpo della richiesta
    $id = $body["id"] ?? null; // Ottiene il valore "id" dal JSON

    $query = "SELECT * FROM `movies` JOIN genres_movies ON genres_movies.movie_id = movies.id WHERE genres_movies.genre_id = $id;";
    $result = $conn->query($query);

    if ($result->num_rows == 0) {
        $return["error"] = "nessun film con il genere " .  $id;
    } else {
        while ($row = $result->fetch_assoc()) {
            $temp = new Movie($row["id"], $row["title"], $row["release_date"], $row["original_language"], $row["description"], $row["director"], $row["poster"], $row["lenght"]);
            $return[] = $temp->toArray();
        }
    
    }

    // Chiudi la connessione al database quando hai finito
    $conn->close();

    $response->getBody()->write(json_encode($return));

    return $response;
});








// /getGenreByMovie
// Idmovie number
// json di oggetti Genre


$app->get('/getGenreByMovie', function (Request $request, Response $response, $args) {
    $return = [];
    $conn = Database::getDatabase();

    $body = json_decode($request->getBody(), true); // Decodifica il JSON nel corpo della richiesta
    $id = $body["id"] ?? null; // Ottiene il valore "id" dal JSON

    $query = "SELECT * FROM `genres` JOIN genres_movies ON genres_movies.genre_id = genres.id WHERE genres_movies.movie_id = $id;";
    $result = $conn->query($query);

    if ($result->num_rows == 0) {
        $return["error"] = "nessun film con il genere " .  $id;
    } else {
        while ($row = $result->fetch_assoc()) {
            $temp = new Genre($row["id"], $row["name"]);
            $return[] = $temp->toArray();
        }
    
    }

    // Chiudi la connessione al database quando hai finito
    $conn->close();

    $response->getBody()->write(json_encode($return));

    return $response;
});






$app->run();




