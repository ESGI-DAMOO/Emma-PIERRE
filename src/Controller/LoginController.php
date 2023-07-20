<?php

namespace App\Controller;

use PDO;
use App\Routing\Attribute\Route;
use Symfony\Component\HttpFoundation\Response;

class LoginController extends AbstractController
{

  private function getIdUser(): int
  {
    if (session_status() == PHP_SESSION_NONE) {
      session_start();
    }
    $idUser = $_SESSION['user_id'] ?? 0;
    return $idUser;
  }

  #[Route(path: "/userlogin", name: "login_page")]
  public function loginPage(): string
  {
    // Contexte Twig
    $context['page'] = array(
      'titre' => 'Page de connexions',
    );
    $idUser = $this->getIdUser();
    $context['session'] = $_SESSION;

    if ($idUser > 0) {
      header('Location: /');
      die;
    }
    // Rendu du template Twig
    return $this->twig->render('user-login.html.twig', $context);
  }

  #[Route(path: "/userlogin", name: "login_action", httpMethod: "POST")]
  public function loginAction()
  {
    // Contexte Twig
    $context['page'] = array(
      'titre' => 'Page de connexion',
    );

    /**
     * Si le formulaire de connexion est rempli, alors on vérifie les informations en base de données.
     */
    $email = $_POST['email'] ?? '';
    $password = $_POST['password'] ?? '';

    // Requête SQL pour récupérer l'utilisateur par son nom d'utilisateur
    $req = "SELECT * FROM user WHERE email = ?";
    $statement = $this->pdo->prepare($req);
    $statement->execute([$email]);
    $user = $statement->fetch(PDO::FETCH_ASSOC);

    // Vérification du mot de passe haché
    if ($user && password_verify($password, $user['mot_passe'])) {
      // Authentification réussie, vous pouvez mettre en place votre logique de connexion ici
      // Par exemple, définir une variable de session pour maintenir l'état de connexion, etc.
      // Puis rediriger vers une page sécurisée.

      // Exemple de mise en place d'une variable de session pour maintenir l'état de connexion :
      session_start();
      $_SESSION['user_id'] = $user['id_user'];
      $_SESSION['lastname'] = $user['nom'];
      $_SESSION['firstname'] = $user['prenom'];
      $_SESSION['gender'] = $user['genre'];
      $_SESSION['phone'] = $user['tel'];
      $_SESSION['birthdate'] = $user['date_naissance'];
      $_SESSION['email'] = $user['email'];
      
      // Redirection vers une page sécurisée (par exemple, la page d'accueil)
      header('Location: /');
      exit;
    } else {
      // Authentification échouée, afficher le message d'erreur
      $context['error'] = "Nom d'utilisateur ou mot de passe incorrect.";
    }

    // Rendu du template Twig (page de connexion)
    //return $this->twig->render('user-login.html.twig', $context);
    header('Location: /userlogin');
  }

  #[Route(path: "/userregister", name: "register_page")]
  public function registerPage(): string
  {
    // Contexte Twig
    $context['page'] = array(
      'titre' => 'Page d\'inscription',
    );

    // Rendu du template Twig
    return $this->twig->render('register.html.twig', $context);
  }

  #[Route(path: "/userregister", name: "register_action", httpMethod: "POST")]
  public function registerAction()
  {
    // Contexte Twig
    $context['page'] = array(
      'titre' => 'Page d\'inscription',
    );

    /**
     * Si le formulaire d'inscription est rempli, alors on envoie les données en base de données.
     */
    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
      // Récupération des données du formulaire
      $email = $_POST['mail'] ?? '';
      $password = $_POST['password'] ?? '';
      $confirm_password = $_POST['confirm_password'] ?? '';
      $lastname = $_POST['lastname'] ?? '';
      $surname = $_POST['surname'] ?? '';
      $gender = $_POST['gender'] ?? '';
      $phone = $_POST['phone'] ?? '';
      $birthdate = $_POST['birthdate'] ?? '';

      // Informations de livraison
      $adresse = $_POST['adress'] ?? '';
      $complement = $_POST['compladress'] ?? '';
      $code_postal = $_POST['zipcode'] ?? '';
      $ville = $_POST['city'] ?? '';
      $pays = $_POST['country'] ?? '';

      // Vérification que les mots de passe correspondent
      if ($password !== $confirm_password) {
        $context['error'] = "Les mots de passe ne correspondent pas.";
        // Rendu du template Twig (page d'inscription avec message d'erreur)
        return $this->twig->render('register.html.twig', $context);
      }

      // Vérification si l'utilisateur existe déjà
      $req = "SELECT COUNT(*) FROM user WHERE email = ?";
      $statement = $this->pdo->prepare($req);
      $statement->execute([$email]);
      $count = $statement->fetchColumn();

      if ($count > 0) {
        $context['error'] = "Ce nom d'utilisateur est déjà pris.";
        // Rendu du template Twig (page d'inscription avec message d'erreur)
        return $this->twig->render('register.html.twig', $context);
      }

      // Hachage du mot de passe avant de l'enregistrer en base de données
      $hashed_password = password_hash($password, PASSWORD_DEFAULT);

      // Insertion des informations de livraison dans la table "adresse"
      $req = "INSERT INTO adresse (adresse, complement, code_postal, ville, pays) VALUES (?, ?, ?, ?, ?)";
      $statement = $this->pdo->prepare($req);
      $statement->execute([$adresse, $complement, $code_postal, $ville, $pays]);

      // Récupération de l'id_adresse créé
      $id_adresse = $this->pdo->lastInsertId();

      // Préparation de la requête SQL pour insérer l'utilisateur
      $id_role = 1; // Valeur par défaut pour id_role
      $req = "INSERT INTO user (nom, prenom, genre, tel, date_naissance, email, mot_passe, id_adresse, id_role) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
      $statement = $this->pdo->prepare($req);
      $statement->execute([$lastname, $surname, $gender, $phone, $birthdate, $email, $hashed_password, $id_adresse, $id_role]);

      // Redirection vers la page de connexion après l'inscription réussie
      header("Location: /userlogin");
      die;
    }

    // Rendu du template Twig (page d'inscription)
    return $this->twig->render('user-register.html.twig', $context);
  }

  #[Route(path: "/logout", name: "logout_action")]
public function logoutAction()
{
    // Détruire la session
    session_start();
    session_destroy();

    // Redirection vers la page d'accueil ou une autre page
    header("Location: /");
    exit;
}


  // ...
}
