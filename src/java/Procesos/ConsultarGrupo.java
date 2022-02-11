/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Procesos;

import Entidades.Estudiante;
import Entidades.Grupos;
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
public class ConsultarGrupo {
    Connection cn;
    
    public ConsultarGrupo(){
        Conectar con = new Conectar();
        this.cn = con.getCon();
    }
    
    public List<Grupos> TraerGrupos(String correo){
        List<Grupos> grupos = new ArrayList<>();
        try {
            Statement stmt = cn.createStatement();
            String query = "select * from Grupo where correo_maestro = '"+correo+"'";
            ResultSet rset = stmt.executeQuery(query);
            
            while(rset.next()){
                Grupos grupo = new Grupos();
                grupo.setCod_grupo(rset.getInt("cod_grupo"));
                grupo.setNivel(rset.getInt("nivel"));
                grupos.add(grupo);
            }
            rset.close();
            stmt.close();
            cn.close();
            return grupos;
        } catch(SQLException ex) {
            System.out.println("Error al registrar el driver de SQL Server: " + ex);
            Logger.getLogger(ConsultarGrupo.class.getName()).log(Level.SEVERE, null, ex);
        }
        return grupos;
    }
    
    public List<Grupos> TraerGruposDisponibles(){
        List<Grupos> grupos =  new ArrayList<>();
        try {
            Statement stmt = cn.createStatement();
            String query = "select * from Grupo";
            ResultSet rset = stmt.executeQuery(query);
            
            while(rset.next()){
                Grupos grupo = new Grupos();
                grupo.setCod_grupo(rset.getInt("cod_grupo"));
                grupo.setNivel(rset.getInt("nivel"));
                grupos.add(grupo);
            }
            rset.close();
            stmt.close();
            cn.close();
            return grupos;
        } catch(SQLException ex) {
            System.out.println("Error al registrar el driver de SQL Server: " + ex);
            Logger.getLogger(ConsultarGrupo.class.getName()).log(Level.SEVERE, null, ex);
        }
        return grupos;
    }
    
    public List<Estudiante> EstudiantesGrupos(int grupor){
        List<Estudiante> grupos =  new ArrayList<>();
        try {
            Statement stmt = cn.createStatement();
            String query = "select *  FROM [Reforzamiento_primaria].[dbo].[Estudiante] where cod_grupo='"+grupor+"';";
            ResultSet rset = stmt.executeQuery(query);
            
            while(rset.next()){
                Estudiante grupo = new Estudiante();
                
                grupo.setCorreo(rset.getString("correo_estudiante"));
                grupo.setCedula((rset.getString("cedula")));
                grupo.setNombre(rset.getString("nombre"));
                grupo.setApellido(rset.getString("apellido"));
                
                grupos.add(grupo);
            }
            rset.close();
            stmt.close();
            cn.close();
            return grupos;
        } catch(SQLException ex) {
            System.out.println("Error al registrar el driver de SQL Server: " + ex);
            Logger.getLogger(ConsultarGrupo.class.getName()).log(Level.SEVERE, null, ex);
        }
        return grupos;
    }
    
}
