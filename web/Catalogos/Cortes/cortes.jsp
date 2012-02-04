<%@page import="java.lang.StringBuffer" %>
<%@page import="java.sql.*, javax.servlet.*"%>
<% String accion=request.getParameter("accion");
   Connection conect = (Connection)session.getAttribute("conn");
   conect.setAutoCommit(true);
   java.sql.Statement stm = conect.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
   ResultSet rst=null;
   
   String corte="0";
    %>
<%if(accion==null){
   rst = stm.executeQuery("Select max(corte)total from cortes");
   if(rst.first()){
        corte= Integer.parseInt(rst.getString("total"))+1+"";
   }
   else{ 
       corte=request.getParameter("corte"); 
   }
   corte=corte==null?"1":corte;
   rst.close();
   rst=stm.executeQuery("select corte, date_format(fecha_ini,'%d/%m/%Y')fecha_ini, date_format(fecha_fin,'%d/%m/%Y')fecha_fin, descripcion from cortes");
             
%>
<script src="Catalogos/Cortes/cortes.js" ></script>
    <center>
        <table id="info-cortes">
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
            <%if(rst.first()){
                do{%>
            <tr id="corte_<%=rst.getString("corte")%>">
                <td class="resultado"><%=rst.getString("corte")%></td>
                <td class="resultado"><%=rst.getString("fecha_ini")%></td>
                <td class="resultado"><%=rst.getString("fecha_fin")%></td>
                <td class="resultado"><%=rst.getString("descripcion")%></td>
                <td class="centrado">
                    <input type="checkbox" name="corte" id="corte" value="<%=rst.getString("corte")%>"/>
                </td>
                <td class="centrado">
                    <input type="radio" name="modificar" id="modificar" value="<%=rst.getString("corte")%>"/>
                </td>
            </tr>
            <%}while(rst.next());
              }
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
                 <p> <input type="hidden" id="nuevo-corte" value="<%=corte%>"/><%=corte%><br>
                 <p><input type="text" id="fecha_ini" size="10" readonly/>
                 <p><input type="text" id="fecha_fin" size="10" readonly />
                 <p><textarea id="descripcion"></textarea>
                </div>
            </fieldset>
        </form>   
      </div>             
<%}
  else{ /*agregar corte*/
     if(accion.equalsIgnoreCase("agregar")){%>
     <%@include file="agregarCorte.jspf"%>
     <%}
     
     /*borrar elemento*/
     if(accion.equalsIgnoreCase("borrar")){
            out.println("OK");
     }
     
     /*modificar elemento*/
     if(accion.equalsIgnoreCase("modificar")){
         out.println("OK");
     }
  }%>


