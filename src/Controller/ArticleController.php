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
        if(!$photos) {
            $article["photos"] = '';
        }
        else {
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
    $req = "SELECT * FROM ARTICLE WHERE id_article = :id;";
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
      'titre' => 'article ' . $article['nom'],
    );
    $context['article'] = $article;

    // Rendu du template Twig
    return $this->twig->render('restau.html.twig', $context);
  }

  #[Route(path: "/ajoutRestau", name: "form_add")]
  public function showFormAdd(): string
  {


    // Contexte Twig
    $context['page'] = array(
      'titre' => 'Liste des articles',
    );
    // Rendu du template Twig
    return $this->twig->render('addrestau.html.twig', $context);
  }


  #[Route(path: "/add", name: 'addrestau', httpMethod: 'POST')]
  public function addrestau(): string
  {

    //Context Twig
    $context['page'] = array(
      'titre' => 'Ajouter un article',
    );

    /**
     * Si le formulaire d'ajout de restaurant est rempli, alors on envoie les données en base.
     */
    if (!empty($_POST)) {

      //Récupération des données
      $nom = $_POST['nom'] ?? '';
      $description = $_POST['description'] ?? '';
      $nom_proprietaire = $_POST['nom_proprietaire'] ?? '';
      $adresse = $_POST['adresse'] ?? '';
      $email = $_POST['email'] ?? '';
      $tel = $_POST['tel'] ?? '';
      $photo_url = $_POST['photo_url'] ?? '';

      //Est-ce que le restaurant existe déjà ?
      $req = "SELECT COUNT(*) FROM restaurant WHERE nom = ?";
      $statement = $this->pdo->prepare($req);
      $statement->execute(array($nom));
      $count = $statement->fetchColumn(); //On récupère le nombre de restaurant ayant le nom.

      //Si il n'y a pas de restaurants qui portent le même nom...
      if ($count <= 0) {
        //Préparation de la requête SQL pour insérer
        $req = "INSERT INTO `restaurant` (`id`, `nom`, `description`, `adresse`, `telephone`, `url_photo`, `email`, `nom_proprietaire`) 
        VALUES (?, ?, ?, ?, ?, ?, ?, ?);";
        $statement = $this->pdo->prepare($req);
        //Envoi de la requête
        $statement->execute(array(NULL, $nom, $description, $adresse, $tel, $photo_url, $email, $nom_proprietaire));
      } else {
        echo "Le restaurant existe déjà";
      }
    }

    return $this->twig->render('addrestau.html.twig', $context);
  }

  #[Route(path: "/addnote/{id}", name: 'addnote', httpMethod: 'POST')]
  public function addnote(int $id): string
  {
    //Context Twig
    $context['page'] = array(
      'titre' => 'Ajouter un restaurant',
    );

    /**
     * Si le formulaire d'ajout de restaurant est rempli, alors on envoie les données en base.
     */
    if (!empty($_POST)) {

      $note = $_POST['note'] ?? '';
      $pseudo = $_POST['pseudo'] ?? '';
      $message = $_POST['message'] ?? '';

      //Est-ce que le restaurant existe déjà ?
      $req = "SELECT COUNT(*) FROM avis WHERE pseudo = ? AND id_restaurant = ?";
      $statement = $this->pdo->prepare($req);
      $statement->execute([$pseudo, $id]);
      $count = $statement->fetchColumn(); //On récupère le nombre de restaurant ayant le nom.

      //Si il n'y a pas de restaurants qui portent le même nom...
      if ($count <= 0) {
        //Préparation de la requête SQL pour insérer
        $req = "INSERT INTO `avis` (`id`, `id_restaurant`, `avis`, `pseudo`, `note`, `date`) VALUES (?, ?, ?, ?, ?, CURRENT_TIMESTAMP);";
        $statement = $this->pdo->prepare($req);
        //Envoi de la requête
        $statement->execute(array(NULL, $id, $message, $pseudo, $note));
      } else {
        header('Location: /restau/' . $id);
        exit;
      }
    }

    header('Location: /restau/' . $id);
    exit;
  }
}
