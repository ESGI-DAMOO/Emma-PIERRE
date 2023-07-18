// --------- //
var header = $('.navbar');
var headerHeight = header.height();
console.log(headerHeight);
if ($(window).width() > 600) {
    $(window).scroll(function () {
        if ($(this).scrollTop() > 50) {
            header.stop().animate({ height: headerHeight * 0.7 }, 500);
        } else {
            header.stop().animate({ height: headerHeight }, 500);
        }
    });
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


// Liste des pays via l'API https://happyapi.fr/api/getLands
$.ajax({
    url: 'https://happyapi.fr/api/getLands',
    type: 'GET',
    dataType: 'json',
    success: function (data) {
        const select1 = document.querySelector('#pays-select');
        const select2 = document.querySelector('#pays-select_livr');
        const countryList = data.result.result;
        for (let countryCode in countryList) {
            if (countryList.hasOwnProperty(countryCode)) {
                // Créer une nouvelle option
                const opt = document.createElement('option');

                // Définir la valeur et le texte de l'option
                opt.value = countryCode;
                opt.innerHTML = countryList[countryCode];
                if (countryCode === 'FR') {
                    opt.selected = true;
                }
                // Ajouter l'option au select
                select1.appendChild(opt);
                select2.appendChild(opt.cloneNode(true));
            }
        }
    },
    error: function (error) {
        console.log(error);
    }
});

