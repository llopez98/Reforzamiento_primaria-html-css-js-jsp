<%-- 
    Document   : crearTema
    Created on : 12/16/2021, 06:02:56 PM
    Author     : lueun
--%>

<%@page import="java.io.InputStream"%>
<%@page import="Procesos.GuardarCrud"%>
<%@page import="Entidades.Tema"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String cod_tema = request.getParameter("cod_tema");
            String tema = request.getParameter("tema");
            String contenido_text = request.getParameter("contenido_text");
            Part contenido_img = request.getPart("contenido_img");
            
            //transformando imagen
            InputStream fis = contenido_img.getInputStream();

            
            Tema theme = new Tema();
            theme.setCod(cod_tema);
            theme.setNombre(tema);
            theme.setContent(contenido_text);
            theme.setImage_in(fis);
            theme.setSize((int)contenido_img.getSize());
            
            GuardarCrud save = new GuardarCrud();
            
            int res = save.GuardarTema(theme);
            
            if(res == 1){
        
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
