$(function(){
  
  $('#select-cortes-mod').change(function(){
    //alert("estoy cambiando");
    var parameters={};
    var corte = $('#select-cortes-mod').val();
    parameters.corte = corte;
    $.post('buscaGrupos', parameters, function(data){
      $('#_principal').load('Catalogos/Redes_sociales/redes_sociales_mod.jsp',data,function(){
        $('#select-cortes-mod').val(corte);
          
        
      });
    }, 'text');
    
    
  });
  
  $('#select-grupos-mod').change(function(){
  //  alert("estoy cambiando");
    var parameters={};
    var grupo = $('#select-grupos-mod').val();
    parameters.grupo = grupo;
    $.post('buscaNosLista', parameters, function(data){
      $('#_principal').load('Catalogos/Redes_sociales/redes_sociales_mod.jsp',data,function(){
        $('#select-grupos-mod').val(grupo);
      
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