<?php 
require("conexion.php");
$con = conectar();

$nombre = $_GET['nombre'];
$apellido = $_GET['apellido'];
$email = $_GET['email'];
$genero = $_GET['genero'];
$password = $_GET['password'];
$password2 = $_GET['password2'];
$rol = $_GET['rol'];
$ID = $_GET['id'];

if ($nombre == null || $apellido == null || $email == null || $genero == null 
    || $password == null || $password2 == null || $rol == null || $ID == null) {
    echo "Digite todos los campos";
} else {
    if ($password == $password2) {
        #MODIFICAR EN LA TABLA USUARIOS
        $sql_modificar = "UPDATE usuarios SET email='$email', password='$password', rol='$rol' WHERE ID LIKE '%$ID'";
        $resultdo = mysqli_query($con, $sql_modificar);

        #MODIFICAR EN LA TABLA PERSONAS
        $sql_modificar = "UPDATE personas SET nombre='$nombre', apellido='$apellido', genero='$genero' WHERE ID LIKE '%$ID'";
        $resultdo = mysqli_query($con, $sql_modificar);

        echo "Modificado con éxito";
    } else {
        echo "Las contraseñas no son iguales";    
    }
}
//mysqli_close($con);
?>