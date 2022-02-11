/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Procesos;

import Entidades.Estudiante;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author lueun
 */
public class ConsultarRanking {
    Connection cn;
    
     public ConsultarRanking(){
        Conectar con = new Conectar();
        this.cn = con.getCon();
    }
    
    public List<Estudiante> ConsultarRANK() {
        List<Estudiante> rank = new ArrayList<>();
        String CORREO="";
        try {
            Statement stmt = cn.createStatement();
            String query = "SELECT  correo_estudiante,sum(puntos_obtenidos)";
            query += "FROM Reforzamiento_primaria.dbo.Estudiante_Pregunta group by  correo_estudiante order by sum(puntos_obtenidos) desc";
       
         
            ResultSet rset = stmt.executeQuery(query);
            
            while(rset.next()){
                Estudiante datos = new Estudiante();
                datos.setCorreo(rset.getString("correo_estudiante"));
                rank.add(datos);
            }
            rset.close();
            stmt.close();
            cn.close();
            
            return rank;
        } catch (SQLException ex) {
            Logger.getLogger(ConsultarRanking.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rank;
    }
}
