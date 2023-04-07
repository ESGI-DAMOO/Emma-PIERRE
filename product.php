<!doctype html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <meta name="viewport"
        content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <title>Emma Pierre - Collier Alexandra</title>

    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">

    <link rel="stylesheet" href="assets/css/style.css">

    <script src="https://code.jquery.com/jquery-3.6.4.min.js"
        integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
</head>

<body>
    <?php require('partial/header.html') ?>

    <main id="product" class="container">
        <div class="path">
            <p><a href="./index.php">Accueil </a> > <a href="./listing-product.php">Tous les produits </a> > <a
                    href="#">Collier Alexandra</a></p>
        </div>
        <section>
            <div class="product__container">
                <div class="product__container__img">
                    <img src="./assets/img/products/CollierAlexandra.jpg" alt="Collier Alexandra">
                </div>
                <div class="product__container__description">
                    <h1>Collier Alexandra</h1>
                    <p>Des perles Miuki dorées réchauffent le rose délicat d'une opale et perles de quartz givré, autres
                        composants en plaqué
                        or 24 carats, longeur d'environ 41 à 44 cms, vous serez séduite par son côté précieux</p>
                    <p>Matière : Opale & quartz rose</p>
                    <p><span class="circle" style="background-color: pink;"></span> Rose doudou </p>
                    <p>Longueur du collier : 45 cm</p>
                    <p>

                        <span class="prix-sign">€</span>
                        <span class="prix-currency">65</span>
                        <span class="prix-cent">.00</span>
                    </p>
                    <button class="btn btn-bleu">Ajouter au panier</button><br>
                    <button class="btn btn-bleu-transp">Ajouter à ma wishlist</button>
                </div>
            </div>
        </section>
    </main>
    <?php require('partial/feed_insta.html') ?>
    <?php require('partial/footer.html') ?>
    <script src="assets/js/scripts.js"></script>
</body>

</html>