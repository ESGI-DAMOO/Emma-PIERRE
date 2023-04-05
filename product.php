<!doctype html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <meta name="viewport"
        content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <title>Emma Pierre - Collier Alexandra</title>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Jost:wght@300;400&family=Noto+Serif&display=swap"
        rel="stylesheet">

    <link rel="stylesheet" href="assets/css/normalize.css">
    <link rel="stylesheet" href="assets/css/variables-color.css">
    <link rel="stylesheet" href="assets/css/style.css">

    <script src="https://code.jquery.com/jquery-3.6.4.min.js"
        integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
</head>

<body>
    <?php require('partial/header.html') ?>

    <main>
        <section id="product">
            <div class="product__container">
                <div class="product__container__img">
                    <img src="./assets/img/products/Collier Alexandra.jpg" alt="Collier Alexandra">
                </div>
                <div class="product__container__description">
                    <h1>Collier Alexandra</h1>
                    <p>Des perles Miuki dorées réchauffent le rose délicat d'une opale et perles de quartz givré, autres
                        composants en plaqué
                        or 24 carats, longeur d'environ 41 à 44 cms, vous serez séduite par son côté précieux</p>
                    <p>Matière : Opale & quartz rose</p>
                    <p>Couleur : Rose doudou</p>
                    <p>Longueur du collier : 45 cm</p>
                    <p>Prix : 65€</p>
                    <button class="btn btn--primary">Ajouter au panier</button>
                </div>
            </div>
        </section>
    </main>

    <?php require('partial/footer.html') ?>
    <script src="assets/js/scripts.js"></script>
</body>

</html>