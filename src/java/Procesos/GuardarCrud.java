/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Procesos;

import Entidades.Tema;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author lueun
 */
public class GuardarCrud {
    Connection cn;
    
    public GuardarCrud(){
        Conectar con = new Conectar();
        this.cn = con.getCon();
    }
    
    public int GuardarTema(Tema tema){
        int resultado = 0;
        try{
            String query = "INSERT INTO Tema (cod_tema, tema, contenido_img, contenido_text) VALUES(?,?,?,?)";
            PreparedStatement stmt = cn.prepareStatement(query);
            
            stmt.setString(1, tema.getCod());
            stmt.setString(2, tema.getNombre());
            stmt.setBinaryStream(3, (InputStream)tema.getImage_in(), (int)tema.getSize());
            stmt.setString(4, tema.getContent());
            
            resultado = stmt.executeUpdate();

            
            return resultado;
        }
        catch(SQLException ex) {
            System.out.println("Error al registrar el driver de SQL Server: " + ex);
            Logger.getLogger(GuardarCrud.class.getName()).log(Level.SEVERE, null, ex);
        }
        return resultado;
    }
}
