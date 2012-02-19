<%-- 
    Document   : alumnos
    Created on : 7/02/2012, 11:53:42 PM
    Author     : ulises
--%>

 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

 <script type="text/javascript" src="Catalogos/Alumnos/alumnos.js" />
   
<center>
   <table id="tabla-alumnos-actuales">
        <thead>
            <th colspan="6">Alumnos actuales</th>
        </thead>
        <tbody>
            <tr>
                <th>No. Expediente</th>
                <th>Nombre</th>
                <th>Sexo</th>
                <th>Borrar</th>
                <th>Modificar</th>
            </tr>
            <jsp:useBean id="alumnos" class="java.util.ArrayList" scope="request" />
            <c:forEach var="alumno" items="${alumnos}">
               <tr>
                <td class="resultado" id="input_noExpediente">${alumno.noExpediente}</td>
                <td class="resultado" id="input_nombre">${alumno.nombre}</td>
                <td class="resultado" id="input_sexo">${alumno.sexo}</td>
                <td class="centrado">
                    <input class="check_alumno" type="checkbox" name="borrar"  value="${alumno.noExpediente}"/>
                </td>
                <td class="centrado">
                    <input class="radio_alumno" type="radio" name="modificar" value="${alumno.noExpediente}"/>
                </td>
               </tr> 
            </c:forEach>
    
        </tbody>
        
    </table>
    
    <button class="ui-button" id="btn-agrega-alumno">Nuevo alumno</button> 
    <button class="ui-button" id="btn-borra-alumno">Borra alumno</button> 
    <button class="ui-button" id="btn-cambia-alumno">Modifica alumno</button> 
    
      <div id="forma-agrega-alumno" >
        <form>
            <fieldset >
               <div class="div-izquierdo">
                  <p class="etiqueta"><label>No. expediente: </label>
                  <p class="etiqueta"><label>Nombre: </label>
                  <p class="etiqueta"><label>Sexo: </label>
               </div>
               <div>
                 <p><input type="text" id="noExpediente" size="10" maxlength="20"/>
                 <p><input type="text" id="nombre" size="30" maxlength="45"/>
                 <p><input class="radio_sexo" id="sexoM" type="radio" name="sexo"  value="Mujer"/><label>Mujer      </label>
                 <input class="radio_sexo" id="sexoH" type="radio" name="sexo" value="Hombre"/><label>Hombre</label>
               </div>
            </fieldset>
       
        </form>   
      </div>   