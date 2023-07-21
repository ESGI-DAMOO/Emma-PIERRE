<?php

namespace App\Controller;

use PDO;
use App\Routing\Attribute\Route;

class CartController extends AbstractController
{

  /**
   * Récupère l'id de l'utilisateur connecté
   */
  private function getIdUser(): int
  {
    if (session_status() == PHP_SESSION_NONE) {
      session_start();
    }
    $idUser = $_SESSION['user_id'] ?? 0;
    return $idUser;
  }

  /**
   * Récupère un article
   */
  private function getArticle(int $id)
  {
    $req = "SELECT 
      id_article
    FROM article
    WHERE id_article = ?;";
    $statement = $this->pdo->prepare($req);
    $statement->execute([$id]);
    $article = $statement->fetch(PDO::FETCH_ASSOC);
    return $article;
  }

  /**
   * Récupère la commande active de l'utilisateur
   */
  private function getCommandeActive(int $idUser)
  {
    $req = "SELECT 
      id_commande
    FROM commande
    WHERE id_user = ? AND id_statut = 1;";
    $statement = $this->pdo->prepare($req);
    $statement->execute([$idUser]);
    $commande = $statement->fetch(PDO::FETCH_ASSOC);
    return $commande;
  }

  /**
   * Récupère une ligne du panier
   */
  private function getLignePanier(int $idCommande, int $idArticle)
  {
    $req = "SELECT 
      id_commande,
      id_article,
      quantite
    FROM panier
    WHERE id_commande = ? AND id_article = ?;";
    $statement = $this->pdo->prepare($req);
    $statement->execute([$idCommande, $idArticle]);
    $lignePanier = $statement->fetchAll(PDO::FETCH_ASSOC);
    return $lignePanier;
  }

  /**
   * Affiche le panier
   */
  #[Route(path: "/panier", name: 'cart_page', httpMethod: "GET")]
  public function cart(): string
  {

    $context['page'] = array(
      'titre' => 'Emma Pierre - Votre panier',
    );
    $idUser = $this->getIdUser();
    $context['session'] = $_SESSION;

    // Récupération de l'id de l'utilisateur connecté
    $idUser = $this->getIdUser();
    $context['idUser'] = $idUser;
    if ($idUser == 0) {
      return $this->twig->render('cart.html.twig', $context);
      exit;
    }

    // Vérification de l'existance d'une commande active dans la base de données
    $commande = $this->getCommandeActive($idUser);
    if (!$commande) {
      $context['articles'] = [];
      return $this->twig->render('cart.html.twig', $context);
      exit;
    }

    // Récupération des articles du panier
    $req = "SELECT 
      a.id_article,
      a.nom,
      a.prix,
      a.remise,
      a.photos,
      p.quantite,
      ta.type AS type_article,
      (a.prix - (a.prix * a.remise / 100)) AS prix_article,
      (a.prix - (a.prix * a.remise / 100)) * p.quantite AS total_article
    FROM article a
    JOIN panier p ON a.id_article = p.id_article
    JOIN type_article ta ON a.id_type = ta.id_type
    WHERE p.id_commande = ?;";
    $statement = $this->pdo->prepare($req);
    $statement->execute([$commande['id_commande']]);
    $articles = $statement->fetchAll(PDO::FETCH_ASSOC);
    $totalPanier = $articles ? array_sum(array_column($articles, 'total_article')) : 0;
    foreach ($articles as $key => $article) {
      $articles[$key]['photos'] = json_decode($articles[$key]['photos'])[0]->url ?? [];
    }
    $context['articles'] = $articles;
    $context['totalPanier'] = $totalPanier;

    // Rendu du template Twig
    return $this->twig->render('cart.html.twig', $context);
  }

