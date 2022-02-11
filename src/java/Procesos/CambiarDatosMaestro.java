
package Procesos;

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
public class CambiarDatosMaestro {
    Connection cn;
    
    public CambiarDatosMaestro(){
        Conectar con = new Conectar();
        this.cn = con.getCon();
    }
    
    public int GuardarCambios(Maestros ma){
        int resultado = 0;
        try {
            Statement stmt = cn.createStatement();
            String query = "UPDATE Maestro SET contraseña = '"+ma.getContraseña()+"', estud_didact = '"+ ma.getEstud_didact() +"' WHERE correo_maestro = '"+ma.getCorreo()+"'";
            
            resultado = stmt.executeUpdate(query);
            
            return resultado;
        } catch(SQLException ex) {
            System.out.println("Error al registrar el driver de SQL Server: " + ex);
            Logger.getLogger(CambiarDatosMaestro.class.getName()).log(Level.SEVERE, null, ex);
        }
        return resultado;
    }
}
