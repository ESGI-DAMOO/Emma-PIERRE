<?php

namespace App\Routing;

use App\Routing\Attribute\Route;
use App\Utils\Filesystem;
use Psr\Container\ContainerInterface;
use ReflectionClass;
use ReflectionException;
use ReflectionMethod;

class Router
{
  private const CONTROLLERS_GLOB_PATH = __DIR__ . "/../Controller/*Controller.php";

  public function __construct(
    private ContainerInterface $container
  ) {
  }

  private array $routes = [];

  public function addRoute(
    string $name,
    string $url,
    string $httpMethod,
    string $controllerClass,
    string $controllerMethod,
    array $params = []
  ) {
    $this->routes[] = [
      'name' => $name,
      'url' => $url,
      'http_method' => $httpMethod,
      'controller' => $controllerClass,
      'method' => $controllerMethod,
      'params' => $params
    ];
  }
  public function getRoute(string $uri, string $httpMethod): ?array
  {
    foreach ($this->routes as $route) {
      $routeUrl = $route['url'];
      $routeParams = $route['params'];

      // Convertir les paramètres de la route en expressions régulières
      $routeUrl = preg_replace('/{(\w+)}/', '(?<$1>[^/]+)', $routeUrl);
      $routeUrl = str_replace('/', '\/', $routeUrl);

      // Vérifier si l'URI correspond à la route
      $pattern = "/^{$routeUrl}$/";
      if (preg_match($pattern, $uri, $matches) && $route['http_method'] === $httpMethod) {
        // Récupérer les valeurs des paramètres de la route
        $params = [];
        foreach ($routeParams as $param) {
          $params[$param] = $matches[$param];
        }

        // Ajouter les paramètres à la route et la renvoyer
        $route['params'] = $params;
        return $route;
      }
    }

    return null;
  }

  /**
   * @param string $requestUri
   * @param string $httpMethod
   * @return void
   * @throws RouteNotFoundException
   */
  public function execute(string $requestUri, string $httpMethod)
  {
    $controllerClass = null;
    $method = null;
    $params = [];

    $route = $this->getRoute($requestUri, $httpMethod);

    if ($route === null) {
      throw new RouteNotFoundException($requestUri, $httpMethod);
    }

    $controllerClass = $route['controller'];
    $method = $route['method'];

    $constructorParams = $this->getMethodParams($controllerClass . '::__construct');
    $controllerInstance = new $controllerClass(...$constructorParams);

    $params = $this->getMethodParams($controllerClass . '::' . $method, $route['params']);
    echo $controllerInstance->$method(...$params);
  }

  /**
   * Get an array containing services instances guessed from method signature
   *
   * @param string $method Format : FQCN::method
   * @return array The services to inject
   */
  private function getMethodParams(string $method, array $params = []): array
  {
    $methodParams = [];

    try {
      $methodInfos = new ReflectionMethod($method);
      $methodParams = $methodInfos->getParameters();
    } catch (ReflectionException $e) {
      // Gérer les erreurs de réflexion ici
    }

    $resolvedParams = [];
    foreach ($methodParams as $methodParam) {
      $paramType = $methodParam->getType();
      $paramTypeName = $paramType->getName();

      // Vérifier si le paramètre existe dans les paramètres fournis
      if (isset($params[$methodParam->getName()])) {
        $resolvedParams[] = $params[$methodParam->getName()];
      } else {
        $resolvedParams[] = $this->container->get($paramTypeName);
      }
    }

    return $resolvedParams;
  }

  public function registerRoutes(): void
  {
    // Explorer le dossier des classes de contrôleurs
    // Pour chacun d'eux, enregistrer les méthodes
    // donc les contrôleurs portant un attribut Route
    $classNames = Filesystem::getClassNames(self::CONTROLLERS_GLOB_PATH);

    foreach ($classNames as $class) {
      $fqcn = "App\\Controller\\" . $class;
      $classInfos = new ReflectionClass($fqcn);

      if ($classInfos->isAbstract()) {
        continue;
      }

      $methods = $classInfos->getMethods(ReflectionMethod::IS_PUBLIC);

      foreach ($methods as $method) {
        if ($method->isConstructor()) {
          continue;
        }

        $attributes = $method->getAttributes(Route::class);

        if (!empty($attributes)) {
          $routeAttribute = $attributes[0];
          /** @var Route */
          $routeInstance = $routeAttribute->newInstance();

          // Extraction des paramètres de la méthode.
          $methodParams = $method->getParameters();
          $paramNames = [];
          foreach ($methodParams as $param) {
            $paramNames[] = $param->getName();
          }

          $this->addRoute(
            $routeInstance->getName(),
            $routeInstance->getPath(),
            $routeInstance->getHttpMethod(),
            $fqcn,
            $method->getName(),
            $paramNames // Ajouter les paramètres ici
          );
        }
      }
    }
  }
}
