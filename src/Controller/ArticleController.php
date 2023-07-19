<?php

namespace App\Controller;

use PDO;
use App\Routing\Attribute\Route;

class ArticleController extends AbstractController
{

  #[Route(path: "/listing-product", name: "getAllArticles_page")]
  public function getAllArticles(): string
  {

    // Récupère les données de la base de données
    $req = "SELECT * FROM ARTICLE";
    $statement = $this->pdo->prepare($req);
    $statement->execute();
    $articles = $statement->fetchAll(PDO::FETCH_ASSOC);

    // Contexte Twig
    $context['page'] = array(
      'titre' => 'Liste des articles',
    );
    foreach ($articles as &$article) {
      $photos = json_decode($article["photos"]);
      if (!$photos) {
        $article["photos"] = '';
      } else {
        $article["photos"] = $photos[0]->src;
      }
    }
    $context['articles'] = $articles;

    // Récupère les données de la base de données
    $req = "SELECT * FROM TYPE_ARTICLE;";
    $statement = $this->pdo->prepare($req);
    $statement->execute();
    $types = $statement->fetchAll(PDO::FETCH_ASSOC);

    $context['types'] = $types;

    // Rendu du template Twig
    return $this->twig->render('products.html.twig', $context);
  }

  #[Route(path: "/article/{id}", name: 'getOneArticle', httpMethod: "GET")]
  public function getOneArticle(int $id): string
  {
    // Récupère les données de la base de données
    $req = "SELECT * FROM article WHERE id_article = :id;";
    $statement = $this->pdo->prepare($req);
    $statement->execute([':id' => $id]);
    $article = $statement->fetch(PDO::FETCH_ASSOC);
    $error = $_GET['error'] ?? '';

    if (!$article) {
      $context['page'] = array(
        'titre' => 'Page non trouvée',
      );
      return $this->twig->render('erreur404.html.twig', $context);
    }

    // Contexte Twig
    $context['page'] = array(
      'titre' => 'Emma Pierre - article ' . $article['nom'],
    );
    $context['article'] = $article;

    // Rendu du template Twig
    return $this->twig->render('article.html.twig', $context);
  }
}
