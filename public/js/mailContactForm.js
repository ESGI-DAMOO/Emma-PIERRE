document.getElementById('submit').addEventListener('click', function(event) {
// Empêche le comportement par défaut de l'événement de clic, qui est d'envoyer le formulaire
event.preventDefault();
  
// Ajoute le message de confirmation d'envoie
document.getElementById('message').textContent = 'Merci, votre message à bien été envoyé';
});