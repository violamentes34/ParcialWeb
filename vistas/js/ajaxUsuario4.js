var obj = new XMLHttpRequest();

function iniciarSesion() {
    var email = arguments[0];
	var password = arguments[1];
    obj.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
            var php = this.responseText;
            alert(php);
            document.getElementById("prueba").innerHTML = this.responseText;
		} 
    };
    
    obj.open("GET", "http://localhost/remotas_1.1/php/login.php?login_email="+email+"&login_password="+password, true);
    obj.send(); 
}

function verUsuario() {  
    var buscar_por = arguments[0];
	var buscar = arguments[1];
    obj.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
            var php = this.responseText;
            var array = php.split(",");
			document.getElementById("ver-nombre").value = array[0];
            document.getElementById("ver-apellido").value = array[1];
            document.getElementById("ver-email").value = array[2];
            document.getElementById("ver-genero").value = array[3];
            document.getElementById("ver-rol").value = array[4];
            document.getElementById("ver-id").value = array[5];
		} 
    };
    
    obj.open("GET", "http://localhost/remotas_1.1/php/verUsuario.php?buscar_por="+buscar_por+"&buscar="+buscar, true);
    obj.send();    
}


function datosTablaUsuario() {
	var buscar_persona = arguments[0];
	var buscar = arguments[1];	
    
    obj.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {            
			document.getElementById("tabla_registros").innerHTML = this.responseText;
		} 
    };
    
    obj.open("GET", "http://localhost/remotas_1.1/php/mostrarUsuarios.php?persona="+buscar_persona+"&buscar="+buscar, true);
	obj.send();
    verUsuario(buscar_persona, buscar);
}


function verModificarUsuario() {  
    var buscar_por = arguments[0];
	var buscar = arguments[1];
    obj.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
			var php = this.responseText;
            var array = php.split(",");
			document.getElementById("md_nombre").value = array[0];
            document.getElementById("md_apellido").value = array[1];
            document.getElementById("md_email").value = array[2];
            //document.getElementById("md_genero").value = array[3];
            document.getElementById("md_password").value = array[6];
            document.getElementById("md_password2").value = array[6];
            //document.getElementById("md_rol").value = array[4];
            document.getElementById("md_id").value = array[5];
            /*
            if (array[3] == "Masculino") {
                alert('si');
                document.getElementById("male").focus();
            }*/
            
		} 
    };
    
    obj.open("GET", "http://localhost/remotas_1.1/php/verUsuario.php?buscar_por="+buscar_por+"&buscar="+buscar, true);
	obj.send();
}

function modificarUsuario() {
    var nombre = arguments[0];
	var apellido = arguments[1];
    var email = arguments[2];
    var genero = arguments[3];
    var password = arguments[4];
    var password2 = arguments[5];
    var rol = arguments[6];
    var id = arguments[7];
    obj.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
			var php = this.responseText;
            alert(php);
            /*
            var array = php.split(",");
			document.getElementById("md_nombre").value = array[0];
            document.getElementById("md_apellido").value = array[1];
            document.getElementById("md_email").value = array[2];
            //document.getElementById("md_genero").value = array[3];
            document.getElementById("md_password").value = array[6];
            document.getElementById("md_password2").value = array[6];
            //document.getElementById("md_rol").value = array[4];
            document.getElementById("md_id").value = array[5];
            */
		} 
    };
    
    obj.open("GET", "http://localhost/remotas_1.1/php/modificarUsuario.php?nombre="+nombre+"&apellido="+apellido+"&email="+email+"&genero="+genero+"&password="+password+"&password2="+password2+"&rol="+rol+"&id="+id, true);
	obj.send();
}

function crearUsuario() {
    var nombre = arguments[0];
	var apellido = arguments[1];
    var email = arguments[2];
    var genero = arguments[3];
    var password = arguments[4];
    var password2 = arguments[5];
    var rol = arguments[6];
    obj.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
			var php = this.responseText;
            alert(php);
        } 
    };
    
    obj.open("GET", "http://localhost/remotas_1.1/php/registrarUsuario.php?nombre="+nombre+"&apellido="+apellido+"&email="+email+"&genero="+genero+"&password="+password+"&password2="+password2+"&rol="+rol, true);
	obj.send();
}


function verEliminarUsuario() {  
    var buscar_por = arguments[0];
	var buscar = arguments[1];
    obj.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
			var php = this.responseText;
            var array = php.split(",");
            document.getElementById("eliminar_email").value = array[2];
            document.getElementById("eliminar_id").value = array[5];            
		} 
    };
    
    obj.open("GET", "http://localhost/remotas_1.1/php/verUsuario.php?buscar_por="+buscar_por+"&buscar="+buscar, true);
	obj.send();
}

function eliminarUsuario() { 
    var id = arguments[0];
	
    obj.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
			var php = this.responseText;
            alert(php);
		} 
    };
    
    obj.open("GET", "http://localhost/remotas_1.1/php/eliminarUsuario.php?ID="+id, true);
	obj.send();
    datosTablaUsuario(buscar_persona, buscar);
}
