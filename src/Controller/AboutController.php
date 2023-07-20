<?php

namespace App\Controller;

use PDO;
use App\Routing\Attribute\Route;

class AboutController extends AbstractController
{
  private function getIdUser(): int
  {
    if (session_status() == PHP_SESSION_NONE) {
      session_start();
    }
    $idUser = $_SESSION['user_id'] ?? 0;
    return $idUser;
  }

  #[Route(path: "/about", name: "about_page")]
  public function showAbout(): string
  {

    // Contexte Twig
    $context['page'] = array(
      'titre' => 'Emma Pierre - Qui sommes-nous ?',
    );

    // Rendu du template Twig
    return $this->twig->render('about.html.twig', $context);
  }
}
