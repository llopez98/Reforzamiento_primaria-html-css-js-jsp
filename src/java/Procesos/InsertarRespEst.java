/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Procesos;

import Entidades.EstudiantePregunta;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author lueun
 */
public class InsertarRespEst {
    private Connection cn;
    
    public InsertarRespEst(){
        Conectar conexion = new Conectar();
        this.cn = conexion.getCon();
    }
    
    public int InsertarResp(List<EstudiantePregunta> est){
        int resultado = 0;
        try {
            Statement stmt = cn.createStatement();
            
            for (int i=0;i<est.size();i++) {
                String query = "EXECUTE pa_Validar_Respuesta '"+est.get(i).getCorreo()+"', "+est.get(i).getCod_pregunta()+", '"+est.get(i).getOpcion()+"'";
            
                resultado = stmt.executeUpdate(query);
            }
            
            
            return resultado;
        } catch(SQLException ex) {
            System.out.println("Error al registrar el driver de SQL Server: " + ex);
            Logger.getLogger(InsertarRespEst.class.getName()).log(Level.SEVERE, null, ex);
        }
        return resultado;
    }
}
