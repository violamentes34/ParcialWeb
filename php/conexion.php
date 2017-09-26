<?php
function conectar() {
    $user = "root";
    $password = "";    
    $hostname = "localhost";//servidor
    $database = "sesiones";
/* 
    $user = 'id2653375_admin123';
    $password = 'pancho14';
    $hostname = 'localhost';//servidor
    $database = 'id2653375_sesiones';

    $user = "eshos_20647769";
    $password = "pancho14";    
    $hostname = "ftp.eshost.com.ar";//servidor
    $database = "eshos_20647769_sesiones";
*/    
    $conexion = mysqli_connect($hostname, $user, $password, $database);
    /*if(!$conexion) {
        echo 'Error al conectar a la base de datos<br>';
    } else {
        echo 'Conectado a la base de datos<br>';
    }*/
    return $conexion;
}
?>
