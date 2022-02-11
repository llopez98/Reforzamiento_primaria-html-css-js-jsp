<%-- 
    Document   : juego
    Created on : 12/04/2021, 05:28:41 PM
    Author     : lueun
--%>

<%@page import="java.util.*" session="true" %>
<%@page import="java.util.Base64"%>
<%@page import="java.util.List"%>
<%@page import="Entidades.Preguntas"%>
<%@page import="Entidades.TemasJuego"%>
<%@page import="Procesos.Jugar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Jugar</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        
        <!-- CSS -->
        <link href="../../css/styles.css" rel="stylesheet">
        <script
            src="https://kit.fontawesome.com/2f1b1cb395.js"
            crossorigin="anonymous"
        ></script>
    </head>
    <body>
        <%
            Jugar jugabilidad = new Jugar();
            TemasJuego tema = jugabilidad.ObtenerTemaCompleto("TCS10-3");
            List<Preguntas> pre = tema.getPreguntas();
        %>
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
            <div class="card">
                <div class="card-body">
                  <h5 class="card-title"><%=tema.getNombre() %></h5>
                  <p class="card-text">¡RESPONDE LAS PREGUNTAS A CONTINUACION PARA VER CUANDO APRENDISTE!</p>
                  <p class="card-text"><small class="text-muted">--TOCA EL BOTON PARA EMPEZAR--</small></p>
                </div>
                <img src="../../img/banner_preguntas.jpg" class="card-img-bottom" alt="...">
            </div>
            <!-- IMAGENES -->     
            <div class="accordion m-5 d-none" id="img_pregunta">
                <%
                    for(int i = 0; i < pre.size(); i++){
                        String imageBase64 = new String(Base64.getEncoder().encode(pre.get(i).getImage()));
                        %>
                        <div class="accordion-item">
                            <h2 class="accordion-header" id="panelsStayOpen-heading<%=i+1 %>">
                              <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapse<%=i+1 %>" aria-expanded="true" aria-controls="panelsStayOpen-collapse<%=i+1 %>">
                                IMAGEN - PREGUNTA # <%=i+1 %>
                              </button>
                            </h2>
                            <div id="panelsStayOpen-collapse<%=i+1 %>" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-heading<%=i+1 %>">
                              <div class="accordion-body">
                                <img src="data:image/png;base64,<%=imageBase64 %>" class="img-thumbnail w-25" alt="...">
                              </div>
                            </div>
                        </div>
                <%
                    }
                %>
                
             </div>
                

            <div class="d-grid gap-2 col-6 mx-auto mt-5">
                <button class="btn btn-primary" type="button" onclick="IniciarJuego()" id="btnIniciar">JUGAR</button>
            </div>

            <form action="guardarRespuestas.jsp">
                <input type="hidden" name="respuestas" id="respuestasEstudiante" required>
                <div class="d-grid gap-2 col-6 mx-auto mt-5">
                    <button class="btn btn-danger d-none" type="submit" id="btnFinalizar">FINALIZAR</button>
                </div>
            </form>
            

            <div id="accordion" class="pb-5 d-none">
                <div class="card">
                    <div class="card-header" id="headingOne">
                        <h5 class="mb-0">
                            <button class="btn btn-link" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                <span id="pregunta"></span>
                            </button>
                            
                        </h5>
                    </div>
    
                    <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordion">
                        <div class="card-body">
                            <div class="row" id="renderRespuestas">
    
                            </div>
                        </div>
                    </div>
                </div>
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
        
        <script>
            let tema = <%=tema.toJson() %>;
            let respuestasEstudiante = [];
        
            function IniciarJuego() {
                var btnIniciar = document.getElementById("btnIniciar");
                var acordion = document.getElementById("accordion");
                var img = document.getElementById("img_pregunta");
        
                btnIniciar.classList.add("d-none");
                acordion.classList.remove("d-none");
                img.classList.remove("d-none");
        
                MostrarPrimeraPregunta();
            }
        
            function MostrarPrimeraPregunta() {
                var pregunta = tema.preguntas[0];
        
                var lblPregunta = document.getElementById("pregunta");
                lblPregunta.textContent = pregunta.pregunta;
        
                var render = document.getElementById("renderRespuestas");
                
                
                var html = "";
        
                pregunta.respuestas.forEach(resp => {
                    var coded = resp.img;
                    html += '<div class="col-3">';
                    html += '<input class="form-check" type="radio" name="resp_' + resp.cod_preg + '" value="' + resp.id_opc + '" />';
                    html += '<label>' + resp.opc_resp + '</label>';
                    html += '<img src="data:image/png;base64,'+ coded +'" class="w-100" alt="...">';
                    html += '</div>';
                    
                });
        
                html += '<button onclick="ValidarRespuesta(' + pregunta.cod_preg + ')" class="btn btn-success w-100 mt-5 mb-1">Validar Respuesta</button>'
        
                render.innerHTML = html;
            }
            
            function bin2string(array){
                var result = "";
                for(var i = 0; i < array.length; ++i){
                    result+= (String.fromCharCode(array[i]));
                }
                return result;
            }
            
        
            function ValidarRespuesta(cod_preg) {
                var esUltimaPregunta = ValidarUltimaPregunta(cod_preg);
                var respSeleccionada = document.querySelector("input[name=resp_" + cod_preg + "]:checked");
                if (respSeleccionada != null) {
                    tema.preguntas.forEach(pregunta => {
                        if (pregunta.cod_preg == cod_preg) {
                            pregunta.respuestas.forEach(resp => {
                                if (resp.id_opc == respSeleccionada.value) {
                                    respuestasEstudiante.push({
                                        cod_preg : cod_preg,
                                        opcion : respSeleccionada.value
                                    });
                                    if (resp.resp == 'C') {
                                        alert("CORRECTO");
                                    } else {
                                        alert(resp.retroali);
                                    }
                                }
                            });
                        }
                    });
                    if(!esUltimaPregunta){
                        MostrarSiguientePregunta(cod_preg);
                    }else{
                        alert('Ya termino su Cuestionario');
                        var btn =  document.getElementById("btnFinalizar");
                        btn.classList.remove('d-none');

                        var acordion = document.getElementById("accordion");
                        acordion.classList.add('d-none');

                        var cuadro =  document.getElementById('respuestasEstudiante');
                        cuadro.value = JSON.stringify(respuestasEstudiante);
                    }
                }else{
                    alert("Debe seleccionar una respuesta");
                }
            }
           
        
            function MostrarSiguientePregunta(cod_preg) {
                var pregActual = tema.preguntas.indexOf(tema.preguntas.filter(cp => {
                    return cp.cod_preg == cod_preg
                })[0]);
        
                var indiceSigPreg = pregActual + 1;
                if (indiceSigPreg <= tema.preguntas.length - 1) {
                    MostrarPregunta(indiceSigPreg);
                } else {
                    MostrarPregunta(pregActual);
                }
            }
        
            function MostrarPregunta(indice) {
                var pregunta = tema.preguntas[indice];
        
                var lblPregunta = document.getElementById("pregunta");
                lblPregunta.textContent = pregunta.pregunta;
        
                var render = document.getElementById("renderRespuestas");
        
                var html = "";
        
                pregunta.respuestas.forEach(resp => {
                    var coded = resp.img;
                    html += '<div class="col-3">';
                    html += '<input class="form-check" type="radio" name="resp_' + resp.cod_preg + '" value="' + resp.id_opc + '" />';
                    html += '<label>' + resp.opc_resp + '</label>';
                    html += '<img src="data:image/png;base64,'+ coded +'" class="w-100" alt="...">';
                    html += '</div>';
                });
        
                html += '<button onclick="ValidarRespuesta(' + pregunta.cod_preg + ')" class="btn btn-success w-100 mt-5 mb-1">Validar Respuesta</button>'
        
                render.innerHTML = html;
            }
            
            function ValidarUltimaPregunta(cod_preg){
                var valid = false;
                var indicePregActual = tema.preguntas.indexOf(tema.preguntas.filter(cp => {
                    return cp.cod_preg == cod_preg
                })[0]);
                
                if(indicePregActual == tema.preguntas.length - 1){
                    valid = true;
                }
                return valid;
            }
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    </body>
</html>
