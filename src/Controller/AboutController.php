<?php

namespace App\Controller;

use PDO;
use App\Routing\Attribute\Route;

class AboutController extends AbstractController
{

  #[Route(path: "/about", name: "about_page")]
  public function ahowAbout(): string
  {

    // Contexte Twig
    $context['page'] = array(
      'titre' => 'Emma Pierre A propos',
    );

    // Rendu du template Twig
    return $this->twig->render('about.html.twig', $context);
  }
}
