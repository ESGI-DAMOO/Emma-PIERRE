// --------- //
var header = document.querySelector('.navbar');
var headerHeight = header.offsetHeight;

if (window.innerWidth > 1024) {
    window.onscroll = function () {
        var scrollHeight = window.scrollY || window.scrollTop || document.getElementsByTagName("html")[0].scrollTop;

        if (scrollHeight > 50) {
            header.classList.add('petite');
        } else {
            header.classList.remove('petite');
        }
    };
}



//Ouverture de la barre de recherche
var isSearchOpen = false;
$('#search-loupe').on('click', function () {

    let searchbar = $("#search");

    isSearchOpen = !isSearchOpen;

    if (isSearchOpen) {
        $('#search').animate({ width: '200px', padding: '0 1rem' }, 500);
    } else {
        $('#search').animate({ width: '0px', padding: '0' }, 500);
    }
});

//Prix filtre tous produits
$('#range-price').on('input change', function () {
    let rangeValue = $(this).val();
    $('#input-number').val(rangeValue);
});
$('#input-number').on('keydown mousedown keyup mouseup input change', function () {
    let rangeValued = $(this).val();
    $('#range-price').val(rangeValued);
});

// Affichage du nombre d'articles dans le panier
function updateCartCount() {
    const cartCount = document.querySelector('#cart-count');
    //fetch api /api/cart/count
    try {
        fetch('/api/panier/count', {
            method: 'GET',
            headers: {
                'Content-Type': 'application/json'
            }
        })
            .then((response) => response.json())
            .then((data) => {
                cartCount.innerHTML = data.nbArticles;
            })
            .catch((error) => { console.error(error) })
    }
    catch (error) {
        console.error(error)
    }
}
updateCartCount();

// Bouton ajout au panier
const addToCartBtn = document.querySelector('#add-to-cart')
const textValid = document.querySelector('#product .valide')
if (addToCartBtn) {
    addToCartBtn.addEventListener('click', addToCart);
}
function addToCart() {
    const id = addToCartBtn.dataset.id;
    const data = new FormData();
    data.append('id', id);

    try {
        fetch('/api/panier/add', {
            method: 'POST',
            body: data,
        })
            .then((response) => response.json())
            .then((data) => {
                updateCartCount();
                // Ajoute la classe hide à la div textValid pendant 5 secondes
                textValid.classList.remove('hide');
                setTimeout(function () {
                    textValid.classList.add('hide');
                }
                    , 5000);
            })
            .catch((error) => { console.error(error) })
    }
    catch (error) {
        console.error(error)
    }
}

// Bouton suppression d'un article du panier
const articlesPanier = document.querySelectorAll('.article_panier');
articlesPanier.forEach(article => {
    const deleteBtn = article.querySelector('.panier_delete_article')
    deleteBtn.addEventListener('click', deleteArticle);
    function deleteArticle() {
        const id = article.dataset.id;
        const data = new FormData();
        data.append('id', id);

        try {
            fetch('/api/panier/delete', {
                method: 'POST',
                body: data,
            })
                .then((response) => response.json())
                .then((data) => {
                    updateCartCount();
                    article.remove();
                })
                .catch((error) => { console.error(error) })
        }
        catch (error) {
            console.error(error)
        }
    }
});