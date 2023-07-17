<?php

namespace App\Routing;

use Exception;

class RouteNotFoundException extends Exception
{
  public function __construct(string $uri, string $method)
  {
    $this->message = "La route pour l'URL $uri (méthode : $method) n'a pas été trouvée";
  }
}
