/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Procesos;

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
public class VerificarUsuario {
    Connection cn;
    
    public VerificarUsuario(){
    Conectar con = new Conectar();
    this.cn = con.getCon();
    }
    
    
   public String VerificarUsuarioE(String correo){
       String contra = "";
        try{
            Statement stmt = cn.createStatement();
            String query = "SELECT contraseña FROM Estudiante WHERE correo_estudiante = '"+correo+"'";
            ResultSet rset = stmt.executeQuery(query);
            while(rset.next()){
                contra = rset.getString("contraseña");
            }

            rset.close();
            stmt.close();
            cn.close();
            return contra;
         } catch (SQLException ex) {
            Logger.getLogger(VerificarUsuario.class.getName()).log(Level.SEVERE, null, ex);
        }
        return contra;

   }
   
   public String VerificarUsuarioM(String correo){

       	String contra="";
        try{
            Statement stmt = cn.createStatement();
            String query = "SELECT contraseña FROM Maestro WHERE correo_maestro = '"+correo+"'";
            ResultSet rset = stmt.executeQuery(query);
			
            while(rset.next()){
                contra = rset.getString("contraseña");
            }

            rset.close();
            stmt.close();
            cn.close();
            return contra;
         } catch (SQLException ex) {
            Logger.getLogger(VerificarUsuario.class.getName()).log(Level.SEVERE, null, ex);
        }
        return contra;
   }
}
