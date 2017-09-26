<?php
require("conexion.php");
$con = conectar();

$ID = $_GET['ID'];
if ($ID == null) {
    echo "Seleccione un usuario";
} else {
    #ELIMINAR DE LA TABLA PERSONAS
    $sql_borrar = "DELETE FROM personas WHERE ID='$ID'";
    $resultado = mysqli_query($con, $sql_borrar);
    
    if ($resultado) {
        #ELIMINAR DE LA TABLA USUARIOS
        $sql_borrar = "DELETE FROM usuarios WHERE ID='$ID'";
        $resultado = mysqli_query($con, $sql_borrar);
        echo "Eliminado con éxito";
    } else {
        echo "El usuario no existe";
    }
}
//mysqli_close();
?>