<?php
use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use Slim\Factory\AppFactory;

require __DIR__ . '/vendor/autoload.php';
require __DIR__ . "/connection.php";
//sopra non toccare poi cancella questo quando finito
//require i file delle classi
session_cache_limiter(false);
session_start();

$app = AppFactory::create();

$app->addBodyParsingMiddleware();

$app->get('/', function (Request $request, Response $response, $args) {
    $response->getBody()->write("Hello world!" . $_SESSION["username"]);
    return $response;
});

$app->post('/getFilm', function (Request $request, Response $response, $args) {
    $result = [];
    //$body = $request->getParsedBody();
    $sql = "SELECT * FROM film";
    $result = $conn->query($sql);
    
    //$result["usename"] = $body["username"];
    $response->getBody()->write(json_encode($result));

    

    return $response;
});

$app->run();




