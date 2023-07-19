<?php

namespace App\Controller;

use PDO;
use App\Routing\Attribute\Route;

class LoginController extends AbstractController
{

  #[Route(path: "/userlogin", name: "login_page")]
  public function loginPage(): string
  {
    // Contexte Twig
    $context['page'] = array(
      'titre' => 'Page de connexion',
    );

    // Rendu du template Twig
    return $this->twig->render('user-login.html.twig', $context);
  }

  #[Route(path: "/userlogin", name: "login_action", httpMethod: "POST")]
    public function loginAction(): string
    {
        // Contexte Twig
        $context['page'] = array(
            'titre' => 'Page de connexion',
        );

        /**
         * Si le formulaire de connexion est rempli, alors on vérifie les informations en base de données.
         */
        if (!empty($_POST)) {
            $email = $_POST['email'] ?? '';
            $password = $_POST['password'] ?? '';

            // Requête SQL pour récupérer l'utilisateur par son nom d'utilisateur
            $req = "SELECT id_user, email, mot_passe FROM user WHERE email = ?";
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
                $_SESSION['user_id'] = $user['id'];

                // Redirection vers une page sécurisée (par exemple, la page d'accueil)
                header('Location: /');
                exit;
            } else {
                // Authentification échouée, afficher le message d'erreur
                $context['error'] = "Nom d'utilisateur ou mot de passe incorrect.";
            }
        }

        

        // Rendu du template Twig (page de connexion)
        return $this->twig->render('user-login.html.twig', $context);
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
  public function registerAction(): string
  {
    // Contexte Twig
    $context['page'] = array(
      'titre' => 'Page d\'inscription',
    );

    /**
     * Si le formulaire d'inscription est rempli, alors on envoie les données en base de données.
     */
    if (!empty($_POST)) {
      $username = $_POST['username'] ?? '';
      $password = $_POST['password'] ?? '';
      $confirm_password = $_POST['confirm_password'] ?? '';

      // Vérification que les mots de passe correspondent
      if ($password !== $confirm_password) {
        $context['error'] = "Les mots de passe ne correspondent pas.";
        // Rendu du template Twig (page d'inscription avec message d'erreur)
        return $this->twig->render('user-register.html.twig', $context);
      }

      // Vérification si l'utilisateur existe déjà
      $req = "SELECT COUNT(*) FROM user WHERE email = ?";
      $statement = $this->pdo->prepare($req);
      $statement->execute([$username]);
      $count = $statement->fetchColumn();

      if ($count > 0) {
        $context['error'] = "Ce nom d'utilisateur est déjà pris.";
        // Rendu du template Twig (page d'inscription avec message d'erreur)
        return $this->twig->render('user-register.html.twig', $context);
      }

      // Hachage du mot de passe avant de l'enregistrer en base de données
      $hashed_password = password_hash($password, PASSWORD_DEFAULT);

      // Préparation de la requête SQL pour insérer l'utilisateur
      $req = "INSERT INTO user (email, mot_passe) VALUES (?, ?)";
      $statement = $this->pdo->prepare($req);
      $statement->execute([$username, $hashed_password]);

      // Redirection vers la page de connexion après l'inscription réussie
      header('Location: /user-login');
      exit;
    }

    // Rendu du template Twig (page d'inscription)
    return $this->twig->render('user-register.html.twig', $context);
  }
}