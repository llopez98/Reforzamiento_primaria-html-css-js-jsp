/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Procesos;

import Entidades.Grupos;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author lueun
 */
public class InsertarGrupo {
    private Connection cn;
    
    public InsertarGrupo(){
        Conectar conexion = new Conectar();
        this.cn = conexion.getCon();
    }
    
    public int Insertar(Grupos grupo){
        int resultado = 0;
        try {
            Statement stmt = cn.createStatement();
            

            String query = "INSERT INTO Grupo VALUES("+grupo.getNivel()+",'"+grupo.getCorreo_maestro()+"')";

            resultado = stmt.executeUpdate(query);

            
            return resultado;
        } catch(SQLException ex) {
            System.out.println("Error al registrar el driver de SQL Server: " + ex);
            Logger.getLogger(InsertarGrupo.class.getName()).log(Level.SEVERE, null, ex);
        }
        return resultado;
    }
}
