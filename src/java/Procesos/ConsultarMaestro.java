/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Procesos;

import Entidades.Maestros;
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
public class ConsultarMaestro {
    Connection cn;
    
    public ConsultarMaestro(){
        Conectar con = new Conectar();
        this.cn = con.getCon();
    }
    
    public Maestros ConsultarMae(String correo) {
        Maestros mae = new Maestros();
        try {
            Statement stmt = cn.createStatement();
            String query = "SELECT * FROM Maestro WHERE correo_maestro = '"+correo+"'";
            ResultSet rset = stmt.executeQuery(query);
            
            while(rset.next()){
                mae.setCorreo(rset.getString("correo_maestro"));
                mae.setCedula(rset.getString("cedula"));
                mae.setNombre(rset.getString("nombre"));
                mae.setApellido(rset.getString("apellido"));
                mae.setContraseña(rset.getString("contraseña"));
                mae.setEstud_didact(rset.getString("estud_didact"));
            }
            rset.close();
            stmt.close();
            cn.close();
            
            return mae;
        } catch (SQLException ex) {
            Logger.getLogger(ConsultarMaestro.class.getName()).log(Level.SEVERE, null, ex);
        }
        return mae;
    }
}
