<?php

namespace App\Controller;

use PDO;
use App\Routing\Attribute\Route;

class CartController extends AbstractController
{

  #[Route(path: "/cart", name: "cart_page")]
  public function showCart(): string
  {

    $rest_api_url = 'https://happyapi.fr/api/getLands';
    $json_data = file_get_contents($rest_api_url);
    $response_data = json_decode($json_data);

    $context['pays'] = $response_data;
    $context['page'] = array(
      'titre' => 'Emma Pierre - Votre pannier',
    );

    // Rendu du template Twig
    return $this->twig->render('cart.html.twig', $context);
  }
}
