<?php
include("conexion.php");

if (isset($_POST['id_curso'])) {
  $id_curso = $_POST['id_curso'];
  $sql_secciones = "SELECT id_seccion, nombre, aula FROM secciones WHERE fkid_curso = $id_curso";
  $result_secciones = $conexion->query($sql_secciones);
  
  $secciones = array();
  while ($row_secciones = $result_secciones->fetch_assoc()) {
    $secciones[] = array(
      'id_seccion' => $row_secciones['id_seccion'],
      'nombre' => $row_secciones['nombre'],
      'aula' => $row_secciones['aula']
    );
  }
  
  echo json_encode($secciones);
}

$conexion->close();
?>