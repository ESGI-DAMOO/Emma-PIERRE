<!DOCTYPE html>
<html>
<head>
    <title>Page d'inscription</title>
</head>
<body>
    <form method="post" action="create_account.php">
        <label for="username">Nom d'utilisateur:</label><br>
        <input type="text" id="username" name="username"><br>
        <label for="password">Mot de passe:</label><br>
        <input type="password" id="password" name="password"><br>
        <label for="confirm_password">Confirmer le mot de passe:</label><br>
        <input type="password" id="confirm_password" name="confirm_password"><br>
        <input type="submit" value="S'inscrire">
    </form>
    <p>Avez-vous déjà un compte? <a href="user-login.php">Se connecter ici</a></p>
</body>
</html>
