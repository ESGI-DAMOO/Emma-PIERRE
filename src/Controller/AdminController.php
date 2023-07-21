<?php

namespace App\Controller;

use PDO;
use App\Routing\Attribute\Route;

class AdminController extends AbstractController
{
    private function getIdUser(): int
  {
    if (session_status() == PHP_SESSION_NONE) {
      session_start();
    }
    $idUser = $_SESSION['user_id'] ?? 0;
    return $idUser;
  }
    #[Route(path: "/admin/login", name: "loginAdministrateur_page")]
    public function loginAdministrateur(): string
    {
        // Rendu du template Twig
        return $this->twig->render('admin/loginAdmin.twig');
    }

    #[Route(path: "/admin/dashboard", name: "dashboardAdministrateur_page")]
    public function dashboardAdministrateur(): string
    {

        // Obtenir le nombre de produits :
        $req = "SELECT COUNT(*) as nbproduit 
                FROM article";
        $statement = $this->pdo->prepare($req);
        $statement->execute();
        $context['produit'] = $statement->fetch(PDO::FETCH_ASSOC);

        // Obtenir le nombre de produits :
        $req = "SELECT COUNT(*) as nbcommande 
                FROM commande
                WHERE id_statut > 1";
        $statement = $this->pdo->prepare($req);
        $statement->execute();
        $context['produit'] += $statement->fetch(PDO::FETCH_ASSOC);

        // Obtenir le nombre de produits :
        $req = "SELECT COUNT(*) as nbclient 
                FROM user
                WHERE id_role = 1";
        $statement = $this->pdo->prepare($req);
        $statement->execute();
        $context['produit'] += $statement->fetch(PDO::FETCH_ASSOC);

        $req = "SELECT (subquery.revenus - (subquery.revenus * subquery.remise/100)) as revenusnet
            FROM (
                SELECT SUM((a.prix - (a.prix * a.remise / 100)) * p.quantite) as revenus, cp.remise
                FROM commande c 
                JOIN panier p ON p.id_commande = c.id_commande
                JOIN article a ON a.id_article = p.id_article
                JOIN code_promo cp ON cp.id_code_promo = c.id_code_promo
                WHERE c.id_statut > 1 
                GROUP BY c.id_commande, cp.remise
            ) subquery;";
        $statement = $this->pdo->prepare($req);
        $statement->execute();
        $context['produit'] += $statement->fetch(PDO::FETCH_ASSOC);

        // Rendu du template Twig
        return $this->twig->render('admin/dashboard.twig', $context);
    }

    #[Route(path: "/admin/produits", name: "produitAdministrateur_page")]
    public function produitAdministrateur(): string
    {

        // Obtenir le nombre de produits :
        $req = "SELECT *
                FROM article";
        $statement = $this->pdo->prepare($req);
        $statement->execute();
        $res = $statement->fetchAll(PDO::FETCH_ASSOC);
        $context['produit'] = $res;

        // Rendu du template Twig
        return $this->twig->render('admin/produits.twig', $context);
    }

