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

      </section>
    </form>

  </main>

  <?php require('partial/footer.html') ?>
  <script src="assets/js/scripts.js"></script>
</body>

</html>