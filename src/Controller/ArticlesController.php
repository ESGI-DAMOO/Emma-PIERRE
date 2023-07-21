<?php

namespace App\Controller;

use PDO;
use App\Routing\Attribute\Route;

class ArticlesController extends AbstractController
{
  private function getIdUser(): int
  {
    if (session_status() == PHP_SESSION_NONE) {
      session_start();
    }
    $idUser = $_SESSION['user_id'] ?? 0;
    return $idUser;
  }

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
    $idUser = $this->getIdUser();
    $context['session'] = $_SESSION;
    foreach ($articles as &$article) {
      if ($article["photos"] != null) {
        $photos = json_decode($article["photos"]);
        $article["photos"] = $photos[0]->url;
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

  #[Route(path: "/api/articles", name: "cart_page", httpMethod: 'POST')]
  public function filterArticles(): string
  {
    $type = $_POST['type'] ?? null;
    $couleur = $_POST['couleur'] ?? null;
    $prix_min = $_POST['prix_min'] ?? 0;
    $prix_max = $_POST['prix_max'] ?? 10000;
    $dispo = filter_var($_POST['dispo'], FILTER_VALIDATE_BOOLEAN) ?? true;
    $promo = filter_var($_POST['promo'], FILTER_VALIDATE_BOOLEAN) ?? false;

    $req = "SELECT a.*";
    $req .= " FROM ARTICLE AS a JOIN TYPE_ARTICLE AS t ON a.id_type = t.id_type JOIN COULEUR AS c ON a.id_couleur = c.id_couleur";
    $req .= " WHERE 1=1";

    if ($type != null) {
      $req .= " AND t.type IN (:type)";
    }
    if ($couleur != null) {
      $req .= " AND c.code = :couleur";
    }
    $req .= " AND a.prix BETWEEN " . $prix_min . " AND " . $prix_max;
    if ($dispo) $req .= " AND a.stock > 0";
    if ($promo) $req .= " AND a.remise > 0";

    $stmt = $this->pdo->prepare($req);

    // Ajoutez la liaison des paramètres seulement s'ils ne sont pas null
    if ($type != null) {
      $stmt->bindParam(":type", $type);
    }

    if ($couleur != null) {
      $stmt->bindParam(':couleur', $couleur);
    }
    // if ($prix_min != null && $prix_max != null) {
    //   $stmt->bindParam(':prix_min', $prix_min);
    //   $stmt->bindParam(':prix_max', $prix_max);
    // } else if ($prix_min != null) {
    //   $stmt->bindParam(':prix_min', $prix_min);
    // } else if ($prix_max != null) {
    //   $stmt->bindParam(':prix_max', $prix_max);
    // }

    $stmt->execute();
    $articles = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // Renvoie une réponse json
    header('Content-Type: application/json');
    http_response_code(200);
    echo json_encode(['articles' => $articles]);
    exit;
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
    $idUser = $this->getIdUser();
    $context['session'] = $_SESSION;

    $article["prixEntier"] = floor($article["prix"]);
    $article["prixFraction"] = sprintf("%02d", fmod($article["prix"], 1) * 100);
    $article["photos"] = json_decode($article["photos"])[0]->url ?? [];
    $context['article'] = $article;

    // Rendu du template Twig
    return $this->twig->render('article.html.twig', $context);
  }
}
