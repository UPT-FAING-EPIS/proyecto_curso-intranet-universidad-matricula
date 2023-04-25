<?php
include("conexion.php");
if (isset($_POST['id_estudiante']) && isset($_POST['contrasena'])) {
    // Se capturan los valores ingresados por el usuario
    $id_estudiante = $_POST['id_estudiante'];
    $contrasena = $_POST['contrasena'];
  
    $query = "SELECT * FROM Estudiantes WHERE id_estudiante = '$id_estudiante' AND contrasena = '$contrasena'";
    $result = mysqli_query($conexion, $query);
  
    if (mysqli_num_rows($result) == 1) {
      session_start();
      $_SESSION['id_estudiante'] = $id_estudiante;
      header('Location: matricula.php');
      exit();
    } else {
      echo "Usuario o contraseña incorrectos.";
    }
  }
  
  mysqli_close($conexion);
  ?>
  
  <form method="post" action="login.php">
    <label for="id_estudiante">ID de Estudiante:</label>
    <input type="text" name="id_estudiante" id="id_estudiante" required>
    <br>
    <label for="contrasena">Contraseña:</label>
    <input type="password" name="contrasena" id="contrasena" required>
    <br>
    <input type="submit" value="Iniciar sesión">
  </form>
