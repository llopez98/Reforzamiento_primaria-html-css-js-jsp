<%-- 
    Document   : ranking
    Created on : 12/16/2021, 01:37:07 PM
    Author     : lueun
--%>

<%@page import="Entidades.EstudianteDashboard"%>
<%@page import="Procesos.ConsultarDashboard"%>
<%@page import="Procesos.ConsultarEstudiante"%>
<%@page import="Entidades.Estudiante"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="Procesos.ConsultarRanking"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ranking Global</title>
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
                    <a class="nav-link" href="../aprender/aprender_temas.jsp">Temas</a>
                  </li>                  
                  <li class="nav-item text-uppercase">
                    <a class="nav-link" href="../aprender/descripcion.html">Aprender</a>
                  </li>
                  <li class="nav-item text-uppercase">
                    <a class="nav-link" href="../dashboard/dashboard.jsp">Dashboard</a>
                  </li>
                  <li class="nav-item text-uppercase">
                    <a class="nav-link" href="ranking.jsp">Ranking</a>
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
                        <li><a class="dropdown-item fs-4" href="perfil.jsp">Perfil</a></li>
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
            <main class= "offset-sm-4">
            <h1 class="container search-container" padding="0px "   margin=" 78rem"> Ranking  </h1>
             <h1>         </h1>
            <%   
                
                  // CLASSSSS      OBJETO   = N
                ConsultarRanking  consultr = new ConsultarRanking();   //
                  List<Estudiante> listae =  consultr.ConsultarRANK(); // pide todos los correos 
                   
                ConsultarEstudiante consultarE = new ConsultarEstudiante(); //intancia de datos del estudiante
         
                
                
             
              
           
                for (int i = 0; i < listae.size(); i++) { // ciclo para imprimir todos los estudiantes
                    
                     String   correo =   listae.get(i).getCorreo();   // asigana el correo del estudiante
            
               
                   
                                          int acumulador=0 ; 
           
            
                             Estudiante estud = new Estudiante();                   // consulta el puntaje de los estudiantes
                             ConsultarEstudiante er =  new ConsultarEstudiante();
                                                 estud = er.ConsultarEst(correo);       
                                                                                          // consulta el puntaje de los estudiantes por medio de correo
                            ConsultarDashboard consult = new ConsultarDashboard();
                            List<EstudianteDashboard> lista =  consult.ConsultarEst(correo);  // asigna puntaje a la lista
               
                             for(int q=0; q<lista.size(); q++){
                            
                                   acumulador=lista.get(q).getPuntos() +acumulador;       // suma los puntajes
                                                   }
                       
            %> <% %>
            <div class="cards">
                <div class="card-body">
               
                  <h5 class="card-title"><%=i+1 %> Estudiante:   <%=listae.get(i).getCorreo()   %></h5>
                  <h6 class="card-subtitle mb-2 text-muted">Cedula    <%=estud.getCedula()   %></h6>
                  <p class="card-text">Puntuacion   <%=acumulador%> </p>
                  
                
                </div>
                
            </div>
            <%
                }
            %>          
        </main>
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
        
        <!-- JS BOOTSTRAP -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
   
    </body>
</html>
