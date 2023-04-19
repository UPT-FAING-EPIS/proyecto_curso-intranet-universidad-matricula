<?php
session_start();
if(!isset($_SESSION['user_id'])) {
    header("Location: index.php");
    exit;
}
?>
<!DOCTYPE html>
<html>
<head>
    <title>Panel de control</title>
</head>
<body>
    <h1>Bienvenido al panel de control</h1>
    <p>Su ID de usuario es: <?php echo $_SESSION['user_id']; ?></p>
    <form method="post" action="logout.php">
        <button type="submit">Cerrar sesión</button>
    </form>
</body>
</html>