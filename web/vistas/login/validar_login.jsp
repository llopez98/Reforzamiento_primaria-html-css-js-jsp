<%-- 
    Document   : validar_login
    Created on : 12/11/2021, 05:57:48 PM
    Author     : lueun
--%>

<%@page import="java.util.*" session="true" %>
<%@page import="Procesos.VerificarUsuario"%>
<%@page import="Entidades.Estudiante"%>
<%@page import="Entidades.Maestros"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            HttpSession sesion=request.getSession(); 
            String correo = request.getParameter("correo");
            String contrasena = request.getParameter("contrasena");
            String tipo = request.getParameter("tipo");
            
            VerificarUsuario vu= new VerificarUsuario();
            
            
            if(tipo.equals("maestro")){
              
              String cont = vu.VerificarUsuarioM(correo); 
              if(contrasena.equals(cont)) {

                    sesion.setAttribute("correo", correo);
                    
                   response.sendRedirect("../../index_loged_m.jsp");
                }
                else
                {
%>
                 <script>
                    alert('CREDENCIALES INCORRECTAS');
                    window.location.href = "iniciar_sesion.jsp";
                </script>
                <%                }
            }
            else if(tipo.equals("estudiante")){

              String cont = vu.VerificarUsuarioE(correo);
                if(contrasena.equals(cont)) {
                    sesion.setAttribute("correo", correo);
                   response.sendRedirect("../../index_loged.jsp");
                }
                else
                {
                    %>
                 <script>
                    alert('CREDENCIALES INCORRECTAS');
                    window.location.href = "iniciar_sesion.jsp";
                </script>
                <%
                }
                
            }
            else {
                %>
                 <script>
                    alert('CREDENCIALES AL SELECCIONAR EL TIPO DE INICIO DE SESION');
                    window.location.href = "iniciar_sesion.jsp";
                </script>
                <%
            }
            
            %>
    </body>
</html>
