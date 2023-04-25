<?php
include("conexion.php");
session_start();

if (!isset($_SESSION['id_estudiante'])) {
  header("Location: login.php");
  exit();
}


$sql_cursos_y_secciones = "SELECT c.id_curso, c.nombre AS nombre_curso, s.id_seccion, s.nombre AS nombre_seccion, s.aula FROM cursos c INNER JOIN secciones s ON c.id_curso = s.fkid_curso";
$result_cursos_y_secciones = $conexion->query($sql_cursos_y_secciones);


if ($_SERVER["REQUEST_METHOD"] == "POST") {
  // Recuperamos los datos del formulario
  $id_estudiante = $_POST["id_estudiante"];
  $id_seccion = $_POST["id_seccion"];
  

  $sql_matricula = "INSERT INTO matriculas (id_estudiante, id_seccion) VALUES (?, ?)";
  $stmt_matricula = $conexion->prepare($sql_matricula);
  $stmt_matricula->bind_param("ii", $id_estudiante, $id_seccion);
  $stmt_matricula->execute();
  

  header("Location: matricula_exitosa.php");
  exit();
}


$conexion->close();
?>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Formulario de matrícula</title>
</head>
<body>
  <h1>Formulario de matrícula</h1>
  <form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
    <label for="id_estudiante">ID del estudiante:</label>
    <input type="number" name="id_estudiante" required>
    <br>
    <label for="id_curso">Curso:</label>
    <select name="id_curso" id="id_curso" required>
      <option value="">Seleccione un curso</option>
      <?php 
        $current_course_id = null;
        while ($row = $result_cursos_y_secciones->fetch_assoc()) {
          // Si es la primera fila o si el id del curso ha cambiado, se imprime el nombre del curso
          if ($current_course_id == null || $current_course_id != $row["id_curso"]) {
            $current_course_id = $row["id_curso"];
            echo '<optgroup label="' . $row["nombre_curso"] . '">';
          }


          echo '<option value="' . $row["id_seccion"] . '">' . $row["nombre_seccion"] . ' - Aula ' . $row["aula"] . '</option>';
        }
      ?>
    </select>
    <br>
    <input type="submit" value="Matricularse">
  </form>
</body>
</html>