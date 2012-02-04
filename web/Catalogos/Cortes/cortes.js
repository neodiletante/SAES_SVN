         $(function(){
         
             
         
         $( '#forma-agrega-corte' ).dialog({
			autoOpen: false,
			height: 300,
			width: 350,
			modal: true,
			buttons: {
			    'Agregar corte':function(){
                                if($("#fecha_ini").val()>$("#fecha_fin").val()){
                                    alert('El fin de periodo debe ser posterior');
                                }
                                else{
                                    var parameters={};
                                    parameters.fecha_ini=$("#fecha_ini").val();
                                    parameters.fecha_fin=$("#fecha_ini").val();
                                    parameters.descripcion=$("#descripcion").val();
                                    parameters.accion='agregar';
                                    parameters.corte=$("#nuevo-corte").val();
                                    $.post('Catalogos/Cortes/cortes.jsp', parameters, function(data){
                                       //agregar la fila
                                       if (data.indexOf('Agregado')){
                                           var fila='<tr id="corte_'+parameters.corte+
                                               '"><td class="resultado">'+parameters.corte+
                                               '</td><td class="resultado">'+parameters.fecha_ini+
                                               '</td><td class="resultado">'+parameters.fecha_fin+
                                               '</td><td class="resultado">'+parameters.descripcion+
                                               '</td><td class="centrado"><input type="checkbox" name="corte" value='+parameters.corte+'></td>'+
                                               '</td><td class="centrado"><input type="radio" name="modificar" value='+parameters.corte+'></td>'+
                                               '</tr></table>';
                                           //escribir fila
                                           $( '#info-cortes tbody' ).append(fila);
                                           $( this ).dialog( 'close' );
                                       }
                                       //avisar 
                                       alert(data); 
                                    },'text'   );
                               // },'json'
                                }//else
                            }//function
                        }//button,
                   });
          
          $('#btn-agrega-corte').click(function(){
                     $('#forma-agrega-corte').dialog('open');
                     $("#fecha_fin").datepicker({altFormat: 'dd-mm-yyyy'});
                     $("#fecha_ini").datepicker({altFormat: 'dd-mm-yyyy'});
           });
           
 
           
         });