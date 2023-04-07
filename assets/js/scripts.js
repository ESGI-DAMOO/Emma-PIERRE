// --------- //
var header = $('.navbar');
var headerHeight = header.height();
console.log(headerHeight);
$(window).scroll(function () {
    if ($(this).scrollTop() > 50) {
        header.stop().animate({ height: headerHeight * 0.7 }, 500);
    } else {
        header.stop().animate({ height: headerHeight }, 500);
    }
});

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



