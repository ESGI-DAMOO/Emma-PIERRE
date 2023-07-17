<?php

namespace App\Routing\Attribute;

use Attribute;

#[Attribute]
class Route
{
  public function __construct(
    private string $path,
    private string $name = "default_name",
    private string $httpMethod = "GET"
  ) {
  }

  public function getPath(): string
  {
    return $this->path;
  }

  public function getName(): string
  {
    return $this->name;
  }

  public function getHttpMethod(): string
  {
    return $this->httpMethod;
  }
}
