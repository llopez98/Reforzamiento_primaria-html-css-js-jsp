<%-- 
    Document   : iniciar_sesion
    Created on : 12/06/2021, 09:45:26 PM
    Author     : lueun
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        
        <!-- CSS -->
        <link href="../../css/styles.css" rel="stylesheet">
        <script
            src="https://kit.fontawesome.com/2f1b1cb395.js"
            crossorigin="anonymous"
        ></script>
    </head>
    <body>
        <nav class="navbar navbar--primary navbar-expand-lg sticky-top navbar-light">
            <div class="container-fluid">
                <a class="navbar-brand" href="#" title="logo">
                    <img src="../../img/logoRP.png" alt="RP logo" style="width: 8rem"/>
                </a>
              <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
              </button>
              <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                  <li class="nav-item text-uppercase">
                    <a class="nav-link" href="../../contacto.html">Contacto</a>
                  </li>
                  <li class="nav-item text-uppercase">
                    <a class="nav-link" href="../../about.html">Sobre el proyecto</a>
                  </li>                      
                </ul>
                <form class="d-flex justify-content-end">
                    <a href="iniciar_sesion.jsp" class="nav-link link-dark me-4 fs-4 text-uppercase">Iniciar sesión</a>
                    <a href="registrarse.jsp" class="btn btn-warning fs-4 text-uppercase">Registrarse</a>
                </form> 
              </div>
            </div>
        </nav>
        <div class="container">
            <div class="login-form mb-5">
               <br><h2 class="text-center">INICIO DE SESIÓN</h2><br>
               <img src="../../img/logoRP.png" class="rounded mx-auto d-block" alt="..." style="width: 38rem;"/><br>
               
               <form action="validar_login.jsp" method="post">
                  <div class="form-group">
                     <input name="correo" type="email" class="form-control" id="correo" placeholder="Correo" required>
                  </div><br>
                  <div class="form-group">
                     <input name="contrasena" type="password" class="form-control" id="contraseña" placeholder="Contraseña" required>
                  </div><br>
                  <div class="form-group">
                  <tr colspan=2><td>
                    Seleccione el tipo de inicio de sesión:
                    <input name="tipo" type="radio" value="maestro" id="tipo_maestro" required>
                     Maestro
                     <input name="tipo" type="radio"  value="estudiante" id="tipo_estudiante">
                     Estudiante
                     </td></tr>
                   </div><br>
                   <div class="form-group">
                     <input type="checkbox" name="id" value="recordar"> Recordar <br>
                  </div>
                  <button type="submit" class="btn btn-primary btn-lg mt-5">Iniciar Sesión</button><br>
 
               </form>
            </div>
        </div>
        
        <!-- FOOTER -->
    <footer class="bg-dark py-4">
        <div class="container">
            <nav class="navbar navbar-expand-lg navbar-dark justify-content-between">
                <a class="navbar-brand" href="#" title="logo">
                    <img src="../../img/logoRP.png" alt="RP logo" style="width: 8rem"/>
                </a>
                <ul class="navbar-nav ms-auto">
                  <li class="nav-item text-uppercase">
                    <a class="nav-link" href="../../contacto.html">contacto</a>
                  </li>
                  <li class="nav-item text-uppercase">
                    <a class="nav-link" href="../../about.html">sobre el proyecto</a>
                  </li>
                  <li class="nav-item text-uppercase">
                    <a class="nav-link" href="../../index.jsp">página principal</a>
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
