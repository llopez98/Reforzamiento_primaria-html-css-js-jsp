/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Procesos;

import Entidades.Estudiante;
import Entidades.Maestros;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author lueun
 */
public class Registrar {
    Connection cn;
    
    public Registrar(){
        Conectar con = new Conectar();
        this.cn = con.getCon();
    }


 public int RegistrarEstudiante(Estudiante es)
    {
        int resultado = 0;
        try
        {
           Statement stmt = cn.createStatement();
           String query ="INSERT INTO Estudiante ";
           query += "VALUES('"+es.getCorreo() +"','"+ es.getCedula()+"','"+ es.getNombre()+"','"+ es.getApellido()+"','"+ es.getContraseña()+"', "+ es.getCod_grupo()+")";
           
           resultado = stmt.executeUpdate(query);
           
           stmt.close();
           cn.close();
           
           return resultado;
        }
        catch (SQLException ex)
        {
            System.out.println("Error al registrar: " + ex);
                Logger.getLogger(Registrar.class.getName()).log(Level.SEVERE, null, ex);  
        }
        return resultado;
    }
 
 public int RegistrarMaestros(Maestros ma)
    {
        int resultado = 0;
        try
        {
           Statement stmt = cn.createStatement();
           String query ="INSERT INTO Maestro ";
           query += "VALUES('"+ma.getCorreo() +"','"+ ma.getCedula()+"','"+ ma.getNombre()+"','"+ma.getApellido()+"','"+ma.getContraseña()+"','"+ma.getEstud_didact()+"')";
           
           resultado = stmt.executeUpdate(query);
           
           stmt.close();
            cn.close();
           
           return resultado;
           
        }
        catch (SQLException ex)
        {
            System.out.println("Error al registrar driver de MySQL: " + ex);
                Logger.getLogger(Registrar.class.getName()).log(Level.SEVERE, null, ex);  
        }
        return resultado;
    }
}
