<%-- 
    Document   : index
    Created on : 14/01/2012, 01:13:58 PM
    Author     : daniel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="Catalogos/Genericos/conectar.jspf" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pagina inicial saes</title>
        <style media="all" type="text/css">@import "Estilos/saes-ie.css";</style>
        <style media="all" type="text/css">@import "Estilos/css/dark-hive/jquery-ui-1.8.17.custom.css";</style>
        <script src="JavaScript/js/jquery-1.7.1.min.js"></script>  
        <script src="JavaScript/js/jquery-ui-1.8.17.custom.min.js"></script>  
        <style media="all" type="text/css">@import "Estilos/forma-dialogo.css";</style>

        <% String ruta=null;
       int o= request.getParameter("o")==null?0:Integer.parseInt(request.getParameter("o"));
       //o=1;
        switch(o){
            case 1:ruta="buscaCortes?url=Catalogos/Grupos/grupos.jsp";break;
            case 3:ruta="mostrarAlumnos";break; 
            case 4:ruta="muestraDatosInteres";break;
            case 5:ruta="buscaCortes?url=Catalogos/Redes_sociales/redes_sociales_reg.jsp";break;
            case 6:ruta="modificaRedesSociales";break;
            default:ruta="Catalogos/Cortes/cortes.jsp";break;
        }
    %> 
        <script type="text/javascript">
            $(function(){
             
             $('#_principal').load('<%=ruta%>');
             $('button').addClass("ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only");
             
            });
               
 
         </script>
    </head>
    
    <body>
        
        <label class="h4">Departamento de Psicolog&iacute;a</label><hr>
        <label class="h6">Sistema de registro y análisis de interacciones escolares</label>
        <%@include file="Menu/menu.jspf" %>
        <br>
        

        
        <div id="_principal" class="carga-paginas">
            
        </div>
        <!-- solo para probar la bd %@include file="Catalogos/Genericos/newjsp.jsp" %-->
    </body>
</html>
<!--%@include file="Catalogos/Genericos/desconectar.jspf" %-->