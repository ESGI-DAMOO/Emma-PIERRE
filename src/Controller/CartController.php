<?php

namespace App\Controller;

use PDO;
use App\Routing\Attribute\Route;

class CartController extends AbstractController
{

  /**
   * Affiche le panier
   * 
   */
  #[Route(path: "/panier", name: 'cart_page', httpMethod: "GET")]
  public function cart(): string
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

  /**
   * Ajout au panier
   * 
   */
  #[Route(path: "/api/panier/add/{id}", name: 'addToCart', httpMethod: "GET")]
  public function addToCart(int $id): string
  {
    // Vérification de l'existance de l'id dans la base de données
    $req = "SELECT 
      id_article
    FROM article
    WHERE id_article = ?;";
    $statement = $this->pdo->prepare($req);
    $statement->execute([$id]);
    $article = $statement->fetch(PDO::FETCH_ASSOC);

    if (!$article) {
      // Article non trouvé => retourne une erreur 404 json
      header('Content-Type: application/json');
      http_response_code(404);
      echo json_encode(['error' => 'Article non trouvé']);
      exit;
    }

    // Récupération de l'id de l'utilisateur connecté
    //$idUser = $_SESSION['user_id'] ?? 0;
    $idUser = 21;
    if ($idUser == 0) {
      // renvoie une erreur 401 json si l'utilisateur n'est pas connecté
      header('Content-Type: application/json');
      http_response_code(401);
      echo json_encode(['error' => 'Vous devez être connecté pour ajouter un article au panier']);
      exit;
    }

    // Vérification de l'existance d'une commande active dans la base de données
    $req = "SELECT id_commande FROM commande WHERE id_user = ? AND id_statut = 1;";
    $statement = $this->pdo->prepare($req);
    $statement->execute([$idUser]);
    $commande = $statement->fetch(PDO::FETCH_ASSOC) ?? null;

    if (!$commande) {
      $req = "INSERT INTO commande (id_user, id_statut) VALUES (?, 1);";
      $statement = $this->pdo->prepare($req);
      $statement->execute([$idUser]);
      $idCommande = $this->pdo->lastInsertId();
    } else {
      $idCommande = $commande['id_commande'];
    }

    // Vérification de l'existance de l'article dans le panier et ajout ou mise à jour de la quantité
    $req = "SELECT * FROM panier WHERE id_commande = ? AND id_article = ?;";
    $statement = $this->pdo->prepare($req);
    $statement->execute([$idCommande, $id]);
    $panier = $statement->fetch(PDO::FETCH_ASSOC) ?? null;

    if ($panier) {
      $req = "UPDATE panier SET quantite = quantite + 1 WHERE id_commande = ? AND id_article = ?;";
      $statement = $this->pdo->prepare($req);
      $statement->execute([$idCommande, $id]);
    } else {
      $req = "INSERT INTO panier (id_commande, id_article, quantite) VALUES (?, ?, 1);";
      $statement = $this->pdo->prepare($req);
      $statement->execute([$idCommande, $id]);
    }

    // Renvoie une réponse json
    header('Content-Type: application/json');
    http_response_code(200);
    echo json_encode(['success' => 'Article ajouté au panier']);
    exit;
  }

  /**
   * Compte les articles dans le panier
   * 
   */
  #[Route(path: "/api/panier/count", name: 'countCart', httpMethod: "GET")]
  public function countCart(): string
  {
    // Récupération de l'id de l'utilisateur connecté
    //$idUser = $_SESSION['user_id'] ?? 0;
    $idUser = 21;
    if ($idUser == 0) {
      // renvoie une erreur 401 json si l'utilisateur n'est pas connecté
      header('Content-Type: application/json');
      http_response_code(401);
      echo json_encode(['error' => 'Vous devez être connecté pour ajouter un article au panier']);
      exit;
    }

    // Vérification de l'existance d'une commande active dans la base de données
    $req = "SELECT id_commande FROM commande WHERE id_user = ? AND id_statut = 1;";
    $statement = $this->pdo->prepare($req);
    $statement->execute([$idUser]);
    $commande = $statement->fetch(PDO::FETCH_ASSOC) ?? null;

    if (!$commande) {
      // renvoie une réponse json avec 0 article si aucune commande active n'est trouvée
      header('Content-Type: application/json');
      http_response_code(200);
      echo json_encode(['nbArticles' => 0]);
      exit;
    }

    // Compte les articles dans le panier
    $req = "SELECT SUM(quantite) AS nbArticles FROM panier WHERE id_commande = ?;";
    $statement = $this->pdo->prepare($req);
    $statement->execute([$commande['id_commande']]);
    $nbArticles = $statement->fetch(PDO::FETCH_ASSOC)['nbArticles'] ?? 0;

    // Renvoie une réponse json
    header('Content-Type: application/json');
    http_response_code(200);
    echo json_encode(['nbArticles' => $nbArticles]);
    exit;
  }
}
