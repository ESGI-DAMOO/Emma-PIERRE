<!doctype html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <meta name="viewport"
        content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <title>Emma Pierre - Blog</title>

    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">

    <link rel="stylesheet" href="assets/css/style.css">

    <script src="https://code.jquery.com/jquery-3.6.4.min.js"
        integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
</head>

<body>
    <?php require('partial/header.html') ?>

    <main id="blog">
        <div class="banniere">
            <div class="carre">
                <h1>BLOG</h1>
            </div>
        </div>
        <div class="container">
            <div class="path container">
                <p><a href="./index.php">Accueil </a> > <a href="#">Tous les produits </a></p>
            </div>
            <div id="presentation">
                <div class="image">
                    <img src="assets/img/products/CollierPerleNoeud.jpg" alt="Création de Bijoux"/>
                </div>
                <div class="content">
                    <h2>Bienvenue sur notre blog</h2>
                    <p>Ici, nous partageons notre passion pour les bijoux et nous explorons les tendances actuelles, les styles intemporels et les techniques artisanales. Que vous soyez un amateur de bijoux ou un collectionneur passionné, nous sommes là pour vous inspirer et vous guider dans le monde fascinant des bijoux.</p>
                </div>
            </div>
            <div class="articles">
                <h2>Nos Derniers articles</h2>
                <div class="card_article_x3">
                    <div class="card_inner">
                        <img src="assets/img/products/CollierContrePlongee.jpg" alt="Création de Bijoux"/>
                        <h3>Choisir sa bague</h3>
                        <p>Les bagues en pierres précieuses sont un choix populaire pour les occasions spéciales, comme les fiançailles ou les anniversaires.</p>
                        <a href="#" target="_blank">
                            <div class="btn btn-bleu">
                                Lire plus
                            </div>
                        </a>
                    </div>
                    <div class="card_inner">
                        <img src="assets/img/products/CollierFondBeige.jpg" alt="Création de Bijoux"/>
                        <h3>Nos choix de colliers</h3>
                        <p>Les colliers de perles sont des bijoux intemporels qui apportent une touche d'élégance à n'importe quelle tenue. Les perles sont disponibles dans une variété de tailles, de formes et de couleurs, ce qui permet de créer des colliers uniques et personnalisés.</p>
                        <a href="#" target="_blank">
                            <div class="btn btn-bleu">
                                Lire plus
                            </div>
                        </a>
                    </div>
                    <div class="card_inner">
                        <img src="assets/img/products/BoucleBroderie.jpg" alt="Création de Bijoux"/>
                        <h3>Prquoi choisir l'argent ?</h3>
                        <p>Les boucles d'oreilles en argent sterling sont un choix polyvalent et élégant pour les femmes de tous âges. Les boucles d'oreilles en argent sterling sont faciles à assortir avec d'autres bijoux.</p>
                        <a href="#" target="_blank">
                            <div class="btn btn-bleu">
                                Lire plus
                            </div>
                        </a>
                    </div>
                </div>
            </div>
            <div class="articles_ligne">
                <div class="card_inner">
                    <div class="image">
                        <img src="assets/img/products/PierresNature.jpg" alt="Création de Bijoux"/>
                    </div>
                    <div class="content">
                        <h3>Choisir sa bague</h3>
                        <p>Les bagues en pierres précieuses sont un choix populaire pour les occasions spéciales, comme les fiançailles ou les anniversaires.</p>
                        <a href="#" target="_blank">
                            <div class="btn btn-bleu">
                                Lire plus
                            </div>
                        </a>
                    </div>
                </div>
                <hr>
                <div class="card_inner">
                    <div class="image">
                        <img src="assets/img/products/PerleJaune.jpg" alt="Création de Bijoux"/>
                    </div>
                    <div class="content">
                        <h3>Choisir sa bague</h3>
                        <p>Les bagues en pierres précieuses sont un choix populaire pour les occasions spéciales, comme les fiançailles ou les anniversaires.</p>
                        <a href="#" target="_blank">
                            <div class="btn btn-bleu">
                                Lire plus
                            </div>
                        </a>
                    </div>
                </div>
            </div>
            <div class="btn-seul">
                <a href="#" target="_blank">
                    <div class="btn btn-bleu">
                        Voir plus de posts
                    </div>
                </a>
            </div>
        </div>
    </main>
    <?php require('partial/feed_insta.html') ?>
    <?php require('partial/footer.html') ?>
    <script src="assets/js/scripts.js"></script>
</body>

</html>