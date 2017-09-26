<?php 
require("conexion.php");
$con = conectar();

$buscar_por = $_GET['buscar_por'];
$buscar = $_GET['buscar'];

if($buscar_por == "Nombre" || $buscar_por == "Apellido") {
    $sql_buscar = "SELECT * FROM personas WHERE nombre LIKE '%$buscar' OR apellido LIKE '%$buscar'";
    $resultado = mysqli_query($con, $sql_buscar);
    $fila = mysqli_fetch_array($resultado);
    $ID_personas = $fila['ID'];
    $nombre = $fila['nombre'];
    $apellido = $fila['apellido'];
    $genero = $fila['genero'];
    $ID_usuarios = $fila['ID_usuarios'];

    $sql_buscar = "SELECT * FROM usuarios WHERE ID='$ID_usuarios'";
    $resultado = mysqli_query($con, $sql_buscar);
    $fila = mysqli_fetch_array($resultado);
    $email = $fila['email']; 
    $password = $fila['password'];
    $rol = $fila['rol'];
   
    echo $nombre.','.$apellido.','.$email.','.$genero.','.$rol.','.$ID_personas.','.$password;
    
} else {
    if ($buscar_por == "Email") {        
        $sql_buscar = "SELECT * FROM usuarios WHERE email LIKE '%$buscar'";
        $resultado = mysqli_query($con, $sql_buscar);
        $fila = mysqli_fetch_array($resultado);
        $ID_usuarios = $fila['ID'];
        $email = $fila['email'];
        $password = $fila['password'];
        $rol = $fila['rol'];

        $sql_buscar = "SELECT * FROM personas WHERE ID_usuarios='$ID_usuarios'";
        $resultado = mysqli_query($con, $sql_buscar);
        $fila = mysqli_fetch_array($resultado);
        $ID_personas = $fila['ID'];
        $nombre = $fila['nombre'];
        $apellido = $fila['apellido'];
        $genero = $fila['genero'];
        $ID_usuarios = $fila['ID_usuarios'];
        
        echo $nombre.','.$apellido.','.$email.','.$genero.','.$rol.','.$ID_personas.','.$password;        
    }
}
?>