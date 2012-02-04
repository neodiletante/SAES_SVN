<%@page import="java.sql.*, javax.sql.*, javax.naming.*, javax.servlet.*"%>
<% String accion=request.getParameter("accion");
   Connection conect = (Connection)session.getAttribute("conn");
   java.sql.Statement stm = conect.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
   ResultSet rst=null;
   
   String corte="0";
    %>
<%@page import="java.lang.StringBuffer" %>
<%if(accion==null){
   rst = stm.executeQuery("Select max(corte)total from cortes");
   if(rst.first()){
        corte= rst.getString("total")+1;
   }
   else{ corte="1"; }
   rst.close();
   rst=stm.executeQuery("select corte, date_format(fecha_ini,'%d/%m/%Y')fecha_ini, date_format(fecha_fin,'%d/%m/%Y')fecha_fin, descripcion from cortes");
             
%>
        <script type="text/javascript">
         //var obRespuesta;
         
         $(function(){
         
             
         
         $( '#forma-agrega-corte' ).dialog({
			autoOpen: false,
			height: 300,
			width: 350,
			modal: true,
			buttons: {
			    'Agregar corte':function(){
                                //console.log('FUCK YEAH!');
                                if($("#fecha_ini").val()>$("#fecha_fin").val()){
                                    alert('El fin de periodo debe ser posterior');
                                }
                                else{
                                    var parameters={};
                                    parameters.fecha_ini=$("#fecha_ini").val();
                                    parameters.fecha_fin=$("#fecha_ini").val();
                                    parameters.descripcion=$("#descripcion").val();
                                    parameters.accion='agregar';
                                    parameters.corte=<%=corte%>;
                                    $.post('Catalogos/Cortes/agregarCorte.jsp', parameters, function(data){
                                        //console.log('respuesta recibida');
                                        //obRespuesta = data;
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
             
         </script>
    <center>
        <table>
        <thead>
            <th colspan="6">Cortes actuales</th>
        </thead>
        <tbody>
            <tr>
                <th>Corte</th>
                <th>Inicio</th>
                <th>Fin</th>
                <th>Descripcion</th>
                <th>Borrar</th>
                <th>Modificar</th>
            </tr>
            <%if(rst.first()){%>
            <tr>
                <td class="resultado"><%=rst.getString("corte")%></td>
                <td class="resultado"><%=rst.getString("fecha_ini")%></td>
                <td class="resultado"><%=rst.getString("fecha_fin")%></td>
                <td class="resultado"><%=rst.getString("descripcion")%></td>
                <td class="centrado">
                    <input type="checkbox" name="corte" id="corte" value="<%=rst.getString("corte")%>"/>
                </td>
                <td class="centrado">
                    <input type="radio" name="modificar" id="modificar"/>
                </td>
            </tr>
            <%}
              else{%>
              <tr>
                  <td class="azul" colspan="4"><center>No hay información disponible</td>
              </tr>
            <%}%>
        </tbody>
        
    </table>
    
    <button class="ui-button" id="btn-agrega-corte">Iniciar corte</button> 
    <button class="ui-button" id="btn-borra-corte">Borrar corte</button> 
    <button class="ui-button" id="btn-cambia-corte">Cambiar corte</button> 
    
      <div id="forma-agrega-corte" >
        <form id="frmCorte" method="post">
            <fieldset >
                <legend>Agregar el siguiente corte</legend>
                <div class="div-izquierdo">
                  <p class="etiqueta"><label>Siguiente corte: </label>
                  <p class="etiqueta"><label>Fecha de inicio:</label>
                  <p class="etiqueta"><label>Fecha de término:</label>
                  <p class="etiqueta"><label>Descripcion:</label>  
                </div>      
                <div>
                 <p> <%=corte%><br>
                 <p><input type="text" id="fecha_ini" size="10" readonly/>
                 <p><input type="text" id="fecha_fin" size="10" readonly />
                 <p><textarea id="descripcion"></textarea>
                </div>
            </fieldset>
        </form>   
      </div>             
<%}
  else{ /*agregar corte*/
     if(accion.equalsIgnoreCase("agregar")){
         String fecha_ini=request.getParameter("fecha_ini");
         String fecha_fin=request.getParameter("fecha_fin");
         String descripcion=request.getParameter("descripcion");
         corte=request.getParameter("corte");
         StringBuffer query = new StringBuffer("insert into cortes values(");
         query.append(corte).append(",'");
         query.append("STR_TO_DATE('"+fecha_ini+"', '%m/%d/%Y')").append("','").append(("STR_TO_DATE('"+fecha_fin+"', '%m/%d/%Y')").append("','");
         query.append(descripcion).append("')");
         String respuesta=null;
         try{
             if(stm.executeUpdate(query.toString())>0)
                 respuesta="Se agregó un nuevo corte";
             else
                 respuesta="no se agregó corte";
         }catch(Exception ex){
             respuesta="Error al agregar nuevo corte";
         }
         out.println(respuesta);
        // out.println("{\"respuesta\":\"OK\",\"otro\":\"cuack\"}");
     }
     
     /*borrar elemento*/
     if(accion.equalsIgnoreCase("borrar")){
            out.println("OK");
     }
     
     /*modificar elemento*/
     if(accion.equalsIgnoreCase("modificar")){
         out.println("OK");
     }
  }%>


