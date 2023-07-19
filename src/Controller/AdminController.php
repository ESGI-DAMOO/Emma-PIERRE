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
        $req = "SELECT COUNT(*) FROM produit";
        $statement = $this->pdo->prepare($req);
        $statement->execute();
        $context['produit'] = $statement->fetch(PDO::FETCH_ASSOC);

        // Rendu du template Twig
        return $this->twig->render('admin/dashboard.twig', $context);
    }

}
