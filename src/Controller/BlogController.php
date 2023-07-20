<?php

namespace App\Controller;

use PDO;
use App\Routing\Attribute\Route;

class BlogController extends AbstractController
{
  private function getIdUser(): int
  {
    if (session_status() == PHP_SESSION_NONE) {
      session_start();
    }
    $idUser = $_SESSION['user_id'] ?? 0;
    return $idUser;
  }

  #[Route(path: "/blog", name: "blog_page")]
  public function showBlog(): string
  {

    // Contexte Twig
    $context['page'] = array(
      'titre' => 'Emma Pierre - Blog',
    );
    $idUser = $this->getIdUser();
    $context['session'] = $_SESSION;

    // Rendu du template Twig
    return $this->twig->render('blog.html.twig', $context);
  }
}
