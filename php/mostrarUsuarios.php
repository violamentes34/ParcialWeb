<?php 
require("conexion.php");
$con = conectar();

$persona = $_GET['persona'];
$buscar = $_GET['buscar'];

if ($persona == "Nombre" || $persona == "Apellido") {
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
    
    echo "<table class='table table-striped'>
        <thead>
            <tr>    
                <th>ID</th>
                <th>Nombre</th>
                <th>Apellido</th>
                <th>Género</th>
                <th>E-mail</th>
                <th>Rol</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td id='ID'>".$ID_personas."</td>
                <td id='nombre'>".$nombre."</td>
                <td id='apellido'>".$apellido."</td>
                <td id='genero'>".$genero."</td>
                <td id='email'>".$email."</td>
                <td id='rol'>".$rol."</td>                            
            </tr>
        </tbody>
    </table>";  
} else {
    if ($persona == "Email") {        
        $sql_buscar = "SELECT * FROM usuarios WHERE email='$buscar'";
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
        
        echo "<table class='table table-striped'>
        <thead>
            <tr>    
                <th>ID</th>
                <th>Nombre</th>
                <th>Apellido</th>
                <th>Género</th>
                <th>E-mail</th>
                <th>Rol</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td id='ID'>".$ID_personas."</td>
                <td id='nombre'>".$nombre."</td>
                <td id='apellido'>".$apellido."</td>
                <td id='genero'>".$genero."</td>
                <td id='email'>".$email."</td>
                <td id='rol'>".$rol."</td>                            
            </tr>
        </tbody>
    </table>";
    }
}
/*} else {*/
    $sql_buscar = "SELECT * FROM personas";
    $resultado = mysqli_query($con, $sql_buscar);

    while($fila = mysqli_fetch_array($resultado)){
        $ID_personas = $fila['ID'];
        $nombre = $fila['nombre'];
        $apellido = $fila['apellido'];
        $genero = $fila['genero'];
        $ID_usuarios = $fila['ID_usuarios'];
    }

    $sql_buscar = "SELECT * FROM usuarios";
    $resultado = mysqli_query($con, $sql_buscar);
    while($fila = mysqli_fetch_array($resultado)){
        $email = $fila['email']; 
        $password = $fila['password'];
        $rol = $fila['rol'];
    }    
/*}*/
?>
