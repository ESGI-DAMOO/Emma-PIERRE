<!doctype html>
<html lang="fr">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport"
              content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">

        <title>Emma Pierre - Bijoux en pierre</title>

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
                <div class="card_cat one">
                    <p class="title-h1">Les précieuses</p>
                    <div class="btn btn-bleu">
                        Voir les produits
                    </div>
                </div>
                <div class="card_cat two">
                    <p class="title-h1">Les impertinantes</p>
                    <div class="btn btn-bleu">
                        Voir les produits
                    </div>
                </div>
                <div class="card_cat tree">
                    <p class="title-h1">Les uniques</p>
                    <div class="btn btn-bleu">
                        Voir les produits
                    </div>
                </div>
                <div class="card_cat for">
                    <p class="title-h1">Les colorées</p>
                    <div class="btn btn-bleu">
                        Voir les produits
                    </div>
                </div>
            </div>
        </div>

        <div class="container">
            <div id="texte_intro">
                <div class="chapo">
                    <h1>EMMA PIERRE Création</h1>
                    <p class="lead">Bienvenue sur le site EMMA PIERRE, où l'art et la passion se rencontrent pour créer des pièces exceptionnelles qui transcendent le temps. Nous sommes ravis de vous présenter notre collection exquise de bijoux haut de gamme, minutieusement conçue avec les meilleurs matériaux et une attention particulière aux détails. Nous sommes convaincus que vous trouverez la pièce parfaite qui vous permettra de vous démarquer et de rayonner en toute occasion.</p>
                </div>
            </div>

            <div id="produits">
                <h2>Produits du moment</h2>
            </div>

           <div id="propos">
                <div class="image_propos">
                    <img src="https://picsum.photos/200/301" alt="Création de Bijoux"/>
                </div>
                <div class="contenu_propos">
                    <h2>Qui sommes-nous ?</h2>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque porta commodo velit in tristique. Donec lacus ex, dignissim nec ultricies et, feugiat at felis. Fusce placerat neque eget elit pretium vestibulum a nec diam.</p>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque porta commodo velit in tristique. Donec lacus ex, dignissim nec ultricies et, feugiat at felis. Fusce placerat neque eget elit pretium vestibulum a nec diam.</p>
                    <div class="btn btn-bleu">
                        En savoir plus
                    </div>
                </div>
           </div>

           <div id="banniere_devis">
                <div class="content">
                    <h2>Demandez votre devis personnalisé</h2>
                    <div class="btn btn-bleu">
                        Contactez-nous
                    </div>
                </div>
           </div>

            <div id="texte_intro">
                <div class="chapo">
                    <h2>Nos concevons également des bijoux sur-mesure</h2>
                    <p class="lead">la créativité ne connaît pas de limites. Nous sommes fiers de concevoir des bijoux uniques et sur-mesure pour nos clients, en utilisant les meilleurs matériaux et en combinant notre savoir-faire avec leurs idées et préférences. Si vous cherchez à offrir un cadeau spécial à un être cher, ou si vous voulez vous faire plaisir en vous offrant un bijou unique, n'hésitez pas à nous contacter. Nous serons ravis de vous aider à créer quelque chose de beau et de précieux qui durera toute une vie.</p>
                </div>
            </div>

            <div id="feed_insta">
                <div class="img_insta">
                    <img src="https://picsum.photos/seed/picsum/200/300" alt="Création de Bijoux"/>
                </div>
                <div class="img_insta">
                    <img src="https://picsum.photos/id/237/200/300" alt="Création de Bijoux"/>
                </div>
                <div class="img_insta">
                    <img src="https://picsum.photos/200/300" alt="Création de Bijoux"/>
                </div>
                <div class="img_insta">
                    <img src="https://picsum.photos/200/300/" alt="Création de Bijoux"/>
                </div>
            </div>
        </div>

        <?php require('partial/footer.html') ?>
        <script src="assets/js/scripts.js"></script>
    </body>
</html>