<?php

namespace App\Controller;

use PDO;
use App\Routing\Attribute\Route;

class BlogController extends AbstractController
{

  #[Route(path: "/blog", name: "blog_page")]
  public function showBlog(): string
  {

    // Contexte Twig
    $context['page'] = array(
      'titre' => 'Emma Pierre - Blog',
    );

    // Rendu du template Twig
    return $this->twig->render('blog.html.twig', $context);
  }
}
