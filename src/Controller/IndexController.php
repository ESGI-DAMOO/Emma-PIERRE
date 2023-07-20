<?php

namespace App\Controller;

use App\Routing\Attribute\Route;

class IndexController extends AbstractController
{
  private function getIdUser(): int
  {
    if (session_status() == PHP_SESSION_NONE) {
      session_start();
    }
    $idUser = $_SESSION['user_id'] ?? 0;
    return $idUser;
  }
  #[Route(path: "/", name: "indexPage_page")]
  public function indexPage(): string
  {
    $context['page'] = array(
      'titre' => 'Emma Pierre - Votre panier',
    );
    $idUser = $this->getIdUser();
    $context['session'] = $_SESSION;
    // Rendu du template Twig
    return $this->twig->render('index.html.twig', $context);
  }
}
