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
    <main id="contact">
        <div class="container">
            <section>
                <article>
                    <h2>Contact</h2>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                </article>
            </section>
            <section>
                <article>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut vestibulum dui a ante hendrerit, sit amet pulvinar dui lobortis. Nam ornare, magna eu eleifend feugiat, leo ligula porta massa, sit amet feugiat velit nibh rhoncus felis. In in convallis justo. Sed hendrerit nibh eu orci dapibus aliquet. Curabitur non interdum quam. Cras fermentum maximus accumsan. Quisque congue non mi ac volutpat. Morbi consequat, ex a luctus elementum, nisi velit tincidunt eros, nec commodo enim quam ullamcorper justo. Fusce elit lorem, dictum vitae tempus eget, placerat ac erat. Nullam nec ornare metus, id dictum magna. Morbi in tempor eros. Vestibulum interdum bibendum magna ac semper. Nulla elit nisl, hendrerit quis gravida id, egestas non sapien.</p>
                </article>
            </section>
            <section class="sectionFlex">
                <article>
                    <form action="">
                        <h3>Demande d'information</h3>
                        <div class="form-inline">
                            <input class="nom" type="text" placeholder="Nom">
                            <input class="prenom" type="text" placeholder="Prénom">
                        </div>
                        <br>
                        <input class="objet" type="text" placeholder="Objet du message">
                        <br>
                        <textarea name="" id="" cols="30" rows="10">Message</textarea>
                        <div class="submit"><input class="submit" type="submit" value="Envoyer"></div>
                    </form>
                </article>
                <article>
                    <h3>Informations gérérales</h3>
                    <div class="infos">
                        <div>
                            <h4>Horaires d'ouverture</h4>
                            <div class="horairesFlex">
                                <div class="jour">
                                    <p>Lundi</p>
                                    <p>Mardi</p>
                                    <p>Mercredi</p>
                                    <p>Jeudi</p>
                                    <p>Vendredi</p>
                                </div>
                                <div>
                                    <p>9h - 18h</p>
                                    <p>8h - 18h</p>
                                    <p>8h - 18h</p>
                                    <p>8h - 18h</p>
                                    <p>8h - 17h</p>
                                </div>
                            </div>
                        </div>
                        <div class="coordonnees">
                            <h4>Coordonées</h4>
                            <p>mail:aaaaaaaaaaaaaaaaaaaaaaa </p>
                            <p>tel: </p>
                        </div>
                    </div>
                </article>
            </section>
        </div>
    </main>
    <?php require('partial/footer.html') ?>
    </body>
</html>