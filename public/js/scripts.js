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