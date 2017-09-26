<?php
session_start();
session_destroy();

setcookie("usuario", null, time()-(50));
setcookie("password", null, time()-(50));

header('Location: /remotas_1.1/login.html');
?>