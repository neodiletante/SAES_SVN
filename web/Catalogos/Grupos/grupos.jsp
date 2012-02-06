<%@page import="java.sql.*, javax.sql.*, javax.naming.*, javax.servlet.*"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- 
    Document   : grupos
    Created on : 30/01/2012, 07:02:29 PM
    Author     : maria
--%>

<!--% 
   Connection conect = (Connection)session.getAttribute("conn");
   java.sql.Statement stm = conect.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
   ResultSet rst=null;
   
    %-->

 <script type="text/javascript">
         
         $(function(){
         
         
                                                                                                                
         $( '#forma-agrega-grupo' ).dialog({
			autoOpen: false,
			height: 300,
			width: 350,
			modal: true,
			buttons: {
			    'Agregar grupo':function(){                         
                              //  $.post('agregarGrupo');
                           
                            var parameters={};
                                    parameters.grado=$("#grado").val();
                                    parameters.grupo=$("#grupo").val();
                                    parameters.turno=$("#turno").val();
                                    parameters.corte=$("#corte").val();
                        //           alert("en la func");
                         //           parameters.accion='agregar';
                                
                                    $.post('agregarGrupo', parameters, function(data){
                                        //console.log('respuesta recibida');
                                        //obRespuesta = data;
                                    //   alert(data); 
                                     $('#_principal').load('grupos');
                                    },'text'   );
                                   
                                        
                                  
                               $( this ).dialog( 'close' );
                            
                            }//function
                        }//button,
                   });
          
          $('#btn-agrega-grupo').click(function(){
                     $('#forma-agrega-grupo').dialog('open');
                    
                   
           });
           
            $('#btn-borra-grupo').click(function(){
                var checks = $('.check_grupo:checked');
                for(var i =0 ; i<checks.length ; i++){
                //      alert (checks[i].value );
                    var parameters={};
                 parameters.idGrupo = checks[i].value;
                    
                     $.post('borrarGrupo', parameters, function(data){
                                        //console.log('respuesta recibida');
                                        //obRespuesta = data;
                                    //   alert(data); 
                                     $('#_principal').load('grupos');
                                    },'text'   );
                }
                 
                 //$.post('borrarGrupo');
                 
                   
                    
                   
           });
 
           
         });
             
         </script>
<center>
   <table id="tabla-grupos-actuales">
        <thead>
            <th colspan="6">Grupos actuales</th>
        </thead>
        <tbody>
            <tr>
                <th>Grado</th>
                <th>Grupo</th>
                <th>Turno</th>
                <th>Corte</th>
                <th>Borrar</th>
                <th>Modificar</th>
            </tr>
            <%--= session.getAttribute("grupo") --%>
            <%--=  pageContext.getAttribute("grupo",PageContext.SESSION_SCOPE) --%>
            <jsp:useBean id="grupos" class="java.util.ArrayList" scope="request" />
            <c:forEach var="grupo" items="${grupos}">
               <tr>
                <td class="resultado">${grupo.grado}</td>
                <td class="resultado">${grupo.grupo}</td>
                <td class="resultado">${grupo.turno}</td>
                <td class="resultado">${grupo.corte}</td>
                <td class="centrado">
                    <input class="check_grupo" type="checkbox" name="corte" id="borrar" value="${grupo.idGrupo}"/>
                </td>
                <td class="centrado">
                    <input type="radio" name="modificar" id="modificar" value="${grupo.idGrupo}s"/>
                </td>
               </tr> 
            </c:forEach>
    
        </tbody>
        
    </table>
    
    <button class="ui-button" id="btn-agrega-grupo">Nuevo grupo</button> 
    <button class="ui-button" id="btn-borra-grupo">Borra grupo</button> 
    <button class="ui-button" id="btn-cambia-grupo">Cambia grupo</button> 
    
      <div id="forma-agrega-grupo" >
        <form>
            <fieldset >
                <legend>Agregar el siguiente Grupo</legend>
                <div class="div-izquierdo">
                  <p class="etiqueta"><label>Grado: </label>
                  <p class="etiqueta"><label>Grupo: </label>
                  <p class="etiqueta"><label>Turno: </label>
                  <p class="etiqueta"><label>Corte: </label>
                </div>
                <div>
                 <!--p><input type="text" id="grado"  itemid="grado" size="10" /-->
                 <select id ="grado" size="1">
                     <option value="1"> 1 </option>
                     <option value="2"> 2 </option>
                     <option value="3"> 3 </option>
                     <option value="4"> 4 </option>
                     <option value="5"> 5 </option>
                     <option value="6"> 6 </option>
                 </select>
                 <p><input type="text" id="grupo" size="10" />
                 <p><input type="text" id="turno" size="10" />
                 <p><input type="text" id="corte" size="10" />
                </div>
               
            </fieldset>
            <!--input type="submit" value="Agregar" /-->
        </form>   
      </div>    