<%-- 
    Document   : crearGrupo
    Created on : 12/07/2021, 01:50:48 PM
    Author     : lueun
--%>

<%@page import="Entidades.Grupos"%>
<%@page import="Procesos.InsertarGrupo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        String correo = request.getParameter("email");
        int nivel = Integer.parseInt(request.getParameter("nivel"));
        
        int result = 0;
        
        Grupos grupo = new Grupos();
        InsertarGrupo insG = new InsertarGrupo();
        
        grupo.setCorreo_maestro(correo);
        grupo.setNivel(nivel);
        
        result = insG.Insertar(grupo);

    if(result == 1){
        
        %>
        <script>
            alert('DATOS INSERTADOS CORRECTAMENTE');
            window.location.href = "../../vistas/crud/admin_crud.jsp";
        </script>
        <%
    }
    else{
        %>
        <script>
            alert('ERROR AL INSERTAR LOS DATOS');
            window.location.href = "../../vistas/crud/admin_crud.jsp";
        </script>
        <%
        
    }
%>
    </body>
</html>
