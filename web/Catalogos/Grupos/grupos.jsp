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
                               
                                    var parameters={};
                                   alert("en la func");
                                    parameters.accion='agregar';
                                
                                    $.post('agregarGrupo', parameters, function(data){
                                        //console.log('respuesta recibida');
                                        //obRespuesta = data;
                                       alert(data); 
                                    },'text'   );
                               // },'json'
                            
                            }//function
                        }//button,
                   });
          
          $('#btn-agrega-grupo').click(function(){
                     $('#forma-agrega-grupo').dialog('open');
                    
                   
           });
           
          
 
           
         });
             
         </script>
<center>
   <table>
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
                <th>${grupo.grado}</th>
                <th>${grupo.grupo}</th>
                <th>${grupo.turno}</th>
                <th>${grupo.corte}</th>
               </tr> 
            </c:forEach>
    
        </tbody>
        
    </table>
    
    <button class="ui-button" id="btn-agrega-grupo">Nuevo grupo</button> 
    <button class="ui-button" id="btn-borra-grupo">Borra grupo</button> 
    <button class="ui-button" id="btn-cambia-grupo">Cambia grupo</button> 
    
      <div id="forma-agrega-grupo" >
        <form  method="post" action="agregarGrupo">
            <fieldset >
                <legend>Agregar el siguiente Grupo</legend>
                <div class="div-izquierdo">
                  <p class="etiqueta"><label>Grado: </label>
                  <p class="etiqueta"><label>Grupo: </label>
                  <p class="etiqueta"><label>Turno: </label>
                  <p class="etiqueta"><label>Corte: </label>
                </div>
                <div>
                 <p><input type="text" id="grado" size="10" />
                 <p><input type="text" id="grupo" size="10" />
                 <p><input type="text" id="turno" size="10" />
                 <p><input type="text" id="corte" size="10" />
                </div>
               
            </fieldset>
        </form>   
      </div>    