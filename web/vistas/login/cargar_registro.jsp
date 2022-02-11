<%-- 
    Document   : cargar_registro
    Created on : 12/11/2021, 04:41:42 PM
    Author     : lueun
--%>

<%@page import="Entidades.Maestros"%>
<%@page import="Entidades.Estudiante"%>
<%@page import="Procesos.Registrar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        int result = 0;
        String tipo = request.getParameter("tipo");
         if(tipo.equals("Estudiante")){

            Registrar re = new Registrar();
            Estudiante es = new Estudiante();

           es.setNombre(request.getParameter("nombre")); 
           es.setApellido(request.getParameter("apellido")); 
           es.setCorreo(request.getParameter("correo"));
           es.setCedula(request.getParameter("cedula"));
           es.setCod_grupo(request.getParameter("grupo"));
           es.setContraseña(request.getParameter("pass1"));
           
           
           result =  re.RegistrarEstudiante(es);

        }
         else if(tipo.equals("Maestro")){

            Registrar re = new Registrar();
            Maestros ma = new Maestros();

           ma.setNombre(request.getParameter("nombre")); 
           ma.setApellido(request.getParameter("apellido")); 
           ma.setCorreo(request.getParameter("correo"));
           ma.setCedula(request.getParameter("cedula"));
           ma.setEstud_didact(request.getParameter("seleccion"));
           ma.setContraseña(request.getParameter("pass3"));
           
           
           
           result =  re.RegistrarMaestros(ma);

        }
         else {
             %>
        <script>
            alert('ERROR AL SELECCIONAR EL TIPO');
            window.location.href = "registrarse.jsp";
        </script>
        <%
         }
        

    if(result == 1){
        
        %>
        <script>
            alert('DATOS INSERTADOS CORRECTAMENTE');
            window.location.href = "iniciar_sesion.jsp";
        </script>
        <%
    }
    else{
        %>
        <script>
            alert('ERROR AL INSERTAR LOS DATOS');
            window.location.href = "registrarse.jsp";
        </script>
        <%
        
    }
%>
    </body>
</html>
