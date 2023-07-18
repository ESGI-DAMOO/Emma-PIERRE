<?php

namespace App\Controller;

use PDO;
use App\Routing\Attribute\Route;

class ContactController extends AbstractController
{

  #[Route(path: "/contact", name: "contact_page")]
  public function showContact(): string
  {

    // Contexte Twig
    $context['page'] = array(
      'titre' => 'Emma Pierre Contact - Bijoux en pierre',
    );

    // Rendu du template Twig
    return $this->twig->render('contact.html.twig', $context);
  }
}
