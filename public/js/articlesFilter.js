const filterElements = document.querySelectorAll(".filter");

// Variables pour stocker les valeurs des filtres
let type = [];
let couleur = null;
let prixMin = document.querySelector('#range-price').min;
let prixMax = document.querySelector('#range-price').value;
let dispo = true;
let promo = false;

let colorSelected = document.querySelector('.circle');

function clickColor(event) {
    colorSelected.classList.remove('selected')
    colorSelected = event.target;
    colorSelected.classList.add('selected');
    couleur = event.target.dataset.couleur;
}

function getTypesSelectionnes() {
    return type.join(",");
}

function updateTypesSelectionnes() {
    type = [];
    const filters = document.querySelectorAll("#check-types .filter");

    filters.forEach(element => {
        if (element.checked) {
            type.push(element.id);
        }
    });
    console.log(type);
}

filterElements.forEach(function (element) {
    element.addEventListener("change", function () {
        if (element.type === "checkbox") {
            if (element.id === "dispo") {
                dispo = element.checked;
            } else if (element.id === "promo") {
                promo = element.checked;
            }
            updateTypesSelectionnes();
        } else if (element.id === "range-price") {
            prixMin = element.min;
            prixMax = element.value;
        } else if (element.id === "input-number") {
            prixMax = element.value;
        }

        const data = new FormData();
        data.append('type', getTypesSelectionnes() ?? '');
        data.append('couleur', couleur ?? '');
        data.append('prix_min', prixMin);
        data.append('prix_max', prixMax);
        data.append('dispo', dispo);
        data.append('promo', promo);
        //console.log(type, prixMin, prixMax, dispo, promo);
        fetch('/api/articles', {
            method: 'POST',
            body: data,
        }).then((response) => response.json())
            .then(data => {
                // Traitement des données retournées par la route
                console.log(data); // Vous pouvez faire ce que vous souhaitez avec les données ici
            })
            .catch(error => {
                console.error('Erreur lors de la requête fetch :', error);
            });

    });
});
