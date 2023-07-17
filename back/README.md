# TP PHP - Les Meilleurs restaurants

<aside>
👬 Maxime Hinderschiette & Olivier Perdrix

</aside>

# Installation

```bash
git clone https://github.com/operdrix/projet-php.git
composer install
```

# Paramétrage

- Faire une copie du fichier `.env` et nommer la copie `.env.local`
- Modifier les valeurs pour la connexion à la BDD
- Un modèle de BDD est disponible à la racine dans le fichier `projetphp.sql`

# Lancement de l’application

```bash
composer start
# Se rendre sur l'URL http://localhost:8000/ ou http://127.0.0.1:8000/
```

# Technologies utilisées

- PHP
- Twig
- PDO
- MySql
- PHPStan

# Explications de notre projet

Le but était de créer une ébauche de site de voting pour des restaurants.

Nous avons donc une page d’accueil affichant les restaurants, une page d’ajout d’un nouveau restaurant et une page d’affichage d’un restaurant avec ses avis et un formulaire pour poster un nouvel avis.

Dans cette ébauche, ne sont pas traités : la connexion utilisateur ou administrateur, la suppression de restaurants ou d’avis, la modification des informations d’un restaurant.

Nous avons un seul controller appelé `RestaurantController.php` qui gère toutes les routes de notre restaurant.

Le Router de notre application créé automatiquement les routes grace aux attributs des méthodes du controller.

Par exemple :

```php
#[Route(path: "/restau/{id}", name: 'getOneRestaurant', httpMethod: "GET")]
public function getOneRestaurant(int $id): string
{ ... }
```

Cet attribut va créer une route dynamique /restaurant/{id} où id correspond à l’ID du restaurant.

En cas d’ID de restaurant non trouvé, une page d’erreur 404 est affichée

```php
if (!$restaurant) {
	$context['page'] = array(
		'titre' => 'Page non trouvée',
	);
	return $this->twig->render('erreur404.html.twig', $context);
}
```

Aussi, nous avons utilisé dans certaines parties de notre code le package composer PHPStan qui est un utilitaire permettant d’analyser notre code PHP sans l’exécuter afin d’émettre différents conseils et optimisation pour notre code. Nous avons utilisé le niveau 6 d’exigence sur les fonctions les plus complexes (voir fichier de configuration phpstan.neon, présent à la racine du repository).

Pour exécuter le test, entrer la commande suivante :

```bash
composer phpstan
```

https://phpstan.org/

# Difficultés rencontrées

### Le routing

Pour notre projet, nous avions besoin d’un routing dynamique qui n’était pas implémenté dans notre base de projet MVC.

Il a fallu faire de nombreux tests, recherches et débogage afin de réussir à le créer.

Maintenant, la méthode `registerRoutes`, appelée à l’ouverture du projet, parcours tous les fichiers controllers à la recherche d’attributs de classe ou de méthodes et enregistre tous les paramètres dans la liste des routes.

De cette manière, lorsqu’une route est appelée par une méthode GET ou POST, la méthode `Execute`, via la méthode `getRoute`, vérifie l’existance d’une route en prenant en compte les paramètres dynamiques.

### Les fichiers statics

Nous n’avons pas réussi à l’heure actuelle à permettre à nos templates Twig de récupérer le contenu des dossiers `public/css` et `public/img`

# Améliorations à apporter

Pour la partie UI du site, nous avons fait au plus simple en utilisant Bootstrap. L’interface serait bien sûr à améliorer 🙂

Une connexion utilisateur et administrateur pour gérer qui poste des commentaires et qui peut ajouter de nouveaux restaurants ou en supprimer

Afin de produire un code plus propre et plus sécurisé, nous aurions dû séparer nos requêtes SQL dans une classe spécifique (service) qui aurait permis une meilleure lisibilité en appelant directement la méthode lié à la requête que nous souhaitons exécuter.

Il manque certaines vérification PHP que nous avons décidé de volontairement ne pas intégrer afin de respecter le délai de rendu du projet. Notamment le traitement des erreurs (en retournant un message a l’utilisateur) ou encore la validation des formulaires (afin de s’assurer que tous les champs soient bien remplis).

Ce projet aurait pus être réalisé à l’aide symfony notamment grâce au package formulaire de symfony ainsi que le système déjà présent de routing qui nous aurait permis de faciliter la gestion et le développement de notre application.
