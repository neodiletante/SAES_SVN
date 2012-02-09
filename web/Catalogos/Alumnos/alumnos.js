var accion = '';
//var id_grupo = null;
var no_expediente_ant;

function validaNombre(nombre){
  var patron = /[A-Za-z\s]/;
  return !patron.test(nombre);
}
         
$(function(){
  $( '#forma-agrega-alumno' ).dialog({
    autoOpen: false,
    height: 300,
    width: 350,
    modal: true,
    buttons: {
      'Guardar':function(){                         
        var noExpediente = $('#noExpediente').val();
        var nombre = $('#nombre').val();
        var sexo = $('.radio_sexo:checked').val();
        var mensaje = '';
        if (noExpediente == ''){
          mensaje = mensaje + 'Debe introducir un número de expediente\n';
        }else{
          if ( isNaN(noExpediente)){
            mensaje = mensaje + 'El número de expediente no es válido\n';
          }
        }
        if (nombre == ''){
          mensaje = mensaje + 'Debe introducir un nombre\n';
        }else{
          if(validaNombre(nombre)){
            mensaje = mensaje + 'El nombre no es válido\n'
          }
        }
        if (sexo == undefined){
          mensaje = mensaje + 'Debe introducir un sexo\n';
        }
        if (mensaje != ''){
          alert(mensaje);
        }else{
          var parameters={};
          parameters.noExpedienteAnt = no_expediente_ant;
          parameters.noExpediente=noExpediente;
          parameters.nombre=nombre;
          parameters.sexo=sexo;
          
          if(accion =='modificar'){
            //parameters.id_grupo=id_grupo;
            $.post('modificarAlumno', parameters, 
              function(data){
                $('#_principal').load('mostrarAlumnos');
                alert(data);
              },'text');
          }else{
            $.post('agregarAlumno', parameters, 
              function(data){
                $('#_principal').load('mostrarAlumnos');
                alert(data);
              },'text');
          }
          $( this ).dialog( 'close' );
        } 
      }//function
    }//button,
  });
  
  $('#btn-agrega-alumno').click(function(){
    accion = 'agregar';
    $('#forma-agrega-alumno').dialog({               
      title: 'Agregar alumno'
    });
    $('#forma-agrega-alumno').dialog('open');
    $('#noExpediente').val("");
    $('#nombre').val("");
    $('#sexoM').attr('checked', false);
    $('#sexoH').attr('checked', false);
  });
  
  $('#btn-borra-alumno').click(function(){
    var checks = $('.check_alumno:checked');
    for(var i =0 ; i<checks.length ; i++){
      var parameters={};
      parameters.noExpediente = checks[i].value;
      $.post('borrarAlumno', parameters, 
      function(data){
        $('#_principal').load('mostrarAlumnos');
      },'text'   );
    }
  });
 
  $('#btn-cambia-alumno').click(function(){
    accion = 'modificar';
    $('#forma-agrega-alumno').dialog({               
      title: 'Modificar alumno'
    });
    //var check = $('.radio_alumno:checked');
    //id_grupo = check[0].value;
    $('#forma-agrega-alumno').dialog('open');
    var noExpediente = $('.radio_alumno:checked').parent().siblings("#input_noExpediente").text();
    no_expediente_ant = noExpediente;
    var nombre = $('.radio_alumno:checked').parent().siblings("#input_nombre").text();
    var sexo = $('.radio_alumno:checked').parent().siblings("#input_sexo").text();
    $('#noExpediente').val(noExpediente);
    $('#nombre').val(nombre);
    if (sexo == 'Mujer'){
      $('#sexoM').attr('checked', true);
    }else{
      $('#sexoH').attr('checked', true);
    }
    
  });
  
});