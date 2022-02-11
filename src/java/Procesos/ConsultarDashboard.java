/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Procesos;

import Entidades.EstudianteDashboard;
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
public class ConsultarDashboard {
    Connection cn;
    
    public ConsultarDashboard(){
        Conectar con = new Conectar();
        this.cn = con.getCon();
    }
    
    public List<EstudianteDashboard> ConsultarEst(String correo) {
        List<EstudianteDashboard> est = new ArrayList<>();
        try {
            Statement stmt = cn.createStatement();
            String query = "select c.tema, b.pregunta, a.puntos_obtenidos ";
            query += "from Estudiante_Pregunta AS a INNER JOIN Pregunta AS b ON a.cod_pregunta = b.cod_pregunta ";
            query += "INNER JOIN Tema AS c ON b.cod_tema = c.cod_tema ";
            query += "where a.correo_estudiante = '"+correo+"';";
            ResultSet rset = stmt.executeQuery(query);
            
            while(rset.next()){
                EstudianteDashboard datos = new EstudianteDashboard();
                datos.setTema(rset.getString("tema"));
                datos.setPregunta(rset.getString("pregunta"));
                datos.setPuntos(rset.getInt("puntos_obtenidos"));
                est.add(datos);
            }
            rset.close();
            stmt.close();
            cn.close();
            
            return est;
        } catch (SQLException ex) {
            Logger.getLogger(ConsultarDashboard.class.getName()).log(Level.SEVERE, null, ex);
        }
        return est;
    }
}
