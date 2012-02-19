$(function(){
  
  $('#select-cortes').change(function(){
    alert("estoy cambiando");
    var parameters={};
    $.post('buscaGrupos', parameters, function(){
      $('#_principal').load('Catalogos/Redes_sociales/redes_sociales_reg.jsp');
    }, 'text');
    
    
  });
  
 
  
});