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

  <main id="cart" class="container">
    <div class="path">
      <p><a href="./index.php">Accueil </a> > <a href="./cart.php">Panier </a></p>
    </div>
    <h1>Votre panier</h1>
    <form class="content" action="#">
      <section class="articles_panier">
        <div class="header_articles">
          <div class="titre1">Produit</div>
          <div class="titre2">Prix</div>
        </div>
        <div class="article_panier">
          <div class="panier_image_article"><img src="assets/img/products/CollierAlexandra.jpg" alt="Collier Alexandra">
          </div>
          <div class="panier_titre_article">
            <h2>Collier Alexandra</h2>
          </div>
          <div class="panier_qte_article">
            <p>Qté</p>
            <div class="input-number-container">
              <input id="input-number" class="input-number" type="number" value="2" />
            </div>
            <p>P.U 49.3€</p>
          </div>
          <div class="panier_prix_article">98.60€</div>
          <div class="panier_delete_article"><img src="assets/img/delete.svg" alt=""></div>
        </div>
        <div class="article_panier">
          <div class="panier_image_article"><img src="assets/img/products/CollierAlexandra.jpg" alt="Collier Alexandra">
          </div>
          <div class="panier_titre_article">
            <h2>Collier Alexandra</h2>
          </div>
          <div class="panier_qte_article">
            <p>Qté</p>
            <div class="input-number-container">
              <input id="input-number" class="input-number" type="number" value="2" />
            </div>
            <p>P.U 49.3€</p>
          </div>
          <div class="panier_prix_article">98.60€</div>
          <div class="panier_delete_article"><img src="assets/img/delete.svg" alt=""></div>
        </div>
      </section>
      <section class="form_panier">
        <p>Déjà client ? <a href="#">Se connecter</a></p>
        <div class="formDroite">
          <div>
            <h2>Informations de livraison</h2>
            <label for="nom">Nom</label>
            <input type="text" name="nom"><br>
            <label for="prenom">Prénom</label>
            <input type="text" name="prenom"><br>
            <label for="adresse">Adresse</label>
            <input type="text" name="adresse"><br>
            <label for="complement">Complément d'adresse</label>
            <textarea name="complement" id="complement" cols="30" rows="10"></textarea>
            <label for="codePostal">Code postal</label>
            <input type="text" name="codePostal">
            <label for="ville">Ville</label>
            <input type="text" name="ville"><br>
            <label for="tel">Numéro de téléphone</label>
            <input type="text" name="tel"><br>
          </div>
          <div>
            <legend>Adresse de facturation identique à l’adresse de livraison ?</legend>
            <input type="radio" name="addrFacturationDiff" id="addrFacturationDiffOui" value="true">
            <label for="addrFacturationDiffOui">Oui</label>
            <input type="radio" name="addrFacturationDiff" id="addrFacturationDiffNon" value="false">
            <label for="addrFacturationDiffNon">Non</label>
          </div>
          <div>
            <h2>Adresse de facturation</h2>
            <label for="adresse">Adresse</label>
            <input type="text" name="adresse"><br>
            <label for="complement">Complément d'adresse</label>
            <textarea name="complement" id="complement" cols="30" rows="10"></textarea>
            <label for="codePostal">Code postal</label>
            <input type="text" name="codePostal">
            <label for="ville">Ville</label>
            <input type="text" name="ville">
          </div>
          <div>
            <h2>Moyen de payement</h2>
            <input type="radio" name="payementMethod" id="cb" value="cb">
            <label for="cb">Carte bancaire <img src="" alt="MasterCard"></label>
          </div>
        </div>
      </section>
    </form>

  </main>

  <?php require('partial/footer.html') ?>
  <script src="assets/js/scripts.js"></script>
</body>

</html>