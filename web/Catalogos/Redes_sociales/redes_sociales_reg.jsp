<%-- 
    Document   : redes_sociales_mod
    Created on : 15/02/2012, 10:48:00 AM
    Author     : ulises
--%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <script type="text/javascript" src="Catalogos/Redes_sociales/redes_sociales.js" />

  <center>
    <jsp:useBean id="cortes" class="java.util.ArrayList" scope="request" />
    <select id="select-cortes" class="combo-cortes">
      <option value="" selected="true">Seleccione un corte</option>
      <c:forEach var="corte" items="${cortes}">
        <option value="${corte}"> ${corte} </option>  
      </c:forEach>
      
    </select>
      <jsp:useBean id="grupos" class="java.util.ArrayList" scope="session" />
    <select id="select-grupos">
      <option value="" selected="true">Seleccione un grupo</option>
      <c:forEach var="grupo" items="${grupos}">
        <option value="${grupo.idGrupo}"> ${grupo.grado} ${grupo.grupo} ${grupo.turno} </option>  
      </c:forEach>
      
    </select>
      <jsp:useBean id="listas" class="java.util.ArrayList" scope="request" />
    <select id="no-lista">
      <option value="" selected="true">Seleccione un número de lista</option>
      <c:forEach var="lista" items="${listas}">
        <option value="${lista.no_lista}"> ${lista.no_lista} </option>  
      </c:forEach>
    </select>
    <br />
    <button class="ui-button" id="btn-examinar-redes">Examinar redes</button> 
    <button class="ui-button" id="btn-iniciar-red">Iniciar red</button> 
    <br />
    <jsp:useBean id="tiposDato" class="java.util.ArrayList" scope="request" />
     <jsp:useBean id="datosInteres" class="java.util.ArrayList" scope="request" />
     <%--jsp:useBean id="datos" class="java.util.ArrayList" scope="request" /--%>
     
    <table id="tabla-alumnos">
        <thead>
            <th colspan="6">Alumnos</th>
        </thead>
        <tbody>
            <tr>
                <th>No. lista</th>
                <th>Nombre</th>
                <th>Agregar</th>
                <th>Color</th>
               <c:forEach var="tipoDato" items="${tiposDato}">
                 <th>${tipoDato.descripcion}</th>
               </c:forEach>
            </tr>
            <!--jsp:useBean id="alumnos" class="java.util.ArrayList" scope="request" /-->
            <c:forEach var="lista" items="${listas}">
               <tr>
                <td class="resultado" id="input_grado">${lista.no_lista}</td>
                <td class="resultado" id="input_grupo">${lista.nombre}</td>
               <td class="centrado">
                    <input class="check_alumno" type="checkbox" name="agrega_alumno" id="agrega-alumno" value="${alumnos.idAlumno}"/>
               </td>
               <td>${lista.color}</td>
               <c:forEach var="tipoDato" items="${tiposDato}">
               <jsp:useBean id="sociales" class="java.util.ArrayList" scope="request" />
                <td class="centrado">
                   <select id="dato-interes">
                    <option value="" selected="true">Seleccione dato de interés</option>
                   <%--c:forEach var="datoInteres" items="${datosInteres}"--%>
                   
                     <c:forEach var="dato" items="${sociales}">
                   <option value="${dato.idDato}"> ${dato.descripcion} </option>  
                     </c:forEach> <%--/c:forEach--%>
      
    </select>
                 </td>
               </c:forEach>
               </tr> 
            </c:forEach>
        </tbody>
    </table>