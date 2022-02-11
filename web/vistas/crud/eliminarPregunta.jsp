<%-- 
    Document   : eliminarPregunta
    Created on : 12/06/2021, 02:07:33 PM
    Author     : lueun
--%>

<%@page import="Procesos.EliminarPregunta"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Eliminando</title>
    </head>
    <body>
            <%
    String cod_pre = request.getParameter("pregunta");
    
    int result = 0;
    
    EliminarPregunta eli = new EliminarPregunta();
    result = eli.guardarTema(cod_pre);

    if(result == 1){
        %>
        <script>
            alert('DATOS ELIMINADOS CORRECTAMENTE');
            window.location.href = "../../vistas/crud/admin_crud.jsp";
        </script>
        <%
    }
    else{
        %>
        <script>
            alert('ERROR AL ELIMINAR LOS DATOS');
            window.location.href = "../../vistas/crud/admin_crud.jsp";
        </script>
        <%
        
    }
%>
    </body>
</html>
