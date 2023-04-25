<?php
// Datos de conexión a la base de datos
$servidor = "localhost"; // Nombre del servidor donde se aloja la base de datos
$usuario = "root"; // Nombre de usuario para acceder a la base de datos
$password = ""; // Contraseña para acceder a la base de datos
$base_datos = "sistema_matricula"; // Nombre de la base de datos

// Conexión a la base de datos
$conexion = mysqli_connect($servidor, $usuario, $password, $base_datos);

// Verificar si hay error en la conexión
if (mysqli_connect_errno()) {
    echo "Error al conectar a la base de datos: " . mysqli_connect_error();
    exit();
}
?>