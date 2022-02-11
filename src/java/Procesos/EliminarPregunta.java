/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Procesos;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author lueun
 */
public class EliminarPregunta {
    private Connection cn;
    
    public EliminarPregunta(){
        Conectar conexion = new Conectar();
        this.cn = conexion.getCon();
    }
    
    public int guardarTema(String cod_pregunta){
        int resultado = 0;
        try {
            Statement stmt = cn.createStatement();
            

                String query = "DELETE FROM Pregunta WHERE cod_pregunta = '"+cod_pregunta+"'";
          
                resultado = stmt.executeUpdate(query);

            
            
            return resultado;
        } catch(SQLException ex) {
            System.out.println("Error al registrar el driver de SQL Server: " + ex);
            Logger.getLogger(EliminarPregunta.class.getName()).log(Level.SEVERE, null, ex);
        }
        return resultado;
    }
}
