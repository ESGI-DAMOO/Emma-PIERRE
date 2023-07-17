<?php

namespace App\DependencyInjection;

use LogicException;
use Psr\Container\ContainerInterface;

class Container implements ContainerInterface
{
  private array $services = [];

  public function set(string $id, $instance): self
  {
    if ($this->has($id)) {
      throw new LogicException("Le service $id est déjà enregistré");
    }
    $this->services[$id] = $instance;
    return $this;
  }

  /**
   * Gets a service from given service ID
   *
   * @param string $id
   * @return mixed
   * @throws ServiceNotFoundException
   */
  public function get(string $id)
  {
    if (!$this->has($id)) {
      throw new ServiceNotFoundException($id);
    }
    return $this->services[$id];
  }

  public function has(string $id): bool
  {
    return isset($this->services[$id]);
  }
}
