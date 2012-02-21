<%-- 
    Document   : redes_sociales_mod
    Created on : 15/02/2012, 01:24:08 PM
    Author     : ulises
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript" src="Catalogos/Redes_sociales/redes_sociales_mod.js" />
   <center>
    <jsp:useBean id="cortes" class="java.util.ArrayList" scope="session" />
    <select id="select-cortes-mod" class="combo-cortes">
      <option value="" selected="true">Seleccione un corte</option>
      <c:forEach var="corte" items="${cortes}">
        <option value="${corte}"> ${corte} </option>  
      </c:forEach>
      
    </select>
      <jsp:useBean id="grupos" class="java.util.ArrayList" scope="session" />
    <select id="select-grupos-mod">
      <option value="" selected="true">Seleccione un grupo</option>
      <c:forEach var="grupo" items="${grupos}">
        <option value="${grupo.idGrupo}"> ${grupo.grado} ${grupo.grupo} ${grupo.turno} </option>  
      </c:forEach>
      
    </select>
      <jsp:useBean id="nos_lista" class="java.util.ArrayList" scope="session" />
    <select id="no-lista-mod">
      <option value="" selected="true">Seleccione un número de lista</option>
      <c:forEach var="no_lista" items="${nos_lista}">
        <option value="${no_lista}"> ${no_lista} </option>  
      </c:forEach>
      </select>
    <br />
    <table id="tabla-grupos-actuales">
        <thead>
            <th colspan="6">Grupos actuales</th>
        </thead>
        <tbody>
            <tr>
                <th>Red</th>
                <th>Borrar</th>
                <th>Modificar</th>
            </tr>
            <jsp:useBean id="redes" class="java.util.ArrayList" scope="request" />
            <c:forEach var="grupo" items="${redes}">
               <tr>
                <td class="resultado" id="input_corte">${redes}</td>
                <td class="centrado">
                    <input class="check_red" type="checkbox" name="corte" id="borrar_red" value="${grupo.idGrupo}"/>
                </td>
                <td class="centrado">
                    <input class="radio_red" type="radio" name="modificar" id="modificar_red" value="${grupo.idGrupo}"/>
                </td>
               </tr> 
            </c:forEach>
        </tbody>
    </table>
    <button class="ui-button" id="btn-modificar-red">Modificar</button> 
    <button class="ui-button" id="btn-borrar-red">Borrar</button> 
