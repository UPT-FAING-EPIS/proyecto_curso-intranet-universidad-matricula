<?php
session_start();
if(isset($_SESSION['user_id'])) {
    header("Location: dashboard.php");
    exit;
}
?>
<!DOCTYPE html>
<html>
<head>
    <title>Inicio de sesión</title>
</head>
<body>
    <h1>Iniciar sesión</h1>
    <?php
    if(isset($_SESSION['error_message'])) {
        echo '<p style="color:red">'.$_SESSION['error_message'].'</p>';
        unset($_SESSION['error_message']);
    }
    ?>
    <form method="post" action="login.php">
        <p>
            <label for="email">Correo electrónico:</label>
            <input type="email" id="email" name="email" required>
        </p>
        <p>
            <label for="password">Contraseña:</label>
            <input type="password" id="password" name="password" required>
        </p>
        <p>
            <button type="submit">Iniciar sesión</button>
        </p>
    </form>
</body>
</html>