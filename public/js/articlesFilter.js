const filterElements = document.querySelectorAll(".filter");

// Variables pour stocker les valeurs des filtres
let type = [];
let couleur = null;
let prixMin = document.querySelector('#range-price').min;
let prixMax = document.querySelector('#range-price').value;
let dispo = true;
let promo = false;

let colorSelected = document.querySelector('.circle');

function clickColor(element) {
    colorSelected.classList.remove('selected')
    if (colorSelected !== element) {
        colorSelected = element;
        colorSelected.classList.add('selected');
        couleur = element.dataset.couleur;
    } else {
        couleur = null;
    }
}

function getTypesSelectionnes() {
    return type.join(",");
}

function updateTypesSelectionnes() {
    type = [];
    const filters = document.querySelectorAll(".type:checked");

    filters.forEach(element => {
            type.push(element.dataset.type);
    });
}

filterElements.forEach(function (element) {
    if(element.classList.contains("circle")) {
        element.addEventListener("click", () => filter(element))
    } else {
        element.addEventListener("change", () => filter(element))
    }

});

function filter(element) {
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
    } else if (element.classList.contains('circle')) {
        clickColor(element)
    }

    console.log(type, couleur, prixMax, dispo, promo);

    const data = new FormData();
    data.append('type', getTypesSelectionnes() ?? '');
    data.append('couleur', couleur ?? '');
    data.append('prix_min', prixMin);
    data.append('prix_max', prixMax);
    data.append('dispo', dispo);
    data.append('promo', promo);

    fetch('/api/articles', {
        method: 'POST',
        body: data,
    }).then((response) => response.json())
        .then(data => {
            // Traitement des données retournées par la route
            const container = document.querySelector('.container-list-produit');
            container.innerHTML = "";
            if (data.articles.length === 0) {
                container.innerHTML = `<p> Il n'y pas d'articles correspondant à vos critères </p>`;
            } else {
                data.articles.forEach(article => {
                    const div = document.createElement('div');
                    div.className = "produit-card"
                    //debugger
                    let url = article.photos != null ? JSON.parse(article.photos)[0].url : "/img/products/collier1.jpg";
                    if (!testUrl(url)) {
                        url = "/img/products/collier1.jpg";
                    }
                    div.innerHTML = `
                    <div class="product-hover">
                        <img class="boucle-doreilles" src="${url}" alt="${article.nom}"/>
                        <div class="product-hover-contain">
                            <a href="/article/${article.id_article}" class="product-hover-button btn btn-bleu">Voir le produit</a>
                        </div>
                    </div>
                    <div class="infos">
                        <div class="titre_produit">
                            <p>${article.type} ${article.nom}</p>
                        </div>
                        <div class="prix_produit">
                            <p>${article.prix}€</p>
                        </div>
                    </div>
                    `;
                    container.appendChild(div);
                });
            }
        })
        .catch(error => {
            console.error('Erreur lors de la requête fetch :', error);
        });
    console.log(data)
}

function testUrl(url) {
    // debugger
    fetch(url)
        .then(response => {
            if (response.status === 404) {
                return false
            } else {
                return true
            }
        })
        .catch(error => {
            return false
        });
}
