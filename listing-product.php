<!doctype html>
<html lang="fr">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport"
              content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">

        <title>Emma Pierre - Nos produits</title>

        <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
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
                <div>
                    <p>Précieuses</p>
                </div>
                <div>
                    <p>Impertinantes</p>
                </div>
                <div>
                    <p>Uniques</p>
                </div>
                <div>
                    <p>Colorées</p>
                </div>
            </div>

            <div class="product-list-container">
                <asside>
                    <p>Type de produit</p>
                    <div>
                        <input id="collier" type="checkbox" />
                        <label for="collier">Collier</label>
                    </div>
                    <div>
                        <input id="bo" type="checkbox" />
                        <label for="bo">Boucles d'oreilles</label>
                    </div>
                    <div>
                        <input id="bracelets" type="checkbox" />
                        <label for="bracelets">Bracelets</label>
                    </div>
                    <div>
                        <input id="razducoup" type="checkbox" />
                        <label for="razducoup">Raz-du-cou</label>
                    </div>
                    <div>
                        <input id="sautoir" type="checkbox" />
                        <label for="sautoir">Sautoir</label>
                    </div>

                    <p>Matériaux</p>

                    <span class="circle selected" style="background-color: pink;"></span>
                    <span class="circle" style="background-color: #4CB7A5;"></span>
                    <span class="circle" style="background-color: #F7645D;"></span>
                    <span class="circle" style="background-color: #C3B89C;"></span>
                    <span class="circle" style="background: linear-gradient(90deg, #FF0000 0%, #FFA800 10.42%, #ADFF00 20.83%, #00FF85 32.81%, #00F0FF 45.83%, #0057FF 58.85%, #6100FF 70.83%, #FF00B8 83.33%, #FF0000 100%);"></span>
                    <span class="circle" style="background: url('assets/img/plus.svg')"></span>

                    <p>Prix</p>
                    <div>
                        <input id="range-price" type="range" step="1" max="200" min="0" value="200"/>
                    </div>
                    <div class="price-choose">
                        <div class="input-number-container">
                            <span class="input-number-prefix">€</span>
                            <input id="" class="input-number" type="number" max="200" value="0" disabled/>
                        </div>
                        <span>-</span>
                        <div class="input-number-container">
                            <span class="input-number-prefix">€</span>
                            <input id="input-number" class="input-number" max="200" type="number" value="200"/>
                        </div>
                    </div>

                    <p>Disponibilité</p>
                    <div>
                        <input id="dispo" type="checkbox" />
                        <label for="dispo">Disponible</label>
                    </div>
                    <div>
                        <input id="hstock" type="checkbox" />
                        <label for="hstock">Hors stock</label>
                    </div>

                    <p>Promotion</p>
                    <div>
                        <input id="promo" type="checkbox" />
                        <label for="promo">Promotion</label>
                    </div>
                    <div>
                        <input id="remises" type="checkbox" />
                        <label for="remises">Remises spéciales</label>
                    </div>
                </asside>
                <div class="product-list">
                    <h2>Produits du moment</h2>

                    <div class="container-list-produit">
                        <div class="produit-card">
                            <div class="product-hover">
                                <img class="boucle-doreilles" src="assets/img/products/25142.jpg" alt="Création de Bijoux"/>
                                <div class="product-hover-contain">
                                    <a href="product.php" class="product-hover-button btn btn-bleu">Voir le produit</a>
                                </div>
                            </div>
                            <div class="infos">
                                <div class="titre_produit">
                                    <p>Boucle d'oreilles</p>
                                </div>
                                <div class="prix_produit">
                                    <p>49.3€</p>
                                </div>
                            </div>
                        </div>

                        <div class="produit-card">
                            <div class="product-hover">
                                <img class="boucle-doreilles" src="assets/img/products/25143.jpg" alt="Création de Bijoux"/>
                                <div class="product-hover-contain">
                                    <a href="product.php" class="product-hover-button btn btn-bleu">Voir le produit</a>
                                </div>
                            </div>
                            <div class="infos">
                                <div class="titre_produit">
                                    <p>Boucle d'oreilles</p>
                                </div>
                                <div class="prix_produit">
                                    <p>49.3€</p>
                                </div>
                            </div>
                        </div>

                        <div class="produit-card">
                            <div class="product-hover">
                                <img class="boucle-doreilles" src="assets/img/products/25144.jpg" alt="Création de Bijoux"/>
                                <div class="product-hover-contain">
                                    <a href="product.php" class="product-hover-button btn btn-bleu">Voir le produit</a>
                                </div>
                            </div>
                            <div class="infos">
                                <div class="titre_produit">
                                    <p>Boucle d'oreilles</p>
                                </div>
                                <div class="prix_produit">
                                    <p>49.3€</p>
                                </div>
                            </div>
                        </div>

                        <div class="produit-card">
                            <div class="product-hover">
                                <img class="boucle-doreilles" src="assets/img/products/25145.jpg" alt="Création de Bijoux"/>
                                <div class="product-hover-contain">
                                    <a href="product.php" class="product-hover-button btn btn-bleu">Voir le produit</a>
                                </div>
                            </div>
                            <div class="infos">
                                <div class="titre_produit">
                                    <p>Boucle d'oreilles</p>
                                </div>
                                <div class="prix_produit">
                                    <p>49.3€</p>
                                </div>
                            </div>
                        </div>

                        <div class="produit-card">
                            <div class="product-hover">
                                <img class="boucle-doreilles" src="assets/img/products/25146.jpg" alt="Création de Bijoux"/>
                                <div class="product-hover-contain">
                                    <a href="product.php" class="product-hover-button btn btn-bleu">Voir le produit</a>
                                </div>
                            </div>
                            <div class="infos">
                                <div class="titre_produit">
                                    <p>Boucle d'oreilles</p>
                                </div>
                                <div class="prix_produit">
                                    <p>49.3€</p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="pagination">
                        <span class="arrow-prev"></span>
                        <ul>
                            <a href="#"><li class="pagination-current">1</li></a>
                            <a href="#"><li>1</li></a>
                            <a href="#"><li>1</li></a>
                            <li>...</li>
                            <a href="#"><li>15</li></a>
                        </ul>
                        <span class="arrow-next"></span>
                    </div>

                </div>
            </div>
        </div>
        <?php require('partial/footer.html') ?>
        <script src="assets/js/scripts.js"></script>
    </body>
</html>