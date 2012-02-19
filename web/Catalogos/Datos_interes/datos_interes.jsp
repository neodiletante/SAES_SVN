<%-- 
    Document   : datos_interes
    Created on : 10/02/2012, 10:46:59 AM
    Author     : ulises
--%>

 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript" src="Catalogos/Datos_interes/datos_interes.js" />
<center>
<h2>Agregar dato de interés</h2>
<form method="POST">
<fieldset>
<label>Descripción</label>   
<p>
<textarea id="descripcion-dato-interes" name="descripcion_dato"/>
<p>
<label>Tipo de dato</label>
 <jsp:useBean id="tiposDato" class="java.util.ArrayList" scope="request" />
<select id ="tipo-dato" size="1">
    <option value="" selected="true"> Seleccione un tipo de dato </option>
  <c:forEach var="tipoDato" items="${tiposDato}">
    <option value="${tipoDato.tipo}"> ${tipoDato.descripcion} </option>  
  </c:forEach>
</select>
<a href="#">Modificar tipos</a>
<p>
<button class="ui-button" id="btn-agrega-dato">Guardar</button>

    
</fieldset>
<!--input type="submit" id="agrega_dato" value="Agregar" action="agregaDatoInteres"/-->
</form>
<center>
  <table id="tabla-grupos-actuales">
        <thead>
            <th colspan="6">Datos de interés actuales</th>
        </thead>
        <tbody>
            <tr>
                <th>Tipo</th>
                <th>Descripción</th>
                <th>Borrar</th>
                <th>Modifcar</th>
            </tr>
            <jsp:useBean id="datosInteres" class="java.util.ArrayList" scope="request" />
            <c:forEach var="datoInteres" items="${datosInteres}">
               <tr>
                <td class="resultado" id="input_tipo">${datoInteres.descTipo}</td>
                <td class="resultado" id="input_desc">${datoInteres.descripcion}</td>
                <td class="centrado">
                    <input class="check_datos" type="checkbox" value="${datoInteres.idDato}"/>
                </td>
                <td class="centrado">
                    <input class="radio_datos" type="radio" name="radio_datos" value="${datoInteres.idDato}"/>
                </td>
               </tr> 
            </c:forEach>
        </tbody>
    </table>
   
    <button class="ui-button" id="btn-borra-dato">Borra dato interés</button> 
    <button class="ui-button" id="btn-cambia-dato">Cambia dato interés</button> 
    
      <div id="forma-tipos" >
        <form method="POST">
            <fieldset >
              <div>
              <label>Descripción</label>
              <p>
                <textarea id="descripcion-tipo" />
                <button class="ui-button" id="btn-agrega-tipo">Agrega tipo</button>
              </div>
              <div>         
                 <jsp:useBean id="tiposNoUsados" class="java.util.ArrayList" scope="request" />
                 <p><select id ="tipo_dato_no_usado" size="1">
                      <option value="" selected="true"> Seleccione un tipo de dato para borrar </option>
                     <c:forEach var="tipoNoUsado" items="${tiposNoUsados}">
                       <option value="${tipoNoUsado.tipo}"> ${tipoNoUsado.descripcion} </option>  
                     </c:forEach>
                 </select>
                <button class="ui-button" id="btn-borra-tipo">Borra tipo</button>
               </div>
            </fieldset>
            <!--input type="submit" value="Agregar" /-->
        </form>   
      </div>    