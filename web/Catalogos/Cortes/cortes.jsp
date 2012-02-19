<%@page import="java.lang.StringBuffer" %>
<%@page import="java.sql.*, javax.servlet.*"%>
<% 
   String accion=request.getParameter("accion");
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
   

    rst = stm.executeQuery("SELECT date_format(d,'%d') max_fecha_fin_d, date_format(d,'%m') max_fecha_fin_m, date_format(d,'%Y') max_fecha_fin_y FROM (SELECT max(fecha_fin) d FROM cortes) mxd");
    String max_fecha_fin_d = null ;
    String max_fecha_fin_m = null ;
    String max_fecha_fin_y = null ;
    if (rst.first()){
       max_fecha_fin_d = rst.getString("max_fecha_fin_d");
       max_fecha_fin_m = rst.getString("max_fecha_fin_m");
       max_fecha_fin_y = rst.getString("max_fecha_fin_y");
       // TODO como no es posible que no tenga fecha fin, agregar constraints a las fechas
   }
     /*else{
       // TODO que pasa si no hay registros
     }*/
   rst.close();     
   
   
   rst=stm.executeQuery("select corte, date_format(fecha_ini,'%d/%m/%Y')fecha_ini, "+
           "date_format(fecha_fin,'%d/%m/%Y')fecha_fin, descripcion from cortes");
   
   PreparedStatement pst = conect.prepareStatement(" select * from tc_grupos where corte=?");
   
     
             
%>
<script src="Catalogos/Cortes/cortes.js" ></script>
<br>
    <center>
        <button class="ui-button" id="btn-agrega-corte">Iniciar corte</button> 
        <%if(max_fecha_fin_d!=null){%>
            <button class="ui-button" id="btn-borra-corte">Borrar corte</button> 
            <button class="ui-button" id="btn-cambia-corte">Cambiar corte</button> 
        <%}%>    
        <br>
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
                ResultSet rst2=null;
                boolean primero=true;
                String cte=null;
                do{
                 cte=rst.getString("corte");%>
                <tr id="corte_<%=cte%>">
                    <td class="resultado"><%=rst.getString("corte")%></td>
                    <td class="resultado">
                        <%=rst.getString("fecha_ini")%>
                        <input type="hidden" id="fecha_ini_<%=cte%>" value="<%=rst.getString("fecha_ini")%>"/>
                    </td>
                    <td class="resultado">
                        <%=rst.getString("fecha_fin")%>
                        <input type="hidden" id="fecha_fin_<%=cte%>" value="<%=rst.getString("fecha_fin")%>"/>
                    </td>
                    <td class="resultado">
                        <%=rst.getString("descripcion")%>
                        <input type="hidden" id="descripcion_<%=cte%>" value="<%=rst.getString("descripcion")%>"/>
                    </td>
                    <td class="centrado">
                        <% pst.setString(1, cte);
                           rst2=pst.executeQuery();
                           if(!rst2.first()){%>
                            <input type="checkbox" name="corte" id="corte" value="<%=rst.getString("corte")%>"/>
                        <%}
                          rst2.close();%>
                    </td>
                    <td class="centrado">
                        <input type="radio" <%=primero?"checked":""%>   name="modificar" id="modificar" value="<%=rst.getString("corte")%>"/>
                    </td>
                </tr>
                <%primero=false;
                }while(rst.next());
              }
              else{%>
              <tr>
                  <td class="azul" colspan="4"><center>No hay información disponible</td>
              </tr>
            <%}%>
        </tbody>
    </table>
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
                 <p> <input type="hidden" id="nuevo-corte" value="<%=corte%>"/>
                     <label id="lbl_corte"><%=corte%></label><br>
                 <p><input type="text" id="fecha_ini" size="10" readonly/>
                 <p><input type="text" id="fecha_fin" size="10" readonly />
                 <p><textarea id="descripcion"></textarea>
                    <input type="hidden" id="opcion"/>
                    <input type="hidden" id="max_fecha_fin_d" value="<%=max_fecha_fin_d!=null?max_fecha_fin_d:"01/01/1990"%>"/>
                    <input type="hidden" id="max_fecha_fin_m" value="<%=max_fecha_fin_m!=null?max_fecha_fin_m:"01/01/1990"%>"/>
                    <input type="hidden" id="max_fecha_fin_y" value="<%=max_fecha_fin_y!=null?max_fecha_fin_y:"01/01/1990"%>"/>
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
     if(accion.equalsIgnoreCase("modificar")){%>
     <%@include file="cambiarCorte.jspf"%>
     <%}
      //cerrar statements y resultsets 
     try{
       if(rst!=null)rst.close();
       if(stm!=null)stm.close();
     }
     catch(Exception ex){}finally{}
}%>


