<%-- 
    Document   : admin_crud
    Created on : 12/06/2021, 12:48:34 PM
    Author     : lueun
--%>

<%@page import="java.util.*" session="true" %>
<%@page import="java.util.*" session="true" %>
<%@page import="Entidades.Preguntas"%>
<%@page import="Entidades.TemasJuego"%>
<%@page import="java.util.List"%>
<%@page import="Procesos.Administrar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CRUD</title>
        
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
                    <a class="nav-link" href="admin_crud.jsp">Administrar</a>
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
                        <li><a class="dropdown-item fs-4" href="../perfil/perfil_docente.jsp">Perfil</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item fs-4" href="../../index.jsp">Cerrar sesión</a></li>
                    </ul>
                </div>  
              </div>
            </div>
            </div>
        </nav>
        
        <%
            Administrar adm = new Administrar();
            List<TemasJuego> lista = adm.ObtenerTemas();
            List<Preguntas> listaP =  adm.ObtenerPreguntas();
        %>
        <!-- PRINCIPAL -->
        <div class="container">
            <div class="card text-center m-5">
                <div class="card-body">
                  <h1 class="card-title">ADMINISTRACIÓN DE LOS TEMAS</h1>
                </div>
                <img src="../../img/banner_admin.jpg" class="card-img-bottom" alt="...">
            </div>
            <div class="d-grid gap-2">
                <button class="btn btn-success btn-lg" type="button" onclick="verTemas()">LEER TEMAS</button>
                <button class="btn btn-info btn-lg" type="button" onclick="verTemaNuevo()">CREAR UN TEMA</button>
                <button class="btn btn-danger btn-lg" type="button" onclick="verEliminar()">ELIMINAR TEMA O PREGUNTA</button>
                <button class="btn btn-info btn-lg" type="button" onclick="verGrupo()">CREAR UN GRUPO</button>
              </div>
            <!-- ELIMINAR UNA PREGUNTA -->
            <div class="m-5 d-none" id="eliminar">
                <h3>ELIMINAR UN TEMA</h3>
                <form action="../crud/deleteTema.jsp">
                    <div class="mb-3">
                        <select name="tema" class="form-select" size="5" aria-label="size 10 select">
                            <%
                                for(int i = 0; i < lista.size(); i++){
                                    %>
                                    <option value="<%=lista.get(i).getCod() %>"><%=lista.get(i).getNombre() %></option>
                                    <%
                                }
                            %>
                          </select>
                    </div>
                      <div class="d-grid gap-2 col-6 mx-auto">
                        <button type="submit" class="btn btn-danger btn-lg">ELIMINAR TEMA</button>
                      </div>
                </form>
                <br>
                <h3>ELIMINAR UNA PREGUNTA</h3>
                <form action="../crud/eliminarPregunta.jsp">
                    <div class="mb-3">
                        <select name="pregunta" class="form-select" size="10" aria-label="size 10 select">
                            <%
                                for(int i = 0; i < listaP.size(); i++){
                                    %>
                                    <option value="<%=listaP.get(i).getCod_preg() %>"><%=listaP.get(i).getPregunta() %></option>
                                    <%
                                }
                            %>
                          </select>
                    </div>
                      <div class="d-grid gap-2 col-6 mx-auto">
                                    <button type="submit" class="btn btn-danger btn-lg">ELIMINAR PREGUNTA</button>
                                  </div>
                            </form>
                        </div>
                        <br>
                        <!-- VER TEMAS -->
                        <div class="d-none" id="vertemas">

                            <div class="text-center">
                                <h1>TEMAS</h1>
                            </div>

                            <br>
                            <table class="table table-bordered">
                                <thead class="text-light bg-dark">
                                    <tr>
                                        <th>Tema</th>
                                        <th>Contenido</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% 
                                        for(int i=0; i<lista.size(); i++){
                                            %>
                                                <tr>
                                                    <td><%=lista.get(i).getNombre() %></td>
                                                    <td>
                                                        <img src="data:image/png;base64,<%=lista.get(i).getImag() %>" alt="" width="500" height="500">
                                                        <p><%=lista.get(i).getContent() %></p>
                                                    </td>
                                                </tr>
                                            <%
                                        }
                                    %>

                                </tbody>
                            </table>
                        </div>
                        <!-- CREAR GRUPO -->
                        <div class="m-5 d-none" id="grupo">
                            <h3>CREAR UN GRUPO</h3>
                            <form action="../crud/crearGrupo.jsp">
                                 <div class="form-group row">
                                    <label for="email" class="col-sm-2 col-form-label">Correo:</label>
                                    <div class="col-sm-10">
                                      <input name="email" type="text" readonly class="form-control-plaintext" id="email" value="<%=correo_act %>">
                                    </div>
                                  </div>
                                <div class="form-group row">
                                    <label for="nivel" class="col-sm-2 col-form-label">Nivel del grupo:</label>
                                    <div class="col-sm-10">
                                      <input name="nivel" type="number" class="form-control" id="nivel" placeholder="Ejem. 3" min="1" max="5" required>
                                    </div>
                                  </div>
                                  <div class="d-grid gap-2 col-6 mx-auto m-5">
                                    <button type="submit" class="btn btn-info btn-lg">CREAR EL GRUPO</button>
                                  </div>
                            </form>
                        </div>
                        <!-- CREAR UN TEMA -->
                        <div class="m-5 d-none" id="ntema">
                          <h3>CREAR UN TEMA</h3>
                          <form action="../crud/crearTema.jsp" enctype="multipart/form-data" method="post">
                            <div class="form-group row m-2">
                               <label for="cod_tema" class="col-sm-2 col-form-label">Codigo del Tema:</label>
                               <div class="col-sm-10">
                                 <input name="cod_tema" type="text" class="form-control" placeholder="TCS10-1" id="cod_tema" required>
                               </div>
                             </div>
                           <div class="form-group row m-2">
                               <label for="tema" class="col-sm-2 col-form-label">Nombre del tema:</label>
                               <div class="col-sm-10">
                                 <input name="tema" type="text" class="form-control" id="tema" placeholder="Espacio geográfico del corregimiento" required>
                               </div>
                             </div>
                             <div class="form-group row m-2">
                              <label for="contenido_text" class="form-label">Descripción: </label>
                              <textarea name="contenido_text" class="form-control" id="contenido_text" rows="5" required></textarea>
                            </div>
                            <div class="m-2">
                              <label for="img" class="form-label">Imagen del tema: </label>
                              <input name="contenido_img" class="form-control form-control-lg" id="img" type="file" accept="image/png" required>
                            </div>
                             <div class="d-grid gap-2 col-6 mx-auto m-5">
                               <button type="submit" class="btn btn-info btn-lg">CREAR EL TEMA</button>
                             </div>
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

    <script>
      let temas = document.getElementById("vertemas");
      let eliminar =  document.getElementById("eliminar");
      let grupo = document.getElementById("grupo");
      let ntema = document.getElementById("ntema");

      function verTemas(){
        temas.classList.remove("d-none");
        eliminar.classList.add("d-none");
        grupo.classList.add("d-none");
        ntema.classList.add("d-none");
      }

      function verEliminar(){
        eliminar.classList.remove("d-none");
        temas.classList.add("d-none");
        grupo.classList.add("d-none");
        ntema.classList.add("d-none");
      }
      
      function verGrupo(){
        grupo.classList.remove("d-none");
        eliminar.classList.add("d-none");
        temas.classList.add("d-none");
        ntema.classList.add("d-none");
      }

      function verTemaNuevo(){
        ntema.classList.remove("d-none");
        grupo.classList.add("d-none");
        eliminar.classList.add("d-none");
        temas.classList.add("d-none");
      }
    </script>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

    </body>
</html>
