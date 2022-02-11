<%@page import="java.util.*" session="true" %>
<%@page import="Procesos.InsertarRespEst"%>
<%@page import="Entidades.EstudiantePregunta"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
<%
    String respuestas = request.getParameter("respuestas");
    respuestas = respuestas.replace ("[", "");
    respuestas = respuestas.replace ("]", "");

    
    respuestas = respuestas.replace ("{", "");
    respuestas = respuestas.replace ("}", "");
    

    
    respuestas = respuestas.replaceAll ("\"cod_preg\":", "");
    respuestas = respuestas.replaceAll ("\"opcion\":", "");
    

    
    respuestas = respuestas.replace ("\"", "");

    
    String [] splitResp = respuestas.split(",");
    
    HttpSession sesion=request.getSession();
    String correo = (String)sesion.getAttribute("correo");
    
    
    List<EstudiantePregunta> lstRespEstudiante = new ArrayList<>();
    
    for(int i = 0; i < splitResp.length; i=i+2){
        
        EstudiantePregunta estP = new EstudiantePregunta();
        
        estP.setCorreo(correo);
        
        estP.setCod_pregunta(Integer.parseInt(splitResp[i]));
        
        estP.setOpcion(splitResp[i+1].charAt(0));

        lstRespEstudiante.add(estP);
    }
    int result = 0;
    
    InsertarRespEst ins = new InsertarRespEst();
    result = ins.InsertarResp(lstRespEstudiante);

    if(result == 1){
        %>
        <script>
            alert('RESPUESTAS GUARDADAS CORRECTAMENTE');
            window.location.href = "../../index_loged.jsp";
        </script>
        <%
    }
    else{
        %>
        <script>
            alert('ERROR AL CARGAR LAS RESPUESTAS');
            window.location.href = "../../index_loged.jsp";
        </script>
        <%
    }
%>
</body>
</html>
