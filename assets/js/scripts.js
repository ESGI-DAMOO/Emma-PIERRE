// --------- //
var header = $('#img-header');
var headerHeight = header.height();
$(window).scroll(function() {
    if ($(this).scrollTop() > 50) {
        console.log($(this).scrollTop())
        header.stop().animate({height: headerHeight * 0.7}, 500);
    } else {
        header.stop().animate({height: headerHeight}, 500);
    }
});

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

