 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- 
    Document   : grupos
    Created on : 30/01/2012, 07:02:29 PM
    Author     : maria
--%>

 <script type="text/javascript" src="Catalogos/Grupos/grupos.js" />
 
 
<center>
  <p><h4>Seleccione un corte</h4> 
 <p>
   <jsp:useBean id="cortes" class="java.util.ArrayList" scope="session" />
                 <p><select id ="corte" size="1">
                      <option value="" selected="true"> Seleccione un corte </option>
                     <c:forEach var="corte" items="${cortes}">
                       <option value="${corte}"> ${corte} </option>  
                     </c:forEach>
                 </select>
    <%--c:set var="cortes" value="${cortes}" scope="session" /--%>
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
            <jsp:useBean id="grupos" class="java.util.ArrayList" scope="session" />
            <c:forEach var="grupo" items="${grupos}">
               <tr>
                <td class="resultado" id="input_grado">${grupo.grado}</td>
                <td class="resultado" id="input_grupo">${grupo.grupo}</td>
                <td class="resultado" id="input_turno">${grupo.turno}</td>
                <td class="resultado" id="input_corte">${grupo.corte}</td>
                <td class="centrado">
                    <input class="check_grupo" type="checkbox" name="corte" id="borrar" value="${grupo.idGrupo}"/>
                </td>
                <td class="centrado">
                    <input class="radio_grupo" type="radio" name="modificar" id="modificar" value="${grupo.idGrupo}"/>
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
               <div class="div-izquierdo">
                  <p class="etiqueta"><label>Grado: </label>
                  <p class="etiqueta"><label>Grupo: </label>
                  <p class="etiqueta"><label>Turno: </label>
               </div>
                <div>
                 <p><input type="text" id="grado" size="10" maxlength="1"/>
                 <p><input type="text" id="grupo" size="10" maxlength="1"/>
                 <p><input class="radio_turno" id="turnoM" type="radio" name="turno"  value="M"/><label>Matutino</label>
                 <input class="radio_turno" id="turnoV" type="radio" name="turno" value="V"/><label>Vespertino</label>
                 
                </div>
               
            </fieldset>
            <!--input type="submit" value="Agregar" /-->
        </form>   
      </div>    