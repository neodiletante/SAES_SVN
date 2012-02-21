$(function(){
  
  $('#select-cortes').change(function(){
    //alert("estoy cambiando");
    var parameters={};
    var corte = $('#select-cortes').val();
    parameters.corte = corte;
    $.post('buscaGrupos', parameters, function(data){
      $('#_principal').load('Catalogos/Redes_sociales/redes_sociales_reg.jsp',data,function(){
        $('#select-cortes').val(corte);
          
        
      });
    }, 'text');
    
    
  });
  
  $('#select-grupos').change(function(){
  //  alert("estoy cambiando");
    var parameters={};
    var grupo = $('#select-grupos').val();
    parameters.grupo = grupo;
    $.post('buscaNosLista', parameters, function(data){
      $('#_principal').load('Catalogos/Redes_sociales/redes_sociales_reg.jsp',data,function(){
        $('#select-grupos').val(grupo);
      
    });
    
  }, 'text');
});
/*
 $('#no-lista').change(function(){
//    alert("estoy cambiando");
    var parameters={};
    var no_lista = $('#no-lista').val();
    parameters.no_lista = no_lista;
    $.post('buscaReferidos', parameters, function(data){
      $('#_principal').load('Catalogos/Redes_sociales/redes_sociales_reg.jsp',data,function(){
        $('#no-lista  ').val(grupo);
      
    });
    
  }, 'text');
});
  */

  
});