<%-- 
    Document   : index.jsp
    Created on : 12/04/2021, 10:56:47 AM
    Author     : lueun
--%>

<%@page import="java.util.*" session="true" %>
<%@page import="Procesos.Conectar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        
        <!-- CSS -->
        <link href="css/styles.css" rel="stylesheet">
        <script
            src="https://kit.fontawesome.com/2f1b1cb395.js"
            crossorigin="anonymous"
        ></script>
    </head>
    <body>
        <nav class="navbar navbar--primary navbar-expand-lg sticky-top navbar-light">
            <div class="container-fluid">
                <a class="navbar-brand" href="#" title="logo">
                    <img src="img/logoRP.png" alt="RP logo" style="width: 8rem"/>
                </a>
              <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
              </button>
              <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                  <li class="nav-item text-uppercase">
                    <a class="nav-link" href="contacto.html">Contacto</a>
                  </li>
                  <li class="nav-item text-uppercase">
                    <a class="nav-link" href="about.html">Sobre el proyecto</a>
                  </li>                      
                </ul>
                <form class="d-flex justify-content-end">
                    <a href="vistas/login/iniciar_sesion.jsp" class="nav-link link-dark me-4 fs-4 text-uppercase">Iniciar sesión</a>
                    <a href="vistas/login/registrarse.jsp" class="btn btn-warning fs-4 text-uppercase">Registrarse</a>
                </form> 
              </div>
            </div>
        </nav
        <%
            HttpSession sesion=request.getSession(); 
            String correo = "";
            sesion.setAttribute("correo", correo);
        %>
        <div class="container">
            <header>
        <div class="mb-3">
              <br><h2 class="text-center">REFORZAMIENTO PRIMARIA</h2><br>
              <img src="img/logoRP.png" class="rounded mx-auto d-block" alt="..." style="width: 38rem;">
            <div class="rounded mx-auto d-block" alt="..." style="width: 90rem;">
                <p class="Message">La plataforma, Reforzamiento Primaria, es un proyecto enfocado en mejorar el aprendizaje de temas propios de tercero, cuarto y quinto grado de nivel primario en la República de Panamá, abarcando distintas materias, contenidos y ejercicios que promoverá la enseñanza a los niños de manera divertida y mucho más práctica...</p>
                <a href="vistas/login/registrarse.jsp" class="btn btn-primary">CONOCER MÁS</a>
            </div>
        </div>
            
        <main>
            <br><br><br>
        </main>
        </div>
        
        <!-- FOOTER -->
    <footer class="bg-dark py-4">
        <div class="container">
            <nav class="navbar navbar-expand-lg navbar-dark justify-content-between">
                <a class="navbar-brand" href="#" title="logo">
                    <img src="img/logoRP.png" alt="RP logo" style="width: 8rem"/>
                </a>
                <ul class="navbar-nav ms-auto">
                  <li class="nav-item text-uppercase">
                    <a class="nav-link" href="contacto.html">contacto</a>
                  </li>
                  <li class="nav-item text-uppercase">
                    <a class="nav-link" href="about.html">sobre el proyecto</a>
                  </li>
                  <li class="nav-item text-uppercase">
                    <a class="nav-link" href="index.jsp">página principal</a>
                  </li>
                </ul>                               
            </nav>   
            <hr class="dropdown-divider text-light">
            <p class="text-center text-light fs-5 mt-5">&copy;2021. Reforzamiento Primaria</p> 
        </div>            
    </footer> 
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

    </body>
</html>
