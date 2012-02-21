var accion = '';
var id_grupo = null;
var corte_actual;
     
function validaGrado(valor){
  valor = parseInt(valor)
  if (isNaN(valor)) {
    return '';
  }else{
    return valor;
  }
}

function validaGrupo(grupo){
  var patron = /[A-Za-zñÑ]/;
  return !patron.test(grupo);
}
         
$(function(){

  $('#corte').change(function(){
    var parameters={};
    var corte = $('#corte').val();
    //alert("corte"+corte);
    corte_actual = corte;
    parameters.corte=corte;
    $.post('buscaGrupos', parameters, function(data){
      $('#_principal').load('Catalogos/Grupos/grupos.jsp',data,function(){
        $('#corte').val(corte)
      });
      
   //   $('#corte').val(corte);
    }, 'text');
    
   // 
    
  });
  
  $( '#forma-agrega-grupo' ).dialog({
    autoOpen: false,
    height: 300,
    width: 350,
    modal: true,
    buttons: {
      'Guardar':function(){                         
        var grado = $('#grado').val();
        var grupo = $('#grupo').val();
        var turno = $('.radio_turno:checked').val();
       // var corte = $('#corte').val();
        var mensaje = '';
        if (grado == ''){
          mensaje = mensaje + 'Debe introducir un grado\n';
        }
        if ( isNaN(grado)){
          mensaje = mensaje + 'El grado no es válido\n';
        }
        if (grupo == ''){
          mensaje = mensaje + 'Debe introducir un grupo\n';
        }
        if(validaGrupo(grupo)){
          mensaje = mensaje + 'El grupo no es válido\n'
        }
        if (turno == undefined){
          mensaje = mensaje + 'Debe introducir un turno\n';
        }
      //  if (corte == ''){
      //    mensaje = mensaje + 'Debe introducir un corte\n';
      //  }
        if (mensaje != ''){
          alert(mensaje);
        }else{
          var parameters={};
          parameters.grado=grado;
          parameters.grupo=grupo;
          parameters.turno=turno;
          parameters.corte=corte_actual;
          if(accion =='modificar'){
            parameters.id_grupo=id_grupo;
            $.post('cambiarGrupo', parameters, 
              function(data){
                $('#_principal').load('grupos');
              },'text');
          }else{
            $.post('agregarGrupo', parameters, 
            function(data){
              $('#_principal').load('grupos');
            },'text'   );
          }
          $( this ).dialog( 'close' );
        } 
      }//function
    }//button,
  });
  $('#btn-agrega-grupo').click(function(){
    if ($('#corte').val() != ''){
    accion = "agregar";
    $('#forma-agrega-grupo').dialog({               
      title: "Agregar grupo"
    });
    $('#forma-agrega-grupo').dialog('open');
    $('#grado').val("");
    $('#grupo').val("");
    $('#turnoM').attr('checked', false);
    $('#turnoV').attr('checked', false);
    //$('#corte').val("");
  }else{
    alert("Debe seleccionar un corte");
    
  }
  });
  
  $('#btn-borra-grupo').click(function(){
    //$('#corte').val(5);
    var checks = $('.check_grupo:checked');
    for(var i =0 ; i<checks.length ; i++){
      var parameters={};
      parameters.idGrupo = checks[i].value;
      $.post('borrarGrupo', parameters, 
      function(data){
        $('#_principal').load('grupos');
      },'text'   );
    }
  });
 
  $('#btn-cambia-grupo').click(function(){
    accion = 'modificar';
    $('#forma-agrega-grupo').dialog({               
      title: "Modificar grupo"
    });
    var check = $('.radio_grupo:checked');
    id_grupo = check[0].value;
    $('#forma-agrega-grupo').dialog('open');
    var grado = $('.radio_grupo:checked').parent().siblings("#input_grado").text();
    var grupo = $('.radio_grupo:checked').parent().siblings("#input_grupo").text();
    var turno = $('.radio_grupo:checked').parent().siblings("#input_turno").text();
    var corte = $('.radio_grupo:checked').parent().siblings("#input_corte").text();
    $('#grado').val(grado);
    $('#grupo').val(grupo);
    if (turno == 'M'){
      $('#turnoM').attr('checked', true);
    }else{
      $('#turnoV').attr('checked', true);
    }
    $('#corte').val(corte);
  });
  
});