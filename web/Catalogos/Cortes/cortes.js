         $(function(){
         
         function limpiar(){
            $("#fecha_ini").val('');
            $("#fecha_fin").val('');
            $("#descripcion").val('');
            $("#opcion").val('');
            $("#nuevo-corte").val('');
            $("#lblcorte").val('');
         }  
         
          function setValores(param, funcion){
            $("#fecha_ini").val(param.fecha_ini);
            $("#fecha_fin").val(param.fecha_fin);
            $("#descripcion").val(param.descripcion);
            $("#opcion").val(funcion);
            $("#nuevo-corte").val(param.corte);
            $("#lbl_corte").text(param.corte);
         } 
         
         function getValores(corte){
             console.log('here in valores');
             var param={};
             param.corte=corte;
             param.fecha_ini=$('#fecha_ini_'+corte).val();
             param.fecha_fin=$('#fecha_fin_'+corte).val();
             param.descripcion=$('#descripcion_'+corte).val();
             param.accion=$('#opcion').val();
             return param;
         }
         
         function validar(){
             
             var max_fecha_fin_d = $('#max_fecha_fin_d').val();
             var max_fecha_fin_m = $('#max_fecha_fin_m').val();
             var max_fecha_fin_y = $('#max_fecha_fin_y').val();
             var max_fecha_fin = new Date(max_fecha_fin_y, max_fecha_fin_m - 1, max_fecha_fin_d );
             var fecha_fin = $('#fecha_fin').datepicker("getDate");
             var fecha_ini = $('#fecha_ini').datepicker("getDate");
             var opcion=$('#opcion').val();
             
             console.log('La fecha final del ultimo corte es ' + max_fecha_fin);
             console.log('La fecha final a validar es ' + fecha_fin);
             console.log('La fecha inicial a validar es ' + fecha_ini);
             
             if ( (fecha_ini <= max_fecha_fin) && opcion=='agregar'){ //al modificar no lo valida
                alert('El inicio de periodo debe ser posterior al fin del ultimo periodo');     
                return false;
             }
             
             if (fecha_ini >= fecha_fin){
                alert('El fin de periodo debe ser posterior a la fecha de inicio');
                return false;
             }
             return true;
             /*
             return true;
             
             var corte_ant = $("#nuevo-corte").val()-1;
             var corte_anterior=($("#fecha_fin_"+corte_ant).val() < $("#fecha_ini").val());
             var valida_fechas=( $("#fecha_ini").val()>$("#fecha_fin").val() );
             var validar=!(corte_anterior || valida_fechas);
             if(!validar){
              if(corte_anterior) 
                alert('El inicio de periodo debe ser posterior al fin del ultimo periodo');
              else
                alert('El fin de periodo debe ser posterior a la fecha de inicio');
             }
             return validar;
             */
         }
         
         function getParameters(){
            console.log('here in Parameters');
            var parame={};
            parame.fecha_ini=$("#fecha_ini").val();
            parame.fecha_fin=$("#fecha_fin").val();
            parame.descripcion=$("#descripcion").val();
            parame.accion=$("#opcion").val();
            console.log('en getParameters #opcion.val: ' + $("#opcion").val());
            parame.corte=$("#nuevo-corte").val();
            return parame;
         }
         
         function agregar(){
            var param = getParameters();
            if(param.accion=='agregar' && validar()){ 
                $.post('Catalogos/Cortes/cortes.jsp', param, function(data){
                //agregar la fila
                console.log('Agregando: '+data);
                   if (data.indexOf('Agregado')){
                       var fila='<tr id="corte_'+param.corte+
                           '"><td class="resultado">'+param.corte+
                           '</td><td class="resultado">'+param.fecha_ini+
                           '</td><td class="resultado">'+param.fecha_fin+
                           '</td><td class="resultado">'+param.descripcion+
                           '</td><td class="centrado"><input type="checkbox" name="corte" value='+param.corte+'></td>'+
                           '</td><td class="centrado"><input type="radio" name="modificar" value='+param.corte+'></td>'+
                           '</tr></table>';
                       //escribir fila
                       $('#info-cortes tbody').append(fila);
                       $('#nuevo-corte').val($('#nuevo-corte').val()+1);
                       $('#forma-agrega-corte' ).dialog( 'close' );
                       /*
                       var options = {to: {width: 200, height: 60}};
                       $( this ).hide( 'slide', options, 1000, function(){} );
                       */
                   }
                   //avisar 
                   alert(data); 
                },'text'   );
                $('#frmCorte').action='?o=11';
                $('#frmCorte').submit();
           // },'json'
            }//else
         }
         
         function modificar(){
             console.log('voy a modificar');
             var p = getParameters();
              console.log('obtuve los parametros para modificar');
              if(p.accion=='modificar' && validar()){ 
                    console.log('modificacion validada');
                  $.post('Catalogos/Cortes/cortes.jsp', p, function(data){
                     
                     console.log('llegue al success del modificar');
                     
                     if (data.indexOf('modificado')){
                        //Cambiar en la tabla
                        var fila='<td class="resultado">'+p.corte+
                           '</td><td class="resultado">'+p.fecha_ini+
                           '</td><td class="resultado">'+p.fecha_fin+
                           '</td><td class="resultado">'+p.descripcion+
                           '</td><td class="centrado"><input type="checkbox" name="corte" value='+p.corte+'></td>'+
                           '</td><td class="centrado"><input type="radio" name="modificar" value='+p.corte+'></td>';
                        
                            console.log('La fila que voy a cambiar es:' + '#corte_'+p.corte);
                            $('#corte_'+p.corte).empty();
                            $('#corte_'+p.corte).append($(fila));
                            /*
                        $('#corte_'+p.corte).replaceWith(fila)  ;
                        $('#corte_'+p.corte).html(fila) ;
                        $('#corte_'+p.corte).text(fila) ;
                          */
                     }
                     alert(data); 
                     $('#frmCorte').action='?o=11';
                     $('#frmCorte').submit();
                     //Ocultar modal form
                  });
                  
              }
              $('#forma-agrega-corte' ).dialog( 'close' );
         }
         
             
         $( '#forma-agrega-corte' ).dialog({
			autoOpen: false,
			height: 300,
			width: 350,
			modal: true/*,
			buttons: {
			    'Agregar corte':agregar,
                            'Modificar corte':modificar
                     }//buttons*/
                   });
          
         $('#btn-agrega-corte').click(function(){
               var $d= $('#forma-agrega-corte');
              $d.dialog("option","buttons",{'Guardar':agregar});
              $d.dialog("option", "title", "Agregar Corte");
              $d.dialog('open');
              $('#opcion').val('agregar');
              console.log('opcion seteado a agregar');
              $("#fecha_fin").datepicker({altFormat: 'dd/mm/yy'});
              $("#fecha_ini").datepicker({altFormat: 'dd/mm/yy'});
         });
           
         
         $('#btn-cambia-corte').click(
          function(){
            var radio = $('input[@id=modificar]:checked');
            var corte=radio.val();
            var param=getValores(corte);
            setValores(param, 'modificar');
            var $d= $('#forma-agrega-corte');
            $d.dialog("option","buttons",{'Guardar':modificar});
            $d.dialog("option", "title", "Modificar Corte");
            $d.dialog('open');
            $('#opcion').val('modificar');
            console.log('opcion seteado a modificar');
            $("#fecha_fin").datepicker({altFormat: 'dd/mm/yy'});
            $("#fecha_ini").datepicker({altFormat: 'dd/mm/yy'});
          });
             
        $('#btn-borra-corte').click(function(){
            $('#opcion').val('borrar');
        });
           
        $('button').addClass("ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only");
         
      
  });