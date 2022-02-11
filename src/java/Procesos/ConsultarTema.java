/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Procesos;

import Entidades.Tema;
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
public class ConsultarTema {
    Connection connection;
    
    public ConsultarTema() {
        Conectar conectar = new Conectar();
        this.connection = conectar.getCon();
    }
    
    public List<Tema> getTemas(String searchQuery) {
        if (searchQuery == null) return new ArrayList<>();
        
        String simplifiedSearch = searchQuery.trim();
        String query = "SELECT * FROM Tema"
                    + " WHERE tema COLLATE Latin1_General_CI_AI LIKE '%" + simplifiedSearch + "%' COLLATE Latin1_General_CI_AI "
                    + "OR contenido_text COLLATE Latin1_General_CI_AI LIKE '%" + simplifiedSearch + "%' COLLATE Latin1_General_CI_AI";
        return populate(query);
    }
    
    public List<Tema> getTemas() {
        return populate("SELECT * FROM Tema");
    }
    
    private List<Tema> populate(String query) {
        try {
            List<Tema> temas = new ArrayList<>();
            Statement stmt = connection.createStatement();            
            ResultSet rset = stmt.executeQuery(query);
            
            while(rset.next()){
                Tema tema = new Tema();
                tema.setCod(rset.getString("cod_tema"));
                tema.setNombre(rset.getString("tema"));
                tema.setContent(rset.getString("contenido_text"));
                String imageBase64 = new String(Base64.getEncoder().encode(rset.getBytes("contenido_img")));
                tema.setImage(imageBase64);
                temas.add(tema);
            }
            rset.close();
            stmt.close();
            connection.close();
            return temas;
        } catch (SQLException e) {
            System.out.println("Error al registrar el driver de SQL Server: " + e);
            Logger.getLogger(ConsultarTema.class.getName()).log(Level.SEVERE, null, e);
        }
        return new ArrayList<>();
    }
}
