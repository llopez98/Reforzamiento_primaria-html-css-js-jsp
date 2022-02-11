/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Procesos;

import Entidades.Estudiante;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author lueun
 */
public class CambiarDatosEstudiante {
    Connection cn;
    
    public CambiarDatosEstudiante(){
        Conectar con = new Conectar();
        this.cn = con.getCon();
    }
    
    public int GuardarCambios(Estudiante es){
        int resultado = 0;
        try {
            Statement stmt = cn.createStatement();
            String query = "UPDATE Estudiante SET contraseña = '"+es.getContraseña()+"' WHERE correo_estudiante = '"+es.getCorreo()+"'";
            
            resultado = stmt.executeUpdate(query);
            
            return resultado;
        } catch(SQLException ex) {
            System.out.println("Error al registrar el driver de SQL Server: " + ex);
            Logger.getLogger(CambiarDatosEstudiante.class.getName()).log(Level.SEVERE, null, ex);
        }
        return resultado;
    }
}