  /**
   * Ajout au panier
   */
  #[Route(path: "/api/panier/add", name: 'addToCart', httpMethod: "POST")]
  public function addToCart(): string
  {
    // Vérification de l'existance de l'id dans la base de données
    $id = $_POST['id'] ?? 0;

    $article = $this->getArticle($id);
    if (!$article) {
      // Article non trouvé => retourne une erreur 404 json
      header('Content-Type: application/json');
      http_response_code(404);
      echo json_encode(['error' => 'Article non trouvé']);
      exit;
    }

    // Récupération de l'id de l'utilisateur connecté
    $idUser = $this->getIdUser();
    if ($idUser == 0) {
      // renvoie une erreur 401 json si l'utilisateur n'est pas connecté
      header('Content-Type: application/json');
      http_response_code(401);
      echo json_encode(['error' => 'Vous devez être connecté pour ajouter un article au panier']);
      exit;
    }

    // Vérification de l'existance d'une commande active dans la base de données
    $commande = $this->getCommandeActive($idUser);
    if (!$commande) {
      $req = "INSERT INTO commande (id_user, id_statut) VALUES (?, 1);";
      $statement = $this->pdo->prepare($req);
      $statement->execute([$idUser]);
      $idCommande = $this->pdo->lastInsertId();
    } else {
      $idCommande = $commande['id_commande'];
    }

    // Vérification de l'existance de l'article dans le panier et ajout ou mise à jour de la quantité
    $lignePanier = $this->getLignePanier($idCommande, $id);
    if ($lignePanier) {
      $req = "UPDATE panier SET quantite = quantite + 1 WHERE id_commande = ? AND id_article = ?;";
      $statement = $this->pdo->prepare($req);
      $statement->execute([$idCommande, $id]);
    } else {
      $req = "INSERT INTO panier (id_commande, id_article, quantite) VALUES (?, ?, 1);";
      $statement = $this->pdo->prepare($req);
      $statement->execute([$idCommande, $id]);
    }
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
    $idUser = $this->getIdUser();
    if ($idUser == 0) {
      // renvoie une erreur 401 json si l'utilisateur n'est pas connecté
      header('Content-Type: application/json');
      http_response_code(200);
      echo json_encode(['nbArticles' => 0]);
      exit;
    }

    // Vérification de l'existance d'une commande active dans la base de données
    $commande = $this->getCommandeActive($idUser);
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
    header('Content-Type: application/json');
    http_response_code(200);
    echo json_encode(['nbArticles' => $nbArticles]);
    exit;
  }

  /**
   * Supprime un article du panier
   */
  #[Route(path: "/api/panier/delete", name: 'deleteFromCart', httpMethod: "POST")]
  public function deleteFromCart()
  {
    // Vérification de l'existance de l'id dans la base de données
    $id = $_POST['id'] ?? 0;
    $article = $this->getArticle($id);
    if (!$article) {
      // Article non trouvé => retourne une erreur 404 json
      header('Content-Type: application/json');
      http_response_code(404);
      echo json_encode(['error' => 'Article non trouvé']);
      exit;
    }

    // Récupération de l'id de l'utilisateur connecté
    $idUser = $this->getIdUser();
    if ($idUser == 0) {
      // renvoie une erreur 401 json si l'utilisateur n'est pas connecté
      header('Content-Type: application/json');
      http_response_code(401);
      echo json_encode(['error' => 'Vous devez être connecté pour ajouter un article au panier']);
      exit;
    }

    // Vérification de l'existance d'une commande active dans la base de données
    $commande = $this->getCommandeActive($idUser);
    if (!$commande) {
      $req = "INSERT INTO commande (id_user, id_statut) VALUES (?, 1);";
      $statement = $this->pdo->prepare($req);
      $statement->execute([$idUser]);
      $idCommande = $this->pdo->lastInsertId();
    } else {
      $idCommande = $commande['id_commande'];
    }

    // Vérification de l'existance de l'article dans le panier et suppression si trouvé
    $lignePanier = $this->getLignePanier($idCommande, $id);
    if ($lignePanier) {
      $req = "DELETE FROM panier WHERE id_commande = ? AND id_article = ?;";
      $statement = $this->pdo->prepare($req);
      $statement->execute([$idCommande, $id]);
    }
    header('Content-Type: application/json');
    http_response_code(200);
    echo json_encode(['success' => 'Article supprimé du panier']);
    exit;
  }

  /**
   * Change la quantité d'un article dans le panier
   */
  #[Route(path: "/api/panier/changeQuantity", name: 'changeQuantity', httpMethod: "POST")]
  public function changeQuantity()
  {
    // Vérification de l'existance de l'id dans la base de données
    $id = $_POST['id'] ?? 0;
    $article = $this->getArticle($id);
    if (!$article) {
      // Article non trouvé => retourne une erreur 404 json
      header('Content-Type: application/json');
      http_response_code(404);
      echo json_encode(['error' => 'Article non trouvé']);
      exit;
    }

    // Récupération de l'id de l'utilisateur connecté
    $idUser = $this->getIdUser();
    if ($idUser == 0) {
      // renvoie une erreur 401 json si l'utilisateur n'est pas connecté
      header('Content-Type: application/json');
      http_response_code(401);
      echo json_encode(['error' => 'Vous devez être connecté pour ajouter un article au panier']);
      exit;
    }

    // Vérification de l'existance d'une commande active dans la base de données
    $commande = $this->getCommandeActive($idUser);
    if (!$commande) {
      $req = "INSERT INTO commande (id_user, id_statut) VALUES (?, 1);";
      $statement = $this->pdo->prepare($req);
      $statement->execute([$idUser]);
      $idCommande = $this->pdo->lastInsertId();
    } else {
      $idCommande = $commande['id_commande'];
    }

    // Vérification de l'existance de l'article dans le panier et mise à jour de la quantité si trouvé
    $lignePanier = $this->getLignePanier($idCommande, $id);
    if ($lignePanier) {
      $req = "UPDATE panier SET quantite = ? WHERE id_commande = ? AND id_article = ?;";
      $statement = $this->pdo->prepare($req);
      $statement->execute([$_POST['quantity'], $idCommande, $id]);
    }
    header('Content-Type: application/json');
    http_response_code(200);
    echo json_encode(['success' => 'Quantité modifiée']);
    exit;
  }

