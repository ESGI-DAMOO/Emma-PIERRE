<?php

namespace App\Controller;

use PDO;
use App\Routing\Attribute\Route;

class ContactController extends AbstractController
{
  private function getIdUser(): int
  {
    if (session_status() == PHP_SESSION_NONE) {
      session_start();
    }
    $idUser = $_SESSION['user_id'] ?? 0;
    return $idUser;
  }

  #[Route(path: "/contact", name: "contact_page")]
  public function showContact(): string
  {

    // Contexte Twig
    $context['page'] = array(
      'titre' => 'Emma Pierre Contact - Bijoux en pierre',
    );
    $idUser = $this->getIdUser();
    $context['session'] = $_SESSION;

    // Rendu du template Twig
    return $this->twig->render('contact.html.twig', $context);
  }
}
