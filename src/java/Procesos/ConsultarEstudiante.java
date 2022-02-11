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
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author lueun
 */
public class ConsultarEstudiante {
    
    Connection cn;
    
    public ConsultarEstudiante(){
        Conectar con = new Conectar();
        this.cn = con.getCon();
    }
    
    public Estudiante ConsultarEst(String correo) {
        Estudiante est = new Estudiante();
        try {
            Statement stmt = cn.createStatement();
            String query = "SELECT * FROM Estudiante WHERE correo_estudiante = '"+correo+"'";
            ResultSet rset = stmt.executeQuery(query);
            
            while(rset.next()){
                est.setCorreo(rset.getString("correo_estudiante"));
                est.setCedula(rset.getString("cedula"));
                est.setNombre(rset.getString("nombre"));
                est.setApellido(rset.getString("apellido"));
                est.setContraseña(rset.getString("contraseña"));
                est.setCod_grupo(rset.getString("cod_grupo"));
            }
            rset.close();
            stmt.close();
            cn.close();
            
            return est;
        } catch (SQLException ex) {
            Logger.getLogger(ConsultarEstudiante.class.getName()).log(Level.SEVERE, null, ex);
        }
        return est;
    }
}
