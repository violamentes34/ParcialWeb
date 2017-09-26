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

if ($nombre == null || $apellido == null || $email == null || $genero == null 
    || $password == null || $password2 == null || $rol == null) {
    echo "Digite todos los campos";
} else {
    if ($password == $password2) {
        $email2 = "SELECT * FROM usuarios WHERE email='$email'";
        $resultado = mysqli_query($con, $email);
        $fila = mysqli_fetch_array($resultado);
        $email2 = $fila['email'];

        if ($email == $email2) {
            echo "El email ya está registrado";
        } else {
            #GUARDAR EN LA TABLA USUARIOS
            $sql_guardar = "INSERT INTO usuarios(email, password, rol) VALUES('$email','$password','$rol')";
            $resultado = mysqli_query($con, $sql_guardar);

            #BUSCAR EN LA TABLA USAURIOS EL ID
            $sql_guardar = "SELECT * FROM usuarios WHERE email='$email'";
            $resultado=mysqli_query($con, $sql_guardar);
            while($fila = mysqli_fetch_array($resultado)) {
                $ID = $fila['ID'];
            }

            #GUARDAR EL ID EN LA TABLA PERSONAS
            $sql_guardar = "INSERT INTO personas(nombre, apellido, genero, ID_usuarios) VALUES('$nombre', '$apellido', '$genero','$ID')";
            $resultado = mysqli_query($con, $sql_guardar);
            echo "Registrado con éxito";
        }
    } else {
        echo "Las contraseñas no son iguales";
    }
}
//mysqli_close($con);
?>
