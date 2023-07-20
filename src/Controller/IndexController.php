<?php

namespace App\Controller;

use App\Routing\Attribute\Route;

class IndexController extends AbstractController
{
  #[Route(path: "/", name: "indexPage_page")]
  public function indexPage(): string
  {
    $context['page'] = array(
      'titre' => 'Emma Pierre - Votre panier',
    );
    // Rendu du template Twig
    return $this->twig->render('index.html.twig', $context);
  }
}
