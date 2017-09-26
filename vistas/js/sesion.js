var obj = new XMLHttpRequest();

obj.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
        var array = this.responseText;
        document.getElementById("sesion").innerHTML = this.responseText;

    } 
};

obj.open("GET", "http://localhost/VI_Semestre/Sesiones/remotas_1.1/php/sesion.php", true);
obj.send();


