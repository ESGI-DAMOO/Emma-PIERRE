const filterElements = document.querySelectorAll(".filter");

// Variables pour stocker les valeurs des filtres
let type = "";
let couleur = "";
let prixMin = "";
let prixMax = "";
let dispo = false;
let promo = false;

let colorSelected = document.querySelector('.circle');

function clickColor(event) {
    colorSelected.classList.remove('selected')
    colorSelected = event.target;
    colorSelected.classList.add('selected');
    couleur = event.target.dataset.couleur;
}

// Ajoutez un "eventListener" à chaque élément filtrant
filterElements.forEach(function (element) {
    element.addEventListener("change", function () {
        // Mettez à jour les variables en fonction de la valeur de l'élément filtrant
        if (element.id === "range-price") {
            prixMin = element.min;
            prixMax = element.value;
        } else if (element.id === "input-number") {
            prixMax = element.value;
        } else if (element.type === "checkbox") {
            if (element.id === "dispo") {
                dispo = element.checked;
            } else if (element.id === "promo") {
                promo = element.checked;
            }
        }

        const url = `/api/articles?type=${type}&couleur=${couleur}&prix_min=${prixMin}&prix_max=${prixMax}&dispo=${dispo}&promo=${promo}`;

        // Appel de la route avec fetch
        fetch(url)
            .then(response => response.json())
            .then(data => {
                // Traitement des données retournées par la route
                console.log(data); // Vous pouvez faire ce que vous souhaitez avec les données ici
            })
            .catch(error => {
                console.error('Erreur lors de la requête fetch :', error);
            });

    });
});