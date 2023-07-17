<?php

namespace App\Controller;

use Twig\Environment;
use PDO;

abstract class AbstractController
{
  public function __construct(
    protected Environment $twig,
    protected \PDO $pdo
  ) {
  }
}
