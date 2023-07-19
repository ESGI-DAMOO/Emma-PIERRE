<?php

namespace App\Controller;

use PDO;
use App\Routing\Attribute\Route;

class ArticlesController extends AbstractController
{

  #[Route(path: "/articles", name: "getAllArticles_page")]
  public function getAllArticles(): string
  {

    // Récupère les articles
    $req = "SELECT * FROM ARTICLE";
    $statement = $this->pdo->prepare($req);
    $statement->execute();
    $articles = $statement->fetchAll(PDO::FETCH_ASSOC);

    // Contexte Twig
    $context['page'] = array(
      'titre' => 'Liste des articles',
    );
    foreach ($articles as &$article) {
        if($article["photos"] != null) {
            $photos = json_decode($article["photos"]);
            $article["photos"] = $photos[0]->src;
        }
    }
    $context['articles'] = $articles;

    // Récupère les types d'articles
    $req = "SELECT * FROM TYPE_ARTICLE;";
    $statement = $this->pdo->prepare($req);
    $statement->execute();
    $types = $statement->fetchAll(PDO::FETCH_ASSOC);
    $context['types'] = $types;

    // Recupere les couleurs
    $req = "SELECT * FROM COULEUR;";
    $statement = $this->pdo->prepare($req);
    $statement->execute();
    $couleurs = $statement->fetchAll(PDO::FETCH_ASSOC);
    $context['couleurs'] = $couleurs;

    // Recupere le prix min et le prix max
    $req = "SELECT MIN(prix) AS prix_min, MAX(prix) AS prix_max FROM ARTICLE;";
    $statement = $this->pdo->prepare($req);
    $statement->execute();
    $prix = $statement->fetchAll(PDO::FETCH_ASSOC);
    $context['prix'] = $prix;

    return $this->twig->render('articles.html.twig', $context);
  }
  #[Route(path: "/api/articles/sort/{type}{couleur}{prix_min}{prix_max}{dispo}{promo}", name: "cart_page")]
  public function sortArticles(string $type = 'null', string $couleur, int $prix_min, int $prix_max, bool $dispo, bool $promo): string
  {
      $req = "SELECT a.*";
      $req .= " FROM ARTICLE AS a JOIN TYPE_ARTICLE AS t ON a.id_type = t.id_type JOIN COULEUR AS c ON a.id_couleur = c.id_couleur";
      $req = " WHERE 1=1";

      if ($type != null) {
        $req .= " AND t.type = :type";
      }
      if ($couleur != null) {
        $req .= " AND c.nom_couleur = :couleur";
      }
      if ($prix_min != null && $prix_max != null) {
          $req .= " AND a.prix BETWEEN x AND y";
      }
      else if ($prix_min != null) {
          $req .= " AND a.prix > :prix_min";
      }
      else if ($prix_max != null) {
          $req .= " AND a.prix > :prix_max";
      }
      if ($dispo != null) {
          $req .= " AND a.stock > 0";
      }
      if ($promo != null) {
          $req .= " AND a.remise <> 0";
      }


    // Rendu du template Twig
    return $this->twig->render('articles.html.twig', $context);
  }

  #[Route(path: "/article/{id}", name: 'getOneArticle', httpMethod: "GET")]
  public function getOneArticle(int $id): string
  {
    // Récupère les données de la base de données
    $req = "
    SELECT 
      a.id_article, 
      a.nom, 
      a.description, 
      a.longueur, 
      a.prix, 
      a.remise, 
      a.stock, 
      a.remarques, 
      a.photos, 
      cat.categorie, 
      col.collection, 
      cou.nom_couleur couleur, 
      cou.code code_couleur,
      mat.nom_matiere matiere, 
      typ.type  
    FROM article a
    JOIN categorie cat ON cat.id_categorie = a.id_categorie
    JOIN collection col on col.id_collection = a.id_collection
    JOIN couleur cou on cou.id_couleur = a.id_couleur
    JOIN matiere mat on mat.id_matiere = a.id_matiere
    JOIN type_article typ ON typ.id_type = a.id_type
    WHERE a.id_article = :id;
    ";
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

    $article["prixEntier"] = floor($article["prix"]);
    $article["prixFraction"] = sprintf("%02d", fmod($article["prix"], 1) * 100);
    $context['article'] = $article;

    // Rendu du template Twig
    return $this->twig->render('article.html.twig', $context);
  }
}
