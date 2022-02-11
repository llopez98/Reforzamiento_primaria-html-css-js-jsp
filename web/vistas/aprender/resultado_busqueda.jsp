<%-- 
    Document   : resultado_busqueda
    Created on : 12/08/2021, 10:18:58 PM
    Author     : lueun
--%>

<%@page import="java.util.*" session="true" %>
<%@page import="Entidades.Tema"%>
<%@page import="Procesos.ConsultarTema"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
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
                <a class="nav-link" href="aprender_temas.jsp">Temas</a>
              </li>                  
              <li class="nav-item text-uppercase">
                <a class="nav-link" href="descripcion.html">Aprender</a>
              </li>
              <li class="nav-item text-uppercase">
                <a class="nav-link" href="../dashboard/dashboard.jsp">Dashboard</a>
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
                    <form class="d-flex search-bar-container" action="resultado_busqueda.jsp">
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
                          <li><a class="dropdown-item fs-4" href="../perfil.jsp">Perfil</a></li>
                          <li><hr class="dropdown-divider"></li>
                          <li><a class="dropdown-item fs-4" href="../../index.jsp">Cerrar sesión</a></li>
                      </ul>
                  </div>                       
                </div>

              </div>
            </div>
    </nav>
        <!-- PRINCIPAL -->
        <div class="d-flex flex-column min-vh-100">
             <div class="container flex-grow-1 d-flex flex-column">  
                  <%
                    String searchQuery = request.getParameter("search_query");
                    ConsultarTema consulta = new ConsultarTema();
                    List<Tema> temas = consulta.getTemas(searchQuery);
                    
                    if (searchQuery != null && searchQuery.trim().length() != 0) {                                            
                %>
                <header>
                    <h1 style="margin-top: 8rem;">Resultados de la búsqueda</h1>
                </header>
                <main class="search-container">  
                    <% 
                            for (Tema tema: temas) {                                                                                             
                    %>
                    <div class="card border-success">
                        <div class="card-body d-flex flex-column">
                          <h2 class="card-title fs-2"><%= tema.getNombre() %></h2>
                          <p class="card-text flex-grow-1"><%= tema.getContent() %></p>
                          <a href="#" class="card-link text-uppercase fs-5">Ver más</a>
                        </div>
                    </div>
                    <%
                        }
                    %>
                </main>
                <%
                    } else if (temas.isEmpty() && searchQuery != null) {
                %>                
                <main class="container mt-5 d-flex flex-column justify-content-center align-items-center flex-grow-1">                    
                    <img src="../../img/void.svg" class="w-50 text-center" />
                    <h1 class="mt-5">No se encontró ningún tema</h1>
                </main>
                <%
                    } else {
                %>                
                <main class="container mt-5 d-flex flex-column justify-content-center align-items-center flex-grow-1">                    
                    <img src="../../img/not_found.svg" class="w-75 text-center" />
                    <h1 class="mt-5">Busca algún tema</h1>
                </main>
                <%
                    }
                %>      
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
        </div>    
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    
    </body>
</html>
