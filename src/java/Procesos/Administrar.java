/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Procesos;

import Entidades.Preguntas;
import Entidades.TemasJuego;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author lueun
 */
public class Administrar {
    private Connection cn;
    
    public Administrar(){
        Conectar conexion = new Conectar();
        this.cn = conexion.getCon();
    }
    
    public List<TemasJuego> ObtenerTemas(){
        List<TemasJuego> temas = new ArrayList<>();
        try{
            
            Statement stmt = this.cn.createStatement();
            String query = "SELECT * FROM Tema";
            
            ResultSet result = stmt.executeQuery(query);
            while(result.next()){
                TemasJuego tema = new TemasJuego();
                tema.setNombre(result.getString("tema"));
                tema.setContent(result.getString("contenido_text"));
                tema.setCod(result.getString("cod_tema"));
                String imageBase64 = new String(Base64.getEncoder().encode(result.getBytes("contenido_img")));
                tema.setImag(imageBase64);
                
                temas.add(tema);
            }
            return temas;
        }catch (SQLException ex) {
            Logger.getLogger(ConsultarMaestro.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public List<Preguntas> ObtenerPreguntas(){
        List<Preguntas> preguntas = new ArrayList<>();
        try{
            
            Statement stmt = this.cn.createStatement();
            String query = "SELECT * FROM Pregunta";
            
            ResultSet result = stmt.executeQuery(query);
            while(result.next()){
                Preguntas pregunta = new Preguntas();
                pregunta.setPregunta(result.getString("pregunta"));
                pregunta.setCod_preg(result.getInt("cod_pregunta"));
               
                preguntas.add(pregunta);
            }
            return preguntas;
        }catch (SQLException ex) {
            Logger.getLogger(ConsultarMaestro.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
