<%-- 
    Document   : deleteTema
    Created on : 12/06/2021, 05:31:13 PM
    Author     : lueun
--%>

<%@page import="Procesos.EliminarTema"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Eliminando</title>
    </head>
    <body>
        <%
    String cod_tema = request.getParameter("tema");
    
    int result = 0;
    
    EliminarTema eli = new EliminarTema();
    result = eli.guardarTema(cod_tema);

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
