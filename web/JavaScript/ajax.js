function Carga(url,id)
{
//Creamos un objeto dependiendo del navegador
var objeto;
if (window.XMLHttpRequest)
{
//Mozilla, Safari, etc
objeto = new XMLHttpRequest();
}
else if (window.ActiveXObject)
{
//Nuestro querido IE
try {
objeto = new ActiveXObject("Msxml2.XMLHTTP");
} catch (e) {
try { //Version mas antigua
objeto = new ActiveXObject("Microsoft.XMLHTTP");
} catch (e) {}
}
}
if (!objeto)
{
alert("No ha sido posible crear un objeto de XMLHttpRequest");
}
//Cuando XMLHttpRequest cambie de estado, ejecutamos esta funcion
objeto.onreadystatechange=function()
{
cargarobjeto(objeto,id)
}
objeto.open('GET', url, true) // indicamos con el método open la url a cargar de manera asíncrona
objeto.send(null) // Enviamos los datos con el metodo send
}

function cargarobjeto(objeto, id)
{
if (objeto.readyState == 4) //si se ha cargado completamente
document.getElementById(id).innerHTML=objeto.responseText
else //en caso contrario, mostramos un gif simulando una precarga
document.getElementById(id).innerHTML='<img src="loader.gif" alt="cargando" />'
}