    #[Route(path: "/admin/produits/{id}/edit", name: "produitEditAdministrateur_page", httpMethod: 'GET') ]
    public function produitEditAdministrateur(int $id): string
    {

        // Obtenir le nombre de produits :
        $req = "SELECT *
                FROM article WHERE id_article = $id";
        $statement = $this->pdo->prepare($req);
        $statement->execute();
        $res = $statement->fetch(PDO::FETCH_ASSOC);
        $context['produit'] = $res;

        // Obtenir le nombre de produits :
        $req = "SELECT *
                FROM categorie";
        $statement = $this->pdo->prepare($req);
        $statement->execute();
        $res = $statement->fetchAll(PDO::FETCH_ASSOC);
        $context['categories'] = $res;

        // Obtenir le nombre de produits :
        $req = "SELECT *
                FROM collection";
        $statement = $this->pdo->prepare($req);
        $statement->execute();
        $res = $statement->fetchAll(PDO::FETCH_ASSOC);
        $context['collections'] = $res;

        // Obtenir le nombre de produits :
        $req = "SELECT *
                FROM type_article";
        $statement = $this->pdo->prepare($req);
        $statement->execute();
        $res = $statement->fetchAll(PDO::FETCH_ASSOC);
        $context['types'] = $res;

        // Obtenir le nombre de produits :
        $req = "SELECT *
                FROM matiere";
        $statement = $this->pdo->prepare($req);
        $statement->execute();
        $res = $statement->fetchAll(PDO::FETCH_ASSOC);
        $context['matieres'] = $res;

        // Obtenir le nombre de produits :
        $req = "SELECT *
                FROM couleur";
        $statement = $this->pdo->prepare($req);
        $statement->execute();
        $res = $statement->fetchAll(PDO::FETCH_ASSOC);
        $context['couleurs'] = $res;


        // Rendu du template Twig
        return $this->twig->render('admin/produits-edit.twig', $context);
    }

    #[Route(path: "/api/produits/update/{id}", name: "apiEditProduitAdministrateur_page", httpMethod: "POST")]
    public function apiEditProduitAdministrateur(int $id): string
    {

        $nom = $_POST['name'];
        $description = $_POST['description'];
        $prix = $_POST['prix'];
        $remise = $_POST['remise'];
        $stock = $_POST['stock'];
        $id_type = $_POST['type'];
        $id_matiere = $_POST['matiere'];
        $id_couleur = $_POST['couleur'];
        $remarques = $_POST['remarques'];
        $id_categorie = $_POST['categorie'];
        $id_collection = $_POST['collection'];


        // Obtenir le nombre de produits :
        $req = "UPDATE `article` 
                SET `nom` = ?, `description` = ?, `prix` = ?, `remise` = ?, `stock` = ?, `id_type` = ?, `id_matiere` = ?, `id_couleur` = ?, `remarques` = ?, `id_categorie` = ?, `id_collection` = ? WHERE article.id_article = $id; ";
        $statement = $this->pdo->prepare($req);
        $statement->execute(array($nom, $description, $prix, $remise, $stock, $id_type, $id_matiere, $id_couleur, $remarques, $id_categorie, $id_collection));

        header('Location: /admin/produits');
        exit();
    }

    #[Route(path: "/api/produits/update/{id}", name: "apiEditProduitAdministrateur_page", httpMethod: "POST")]
    public function apiEditProduitAdministrateur(int $id): string
    {

        $nom = $_POST['name'];
        $description = $_POST['description'];
        $prix = $_POST['prix'];
        $remise = $_POST['remise'];
        $stock = $_POST['stock'];
        $id_type = $_POST['type'];
        $id_matiere = $_POST['matiere'];
        $id_couleur = $_POST['couleur'];
        $remarques = $_POST['remarques'];
        $id_categorie = $_POST['categorie'];
        $id_collection = $_POST['collection'];


        // Obtenir le nombre de produits :
        $req = "UPDATE `article` 
                SET `nom` = ?, `description` = ?, `prix` = ?, `remise` = ?, `stock` = ?, `id_type` = ?, `id_matiere` = ?, `id_couleur` = ?, `remarques` = ?, `id_categorie` = ?, `id_collection` = ? WHERE article.id_article = $id; ";
        $statement = $this->pdo->prepare($req);
        $statement->execute(array($nom, $description, $prix, $remise, $stock, $id_type, $id_matiere, $id_couleur, $remarques, $id_categorie, $id_collection));

        header('Location: /admin/produits');
        exit();
    }

    #[Route(path: "/api/produits/delete/{id}", name: "apiDeleteProduitAdministrateur_page")]
    public function apiDeleteProduitAdministrateur(int $id): string
    {
        // Obtenir le nombre de produits :
        $req = "DELETE FROM article WHERE `article`.`id_article` = $id";
        $statement = $this->pdo->prepare($req);
        $statement->execute();

        header('Location: /admin/produits');
        exit();
    }

}
