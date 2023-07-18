<?php

namespace App\Controller;

use PDO;
use App\Routing\Attribute\Route;

class CartController extends AbstractController
{

  #[Route(path: "/cart", name: "cart_page")]
  public function showCart(): string
  {

    // Contexte Twig
    $context['page'] = array(
      'titre' => 'Emma Pierre - Votre pannier',
    );

    // Rendu du template Twig
    return $this->twig->render('cart.html.twig', $context);
  }
}
