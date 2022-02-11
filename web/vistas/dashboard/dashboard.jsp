<%-- 
    Document   : dashboard
    Created on : 12/06/2021, 08:51:58 PM
    Author     : lueun
--%>
<%@page import="java.util.*" session="true" %>
<%@page import="Entidades.EstudianteDashboard"%>
<%@page import="Procesos.ConsultarDashboard"%>
<%@page import="Procesos.ConsultarEstudiante"%>
<%@page import="Entidades.Estudiante"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dashboard</title>
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
                <a class="nav-link" href="../aprender/aprender_temas.jsp">Temas</a>
              </li>                  
              <li class="nav-item text-uppercase">
                <a class="nav-link" href="../aprender/descripcion.html">Aprender</a>
              </li>
              <li class="nav-item text-uppercase">
                <a class="nav-link" href="dashboard.jsp">Dashboard</a>
              </li>      
              <li class="nav-item text-uppercase">
                <a class="nav-link" href="../rank/ranking.jsp">Ranking</a>
              </li> 
            </ul>
            <div class="d-flex align-items-center">
                <%
                HttpSession sesion=request.getSession();
                String correo_act = (String)sesion.getAttribute("correo");%>
                <div class="m-2">
                    <h4>USUARIO: <%=correo_act %> </h4>
                </div>
                    <form class="d-flex search-bar-container" action="../aprender/resultado_busqueda.jsp">
                      <button type="submit" title="Buscar tema" class="search-bar__leading-icon">
                          <i class="fas fa-search"></i>
                      </button>                        
                      <input
                          type="search"
                          placeholder="Buscar tema..."
                          id="buscador"
                          name="search_query"
                          aria-label="Buscar tema"
                          class="search-bar__input form-control form-control-sm"
                        />        
                  </form>
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
                    <li><a class="dropdown-item fs-4" href="../perfil/perfil.jsp">Perfil</a></li>
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
      <div class="card m-5">
                <div class="card-body text-center ">
                  <h1 class="card-text">DASHBOARD</h1>
                </div>
                <img src="../../img/banner_dashboard.jpg" class="card-img-bottom" alt="...">
            </div>
        <%
            
            Estudiante estud = new Estudiante();
            ConsultarEstudiante e =  new ConsultarEstudiante();
            
            estud = e.ConsultarEst(correo_act);
            
            ConsultarDashboard consult = new ConsultarDashboard();
            List<EstudianteDashboard> lista =  consult.ConsultarEst(correo_act);

            %>
            <h2><%=estud.getNombre() %> <%=estud.getApellido() %></h2>
            <h3>CEDULA: <%=estud.getCedula() %></h3>
            <h3>GRUPO: <%=estud.getCod_grupo() %></h3>
            <table class="table table-sm mb-2">
                <thead>
                  <tr>
                    <th scope="col">Tema</th>
                    <th scope="col">Pregunta</th>
                    <th scope="col">Puntos Obtenidos</th>
                  </tr>
                </thead>
                <tbody>
                    <%
                        for(int i=0; i<lista.size(); i++){
                            %>
                                <tr>
                                    <td><%=lista.get(i).getTema() %></td>
                                    <td><%=lista.get(i).getPregunta() %></td>
                                    <td><%=lista.get(i).getPuntos() %></td>
                                  </tr>
                            <%
                        }
                    %>
                  
                </tbody>
              </table>
        
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
                    <a class="nav-link" href="../../contacto_loged.html">contacto</a>
                  </li>
                  <li class="nav-item text-uppercase">
                    <a class="nav-link" href="../../about_loged.html">sobre el proyecto</a>
                  </li>
                  <li class="nav-item text-uppercase">
                    <a class="nav-link" href="../../index_loged.jsp">página principal</a>
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
