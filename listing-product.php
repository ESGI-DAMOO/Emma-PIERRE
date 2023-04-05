<!doctype html>
<html lang="fr">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport"
              content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">

        <title>Emma Pierre - Nos produits</title>

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Jost:wght@300;400&family=Noto+Serif&display=swap" rel="stylesheet">

        <link rel="stylesheet" href="assets/css/normalize.css">
        <link rel="stylesheet" href="assets/css/variables-color.css">
        <link rel="stylesheet" href="assets/css/style.css">

        <script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
    </head>
    <body>
        <?php require('partial/header.html') ?>

        <div id="hero_banner">
            <div class="cards_cat">
                <div class="banner-top">
                    <div class="container">
                    <p class="title-h1">Toute la gamme</p>
                        <p class="banner-desc">Découvrez notre gamme de produit</p>
                    </div>
                </div>
            </div>
        </div>

        <div class="container">
            <div class="path">
                <p><a href="#">Accueil </a> > <a href="#">Tous les produits </a></p>
            </div>
            <div class="mini_cat">
                <div class="one">
                    <p>Précieuses</p>
                </div>
                <div class="two">
                    <p>Impertinantes</p>
                </div>
                <div class="tree">
                    <p>Uniques</p>
                </div>
                <div class="for">
                    <p>Colorées</p>
                </div>
            </div>

            <div class="product-list-container">
                <asside>
                    <p>Type de produit</p>
                    <input type="checkbox" />
                    <label></label>
                    <p>Matériaux</p>
                    <p>Prix</p>
                    <p>Disponibilité</p>
                </asside>
                <div class="product-list">
                    <h2>Produits du moment</h2>
                </div>
            </div>
        </div>
        <?php require('partial/footer.html') ?>
        <script src="assets/js/scripts.js"></script>
    </body>
</html>