<%-- 
    Document   : perfil_docente
    Created on : 12/04/2021, 04:43:35 PM
    Author     : lueun
--%>

<%@page import="java.util.*" session="true" %>
<%@page import="Procesos.ConsultarMaestro"%>
<%@page import="Entidades.Maestros"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <!-- CARGANDO BOOTSTRAP-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <!-- CSS -->
        <link href="../../css/styles.css" rel="stylesheet">
        <script
            src="https://kit.fontawesome.com/2f1b1cb395.js"
            crossorigin="anonymous"
        ></script>
    </head>
    <body>
        <!-- MENU -->
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
                    <a class="nav-link" href="../dashboard/dashboard_m.jsp">Dashboard</a>
                  </li>
                  <li class="nav-item text-uppercase">
                    <a class="nav-link" href="../crud/admin_crud.jsp">Administrar</a>
                  </li>
                  <li class="nav-item text-uppercase">
                    <a class="nav-link" href="../reportes/reportes.jsp">Reportes</a>
                  </li>                      
                </ul>
                <div class="d-flex align-items-center">
                    <%
                HttpSession sesion=request.getSession();
                String correo_act = (String)sesion.getAttribute("correo");%>
                <div class="m-2">
                    <h4>USUARIO: <%=correo_act %> </h4>
                </div>
                <div
                    class="nav__options dropstart ms-5"
                    data-bs-toggle="tooltip"
                    data-bs-placement="bottom"
                    title="Opciones">
                    <div
                        class="nav__options-btn-container"
                        id="dropdownMenuButton1"
                        data-bs-toggle="dropdown"
                        aria-expanded="false">
                        <i class="fas fa-ellipsis-v"></i>
                    </div>                                                
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item fs-4" href="perfil_docente.jsp">Perfil</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item fs-4" href="../../index.jsp">Cerrar sesión</a></li>
                    </ul>
                </div>  
              </div>
            </div>
            </div>
        </nav>

        <!-- PRINCIPAL -->

        <div class="container">
            <%
                Maestros m = new Maestros();
                ConsultarMaestro consultarM = new ConsultarMaestro();
                
                
                m = consultarM.ConsultarMae(correo_act);
            %>

            <h2 class="text-center">PERFIL DEL USUARIO</h2>

            <img src="../../img/perfil.png" class="rounded mx-auto d-block" alt="..." style="width: 18rem;">

            <form action="perfil_docente_guardado.jsp" method="post">
                <div class="mb-3">
                  <label for="nombre" class="form-label">Nombre</label>
                  <input name="nombre" type="text" class="form-control" id="nombre" value="<%=m.getNombre() %>" readonly="readonly">
                </div>
                <div class="mb-3">
                    <label for="apellido" class="form-label">Apellido</label>
                    <input name="apellido" type="text" class="form-control" id="apellido" value="<%=m.getApellido() %>" readonly="readonly">
                </div>
                <div class="mb-3">
                    <label for="correo" class="form-label">Correo</label>
                    <input name="correo" type="email" class="form-control" id="correo" value="<%=m.getCorreo() %>" readonly="readonly">
                </div>
                <div class="mb-3">
                    <label for="cedula" class="form-label">Cedula</label>
                    <input name="cedula" type="text" class="form-control" id="cedula" value="<%=m.getCedula() %>" readonly="readonly">
                </div>
                <div class="mb-3">
                    <label for="estud" class="form-label">Estudios Didacticos</label>
                    <input name="estud" type="text" class="form-control" id="estud" value="<%=m.getEstud_didact() %>">
                </div>
                <div class="mb-3">
                    <label for="pass" class="form-label">Cambiar Contraseña</label>
                    <input name="pass" type="password" class="form-control" id="pass">
                </div>
                <button type="submit" class="btn btn-primary">Guardar Cambios</button>
            </form>
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
                        <a class="nav-link" href="../../contacto_loged_m.html">contacto</a>
                      </li>
                      <li class="nav-item text-uppercase">
                        <a class="nav-link" href="../../about_loged_m.html">sobre el proyecto</a>
                      </li>
                      <li class="nav-item text-uppercase">
                        <a class="nav-link" href="../../index_loged_m.jsp">página principal</a>
                      </li>
                    </ul>                               
                </nav>   
                <hr class="dropdown-divider text-light">
                <p class="text-center text-light fs-5 mt-5">&copy;2021. Reforzamiento Primaria</p> 
            </div>            
        </footer> 
        
        <!-- JS BOOTSTRAP -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    
    </body>
</html>
