/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Procesos;

import Entidades.Preguntas;
import Entidades.Respuestas;
import Entidades.TemasJuego;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

/**
 *
 * @author lueun
 */
public class Jugar {
    private Connection cn;
    
    public Jugar(){
        Conectar conexion = new Conectar();
        this.cn = conexion.getCon();
    }
    
    public TemasJuego ObtenerTemaCompleto(String codigo){
        try{
            TemasJuego tema = new TemasJuego();
            
            Statement stmt = this.cn.createStatement();
            String query = "SELECT * FROM Tema WHERE cod_tema='"+codigo+"'";
            
            ResultSet result = stmt.executeQuery(query);
            while(result.next()){
                tema.setNombre(result.getString("tema"));
                tema.setPreguntas(this.ObtenerPreguntasByTema(codigo));
            }
            return tema;
        }catch(Exception e){
            int x = 1;
        }
        return null;
    }
    
    private List<Preguntas> ObtenerPreguntasByTema(String codigo_tema){
        List<Preguntas> preguntas = new ArrayList<>();
        try{           
            Statement stmt = this.cn.createStatement();
            String query = "SELECT * FROM Pregunta WHERE cod_tema = '"+codigo_tema+"'";
            
            ResultSet result = stmt.executeQuery(query);
            while(result.next()){
                Preguntas pregunta = new Preguntas();
                pregunta.setCod_preg(result.getInt("cod_pregunta"));
                pregunta.setPregunta(result.getString("pregunta"));
                pregunta.setCod_tema(result.getString("cod_tema"));
                pregunta.setImage(result.getBytes("imagenes"));
                
                pregunta.setRespuestas(this.ObtenerRespuestasByPregunta(pregunta.getCod_preg()));
                
                preguntas.add(pregunta);
            }
            return preguntas;
        }catch(Exception e){
           int x = 1; 
        }
        return preguntas;
    }
    
    private List<Respuestas> ObtenerRespuestasByPregunta(int cod_preg){
        List<Respuestas> respuestas = new ArrayList<>();
        try{           
            Statement stmt = this.cn.createStatement();
            String query = "SELECT * FROM Respuesta WHERE cod_pregunta="+cod_preg;
            
            ResultSet result = stmt.executeQuery(query);
            while(result.next()){
                Respuestas respuesta = new Respuestas();
                respuesta.setCod_preg(result.getInt("cod_pregunta"));
                respuesta.setId_opc(result.getString("ident_opcion").charAt(0));
                respuesta.setOpc_resp(result.getString("opcion_Respuesta"));
                respuesta.setResp(result.getString("respuesta").charAt(0));
                respuesta.setRetroali(result.getString("retroalimentacion"));
                String imageBase64 = new String(Base64.getEncoder().encode(result.getBytes("imagenes")));
                respuesta.setImg(imageBase64);
                
                respuestas.add(respuesta);
            }
            return respuestas;
        }catch(Exception e){
            int x = 1;
        }
        return respuestas;
    }
}
