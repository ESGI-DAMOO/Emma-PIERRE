<?php

namespace App\Controller;

use PDO;
use App\Routing\Attribute\Route;

class IndexController extends AbstractController
{
  #[Route(path: "/", name: "indexPage_page")]
  public function indexPage(): string
  {
    // Rendu du template Twig
    return $this->twig->render('index.html.twig');
  }

}
