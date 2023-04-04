//Ouverture de la barre de recherche
var isSearchOpen = false;
$('#search-loupe').on('click', function () {

    let searchbar = $("#search");

    isSearchOpen = !isSearchOpen;

    if (isSearchOpen) {
        $('#search').animate({width:'200px', padding: '0 1rem'}, 500);
    } else {
        $('#search').animate({width:'0px', padding: '0'}, 500);
    }
});

// --------- //
var header = $('#img-header');
var headerHeight = header.height();
$(window).scroll(function() {
    if ($(this).scrollTop() > 10) {
        header.animate({height: headerHeight * 0.7}, 100);
    } else {
        header.animate({height: headerHeight}, 100);
    }
});

