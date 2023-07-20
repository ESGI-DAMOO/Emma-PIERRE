<?php

namespace App\Controller;

use PDO;
use App\Routing\Attribute\Route;

class AdminController extends AbstractController
{
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

}
