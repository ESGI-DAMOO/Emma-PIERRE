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
    <form class="content" action="#" method="post">
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
        <p>Déjà client ? <a href="#" class="lien">Se connecter</a></p>
        <div class="form_livraison">
          <h2>Informations de livraison</h2>
          <div><label for="nom">Nom :</label>
            <input type="text" name="nom">
          </div>
          <div><label for="prenom">Prénom :</label>
            <input type="text" name="prenom">
          </div>
          <div><label for="adresse">Adresse :</label>
            <input type="text" name="adresse" placeholder="Adresse">
          </div>
          <div><label for="complement">Complément d'adresse :</label>
            <textarea name="complement" id="complement" rows="2"
              placeholder="Apt, suite, unité, nom de l'entreprise (facultatif)"></textarea>
          </div>
          <div><label for="codePostal">Code postal :</label>
            <input type="text" name="codePostal" maxlength="5">
          </div>
          <div>
            <label for="ville">Ville :</label>
            <input type="text" name="ville">
          </div>
          <div><label for="tel">Numéro de téléphone :</label>
            <input type="text" name="tel">
          </div>
        </div>
        <div class="form_choix_livr">
          <legend>Adresse de facturation identique à l’adresse de livraison ?</legend>
          <div>
            <label for="addrFacturationDiffOui"><input type="radio" name="addrFacturationDiff"
                id="addrFacturationDiffOui" value="true">
              Oui</label>
            <label for="addrFacturationDiffNon"><input type="radio" name="addrFacturationDiff"
                id="addrFacturationDiffNon" value="false">
              Non</label>
          </div>

        </div>
        <div class="form_livraison">
          <h2>Adresse de facturation</h2>
          <div><label for="adresse_livr">Adresse :</label>
            <input type="text" name="adresse_livr" placeholder="Adresse">
          </div>
          <div><label for="complement_livr">Complément d'adresse :</label>
            <textarea name="complement_livr" id="complement_livr" rows="2"
              placeholder="Apt, suite, unité, nom de l'entreprise (facultatif)"></textarea>
          </div>
          <div><label for="codePostal_livr">Code postal :</label>
            <input type="text" name="codePostal_livr" maxlength="5">
          </div>
          <div>
            <label for="ville_livr">Ville :</label>
            <input type="text" name="ville_livr">
          </div>
        </div>
        <div class="form_payement">
          <h2>Moyens de paiement</h2>
          <div>
            <input type="radio" name="payementMethod" id="cb" value="cb">
            <label for="cb" class="cb">Carte bancaire
              <img src="assets/img/mastercard.png" alt="MasterCard">
              <img src="assets/img/cb.jpg" alt="CB">
              <img src="assets/img/visa.png" alt="Visa">
              <img src="assets/img/American-Expresso-logo.png" alt="AMEX">
            </label>
          </div>
          <h2>Total : 394,40 € TTC</h2>
          <input type="submit" value="Valider mon panier" class="btn btn-bleu">
        </div>
      </section>
    </form>

  </main>

  <?php require('partial/footer.html') ?>
  <script src="assets/js/scripts.js"></script>
</body>

</html>