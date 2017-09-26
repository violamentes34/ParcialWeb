<?php
require("conexion.php");

$login_email = $_POST['login-email'];
$login_password = $_POST['login-password'];

echo $login_email."<br>";
echo $login_password;
$con = conectar();

#BUSCAR EN LA TABLA USUARIOS
$sql_guardar = "SELECT * FROM usuarios WHERE email='$login_email' AND password='$login_password'";
$resultado = mysqli_query($con, $sql_guardar);

$fila = mysqli_fetch_array($resultado);
$rol = $fila['rol'];

session_start();
if($rol == "Lectura"){
    //cookie de 10 min
    setcookie("usuario", $login_email, time()+(60*10));
    setcookie("password", $login_password, time()+(60*10));
    $_SESSION['usuario_actual'] = $login_email;
    header('location: vistas/usuario1.html');
} else {
    if($rol == "Lectura y Creacion de usuarios"){
        //cookie de 15 min
        setcookie("usuario", $login_email, time()+(60*15));
        setcookie("password", $login_password, time()+(60*15));
        $_SESSION['usuario_actual'] = $login_email;
        header('location: vistas/usuario2.html');
    } else {
        if($rol == "Lectura, Creacion de usuarios y Edicion de usuarios"){
            //cookie de 20 min
            setcookie("usuario", $login_email, time()+(60*20));
            setcookie("password", $login_password, time()+(60*20));
            $_SESSION['usuario_actual'] = $login_email;
            header('location: vistas/usuario3.html');
        } else {
            if($rol == "Lectura, Creacion de usuarios, Edicion de usuarios y Eliminar"){
                //cookie de 20 min
                setcookie("usuario", $login_email, time()+(60*20));
                setcookie("password", $login_password, time()+(60*20));
                $_SESSION['usuario_actual'] = $login_email;
                header('location: vistas/usuario4.html');
            } else {
                echo "No está registrado";
            }
        }
    }
}

mysqli_close($con);

?>
