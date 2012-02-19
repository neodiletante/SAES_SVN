var accion='agregar';
var id_dato;


$(function(){
  
$('a').click(function(){
    $('#forma-tipos').dialog('open');
});

$('#btn-borra-tipo').click(function(){
    //alert("nojala");
     var tipo_dato = $('#tipo_dato_no_usado').val();
  var parameters={};
  parameters.tipo_dato = tipo_dato;
 $.post('borraTipoDato', parameters, 
              function(data){
                //$('#_principal').load('mostrarAlumnos');
                $('#_principal').load('muestraDatosInteres');
                alert(data);
              },'text');
            //  $('#forma-tipos').dialog( 'close' );
    
});

$('#btn-agrega-tipo').click(function(){
   // alert("nojala");
  
  var desc = $('#descripcion-tipo').val();
  var parameters={};
  parameters.desc = desc;
 $.post('agregaTipoDato', parameters, 
              function(data){
             
            //    $('#_principal').load('muestraDatosInteres');
       //         alert(data);
              },'text');
              $('#forma-tipos').dialog( 'close' );
  
});
  
  $( '#forma-tipos' ).dialog({
    autoOpen: false,
    height: 300,
    width: 350,
    modal: true /*,
    buttons: {
      'Guardar':function(){                         
        var desc = $('#descripcion-tipo').val();
  var parameters={};
  parameters.desc = desc;
          
         
           $.post('agregaTipoDato', parameters, 
              function(data){
                //$('#_principal').load('mostrarAlumnos');
                $('#_principal').load('muestraDatosInteres');
                alert(data);
              },'text');
         
        
          $( this ).dialog( 'close' );
         
      }//function
    }//button,*/
  });
  
  $('#btn-agrega-dato').click(function(){
  
   // accion = 'agregar';
   var parameters={};
   var descripcion = $('#descripcion-dato-interes').val();
   var tipo = $('#tipo-dato').val();
   var ruta;
   parameters.descripcion = descripcion;
   parameters.tipo = tipo;
  // alert(descripcion + " " + tipo);
  
   if (accion=='agregar'){
     ruta = 'agregaDatoInteres';

    
  }else{
    parameters.id_dato=id_dato;
    ruta='modificaDatoInteres';
    
  }
   $.post(ruta, parameters, 
              function(data){
             accion='agregar';
              },'text');
     
  });
  
  $('#btn-borra-dato').click(function(){
    var checks = $('.check_datos:checked');
    for(var i =0 ; i<checks.length ; i++){
      var parameters={};
      parameters.id_dato = checks[i].value;
      $.post('borraDatoInteres', parameters, 
      function(data){
        $('#_principal').load('muestraDatosInteres');
      },'text'   );
    }
  });
 
  $('#btn-cambia-dato').click(function(){
    accion = 'modificar';
    
    var check = $('.radio_datos:checked');
           
           id_dato = check[0].value;
    var parameters={};
    parameters.id_dato = id_dato;
   // var dato = {'id':'1','descripcion':'Mejor amigo','tipo':'1'};
     var dato;
     $.post('buscaDatoInteres', parameters, 
              function(data){
                //$('#_principal').load('mostrarAlumnos');
                //$('#_principal').load('muestraDatosInteres');
             //   alert(data);
            // dato = $.parseJSON('{"id":"1","descripcion":"Mejor amigo",/"tipo":"1"}');
             dato = $.parseJSON(data);
           //  alert(dato.id + ' ' + dato.descripcion + ' ' + dato.tipo);
              },'text');
   //var desc_dato = dato.descripcion;
   alert('Modifique la descripción y/o el tipo');
  //  var desc_dato = check.parent().siblings("#input_desc").text();
    var text_area = $('#descripcion-dato-interes');
    //var tipo_dato = check.parent().siblings("#input_tipo").text();
   //var tipo_dato = dato.tipo;
  //alert(tipo_dato + ' ' + desc_dato);
    
    text_area.val(dato.descripcion);
    text_area.focus();
    $('#tipo_dato').val(dato.tipo);
    accion='modificar';
   
  });
  
});