  /**
   * Calcul du montant global du panier
   */
  #[Route(path: "/api/panier/getTotal", name: 'getTotal', httpMethod: "GET")]
  public function getTotal()
  {
    // Récupération de l'id de l'utilisateur connecté
    $idUser = $this->getIdUser();
    if ($idUser == 0) {
      // renvoie une erreur 401 json si l'utilisateur n'est pas connecté
      header('Content-Type: application/json');
      http_response_code(401);
      echo json_encode(['error' => 'Utilisateur non connecté']);
      exit;
    }

    // Vérification de l'existance d'une commande active dans la base de données
    $commande = $this->getCommandeActive($idUser);
    if (!$commande) {
      // renvoie une réponse json avec 0 article si aucune commande active n'est trouvée
      header('Content-Type: application/json');
      http_response_code(200);
      echo json_encode(['total' => 0]);
      exit;
    }

    // Calcul du montant total du panier
    $req = "SELECT 
      (a.prix - (a.prix * a.remise / 100)) * p.quantite AS total_article
    FROM article a
    JOIN panier p ON a.id_article = p.id_article
    JOIN type_article ta ON a.id_type = ta.id_type
    WHERE p.id_commande = ?;";

    $statement = $this->pdo->prepare($req);
    $statement->execute([$commande['id_commande']]);
    $articles = $statement->fetchAll(PDO::FETCH_ASSOC);
    $totalPanier = $articles ? array_sum(array_column($articles, 'total_article')) : 0;
    header('Content-Type: application/json');
    http_response_code(200);
    echo json_encode(['total' => $totalPanier]);
    exit;
  }

  /**
   * Calcule le montant total d'un article en fonction de ses remises et quantité
   */
  #[Route(path: "/api/panier/getArticleTotal/{id}", name: 'getArticleTotal', httpMethod: "GET")]
  public function getArticleTotal(int $id)
  {
    // Vérification de l'existance de l'id dans la base de données
    $article = $this->getArticle($id);
    if (!$article) {
      // Article non trouvé => retourne une erreur 404 json
      header('Content-Type: application/json');
      http_response_code(404);
      echo json_encode(['error' => 'Article non trouvé']);
      exit;
    }

    // Récupération de l'id de l'utilisateur connecté
    $idUser = $this->getIdUser();
    if ($idUser == 0) {
      // renvoie une erreur 401 json si l'utilisateur n'est pas connecté
      header('Content-Type: application/json');
      http_response_code(401);
      echo json_encode(['error' => 'Utilisateur non connecté']);
      exit;
    }

    // Vérification de l'existance d'une commande active dans la base de données
    $commande = $this->getCommandeActive($idUser);
    if (!$commande) {
      // renvoie une réponse json avec 0 article si aucune commande active n'est trouvée
      header('Content-Type: application/json');
      http_response_code(200);
      echo json_encode(['total' => 0]);
      exit;
    }

    // Calcul du montant total de l'article
    $req = "SELECT 
      (a.prix - (a.prix * a.remise / 100)) * p.quantite AS total_article
    FROM article a
    JOIN panier p ON a.id_article = p.id_article
    JOIN type_article ta ON a.id_type = ta.id_type
    WHERE p.id_commande = ? AND p.id_article = ?;";

    $statement = $this->pdo->prepare($req);
    $statement->execute([$commande['id_commande'], $id]);
    $article = $statement->fetch(PDO::FETCH_ASSOC);
    $totalArticle = $article ? $article['total_article'] : 0;
    header('Content-Type: application/json');
    http_response_code(200);
    echo json_encode(['total' => $totalArticle]);
    exit;
  }
}
