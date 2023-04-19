<?php
session_start();
if(isset($_SESSION['user_id'])) {
    header("Location: dashboard.php");
    exit;
}

// Conexión a la base de datos
$db_host = 'localhost';
$db_user = 'usuario';
$db_password = 'contraseña';
$db_name = 'basedatos';
$dsn = "mysql:host=$db_host;dbname=$db_name;charset=utf8mb4";
$options = [
    PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION
];
try {
    $pdo = new PDO($dsn, $db_user, $db_password, $options);
} catch(PDOException $e) {
    die("No se pudo conectar a la base de datos: " . $e->getMessage());
}

// Procesamiento del formulario
if($_SERVER['REQUEST_METHOD'] == 'POST') {
    $email = $_POST['email'];
    $password = $_POST['password'];
    $stmt = $pdo->prepare("SELECT id, email, password FROM users WHERE email=:email");
    $stmt->execute(['email' => $email]);
    $user = $stmt->fetch();
    if($user && password_verify($password, $user['password'])) {
        $_SESSION['user_id'] = $user['id'];
        header("Location: dashboard.php");
        exit;
    } else {
        $_SESSION['error_message'] = "El correo electrónico o la contraseña son incorrectos.";
        header("Location: index.php");
        exit;
    }
}
?>