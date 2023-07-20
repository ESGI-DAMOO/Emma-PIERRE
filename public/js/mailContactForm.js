// Sélectionnez le formulaire et ajoutez un écouteur d'événements pour l'événement 'submit'
document.getElementById('myForm').addEventListener('submit', function(event) {
    // empêche le comportement par défaut de l'événement submit, qui est de recharger la page
    event.preventDefault();
  
    // récupérez les données du formulaire
    var nom = document.querySelector('.nom').value;
    var prenom = document.querySelector('.prenom').value;
    var email = document.querySelector('.email').value;
    var objet = document.querySelector('.objet').value;
    var message = document.querySelector('textarea[name="message"]').value;
  
    // Faire quelque chose avec les données, par exemple afficher dans la console
    console.log('Nom: ' + nom + ', Prénom: ' + prenom + ', Email: ' + email + ', Objet: ' + objet + ', Message: ' + message);
  });
  