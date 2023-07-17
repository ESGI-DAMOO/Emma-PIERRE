<?php

namespace App\Controller;

use PDO;
use App\Routing\Attribute\Route;

class RestaurantController extends AbstractController
{

  #[Route(path: "/", name: "getAllRestaurants_page")]
  public function getAllRestaurants(): string
  {

    // Récupère les données de la base de données
    $req = "SELECT r.*, AVG(a.note) note FROM restaurant r LEFT JOIN avis a ON r.id = a.id_restaurant GROUP BY r.id;";
    $statement = $this->pdo->prepare($req);
    $statement->execute();
    $restaurants = $statement->fetchAll(PDO::FETCH_ASSOC);

    // Contexte Twig
    $context['page'] = array(
      'titre' => 'Liste des restaurants',
    );
    $context['restaurants'] = $restaurants;

    // Rendu du template Twig
    return $this->twig->render('index.html.twig', $context);
  }

  #[Route(path: "/restau/{id}", name: 'getOneRestaurant', httpMethod: "GET")]
  public function getOneRestaurant(int $id): string
  {
    // Récupère les données de la base de données
    $req = "SELECT r.*, AVG(a.note) note FROM restaurant r LEFT JOIN avis a ON r.id = a.id_restaurant WHERE r.id = :id GROUP BY r.id;";
    $statement = $this->pdo->prepare($req);
    $statement->execute(['id' => $id]);
    $restaurant = $statement->fetch(PDO::FETCH_ASSOC);
    $error = $_GET['error'] ?? '';

    if (!$restaurant) {
      $context['page'] = array(
        'titre' => 'Page non trouvée',
      );
      return $this->twig->render('erreur404.html.twig', $context);
    }
    // Récupère les données de la base de données
    $req = "SELECT * FROM `avis` WHERE `id_restaurant` = ? ";
    $statement = $this->pdo->prepare($req);
    $statement->execute(array($id));
    $context['avis'] = $statement;

    // Contexte Twig
    $context['page'] = array(
      'titre' => 'Restaurant ' . $restaurant['nom'],
    );
    $context['restaurant'] = $restaurant;
    // Rendu du template Twig
    return $this->twig->render('restau.html.twig', $context);
  }

  #[Route(path: "/ajoutRestau", name: "form_add")]
  public function showFormAdd(): string
  {


    // Contexte Twig
    $context['page'] = array(
      'titre' => 'Liste des restaurants',
    );
    // Rendu du template Twig
    return $this->twig->render('addrestau.html.twig', $context);
  }


  #[Route(path: "/add", name: 'addrestau', httpMethod: 'POST')]
  public function addrestau(): string
  {

    //Context Twig
    $context['page'] = array(
      'titre' => 'Ajouter un restaurant',
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
