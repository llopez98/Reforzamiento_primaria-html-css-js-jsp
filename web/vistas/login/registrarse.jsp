<%-- 
    Document   : registrarse
    Created on : 12/06/2021, 09:45:45 PM
    Author     : lueun
--%>

<%@page import="Entidades.Grupos"%>
<%@page import="java.util.List"%>
<%@page import="Procesos.ConsultarGrupo"%>
<%@page import="Procesos.Registrar"%>
<%@page import="Entidades.Estudiante"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrarse</title>
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
            <div class="login-form">
                 <br><h2 class="text-center">¡REGISTRATE!</h2><br>
        
     
                 
        <%      
   
                
                ConsultarGrupo consult = new ConsultarGrupo();
                List<Grupos> lista = consult.TraerGruposDisponibles();
                 
                 
                 
                
            %>
 
         
            <div>
                <h3>Tipo de Registro:</h3>
                <button type="button" class="btn btn-primary btn-lg" onclick="verTipoE()" >ESTUDIANTE</button>
                <button type="button" class="btn btn-secondary btn-lg" onclick="verTipoM()" >MAESTRO</button>
            </div>

            <!-- FORM ESTUDIANTE -->
            <div class="" id="est">
                <form action="cargar_registro.jsp" method="post">
         
                 
                    <div class="form-group">
                      <label for="tipo1" class="form-label">Tipo:</label>
                      <input name="tipo"  type="text" class="form-control" id="tipo1" value="Estudiante"  readonly>
                    </div>
                    <div class="form-group">
                      <label for="nombre1" class="form-label">Nombre</label>
                      <input name="nombre"  type="text" class="form-control" id="nombre1" placeholder="Ej. José" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="apellido1" class="form-label">Apellido</label>
                        <input name="apellido" required type="text" class="form-control" id="apellido1" placeholder="Ej. Perez">
                    </div>
                    
                    <div class="form-group">
                        <label for="correo1" class="form-label">Correo</label>
                        <input name="correo" required type="email" class="form-control" id="correo1" placeholder="Ej. jperez@gmail.com">
                    </div>
                    
                    <div class="form-group">
                        <label for="cedula1" class="form-label">Cedula</label>
                        <input name="cedula" required type="text" class="form-control" id="cedula1" placeholder="Ej. 08-0600-03456">
                    </div>
                    <div class="form-group mt-4">
                        <select name="grupo" class="form-select">
                            <%
                                for(int i = 0; i < lista.size(); i++){
                                    %>
                                    <option value="<%=lista.get(i).getCod_grupo() %>">GRUPO: <%=lista.get(i).getCod_grupo() %>, NIVEL: <%=lista.get(i).getNivel() %></option>
                                    <%
                                }
                            %>
                        </select>
                    </div>
                    
                      <div class="m-3">
                        <div id="error" class="alert alert-danger d-none" role="alert">
                            Las contraseñas no coinciden, vuelve a intentarlo
                        </div>
                        <div id="ok" class="alert alert-success d-none" role="alert">
                            Las contraseñas coinciden!
                        </div>
                      </div>                
                    
                    
                    <div class="form-group">
                        <label for="pass1" class="form-label">Contraseña</label>
                        <input name="pass1" type="password" class="form-control" id="pass1" onkeyup='check();' required>
                    </div>
                    
                    <div class="form-group">
                        <label for="pass2" class="form-label">Confirmar Contraseña</label>
                        <input name="pass2" type="password" class="form-control" id="pass2" onkeyup='check();' required>
                    </div><br>
                    
                    <button type="submit" id="registro1" class="btn btn-info btn-lg" >Registrar</button>
                </form>
            </div>
            <!-- FORM MAESTRO -->
            <div class="d-none" id="mae">
                <form action="cargar_registro.jsp" method="post">
                    <div class="form-group">
                        <label for="tipo" class="form-label">Tipo:</label>
                        <input name="tipo"  type="text" class="form-control" id="tipo" value="Maestro" readonly>
                    </div>
                    <div class="form-group">
                        <label for="nombre" class="form-label">Nombre</label>
                        <input name="nombre"  type="text" class="form-control" id="nombre" placeholder="Ej. José" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="apellido" class="form-label">Apellido</label>
                        <input name="apellido" required type="text" class="form-control" id="apellido" placeholder="Ej. Perez">
                    </div>
                    
                    <div class="form-group">
                        <label for="correo" class="form-label">Correo</label>
                        <input name="correo" required type="email" class="form-control" id="correo" placeholder="Ej. jperez@gmail.com">
                    </div>
                    
                    <div class="form-group">
                        <label for="cedula" class="form-label">Cedula</label>
                        <input name="cedula" required type="text" class="form-control" id="cedula" placeholder="Ej. 08-0600-03456">
                    </div>
                    <div class="form-group mt-4" id="tipo">
                        <label for="exp" class="form-label">¿Usted cuenta con estudios en didáctica?</label>
                        <select name="seleccion" id="opciones">
                        <option value="Si">Si</option>
                        <option value="No">No</option>
                        </select>
                    </div>
                    <div class="m-3">
                        <div id="error2" class="alert alert-danger d-none" role="alert">
                            Las contraseñas no coinciden, vuelve a intentarlo
                        </div>
                        <div id="ok2" class="alert alert-success d-none" role="alert">
                            Las contraseñas coinciden!
                        </div>
                    </div>                
                    
                    
                    <div class="form-group">
                        <label for="pass3" class="form-label">Contraseña</label>
                        <input name="pass3" type="password" class="form-control" id="pass3" onkeyup='check2();' required>
                    </div>
                    
                    <div class="form-group">
                        <label for="pass4" class="form-label">Confirmar Contraseña</label>
                        <input name="pass4" type="password" class="form-control" id="pass4" onkeyup='check2();' required>
                    </div><br>
                    
                    <button type="submit" id="registro2" class="btn btn-info btn-lg" >Registrar</button>
                </form>
            </div>
           
        </div>    
        </div>      
       <br>    
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

    <script>
        let est = document.getElementById("est");
        let mae = document.getElementById("mae");

        function verTipoE() {
            est.classList.remove("d-none");
            mae.classList.add("d-none");
        }

        function verTipoM(){
            mae.classList.remove("d-none");
            est.classList.add("d-none");
        }

        var check = function() {
            if (document.getElementById('pass1').value ==
                document.getElementById('pass2').value) {
                document.getElementById('ok').classList.remove("d-none");
                document.getElementById('error').classList.add("d-none");
                document.getElementById('registro1').removeAttribute('disabled');
            } else {
                document.getElementById('ok').classList.add("d-none");
                document.getElementById('error').classList.remove("d-none");
                document.getElementById('registro1').disabled = true;
            }
        }

        var check2 = function() {
            if (document.getElementById('pass3').value ==
                document.getElementById('pass4').value) {
                document.getElementById('ok2').classList.remove("d-none");
                document.getElementById('error2').classList.add("d-none");
                document.getElementById('registro2').removeAttribute('disabled');
            } else {
                document.getElementById('ok2').classList.add("d-none");
                document.getElementById('error2').classList.remove("d-none");
                document.getElementById('registro2').disabled = true;
            }
        }

</script> 

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

    </body>
</html>
