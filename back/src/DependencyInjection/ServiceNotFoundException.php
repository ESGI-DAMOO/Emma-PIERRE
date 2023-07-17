<?php

namespace App\DependencyInjection;

use InvalidArgumentException;
use Psr\Container\NotFoundExceptionInterface;

class ServiceNotFoundException extends InvalidArgumentException implements NotFoundExceptionInterface
{
  public function __construct(string $id)
  {
    $this->message = "Le service $id n'existe pas";
  }
}
