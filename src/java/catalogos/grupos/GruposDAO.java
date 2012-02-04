/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package catalogos.grupos;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import modelo.Grupo;

/**
 *
 * @author maria
 */
public class GruposDAO {
    private Connection con=null;
    private Statement stmt=null; 
    
    private ResultSet rs=null;
    private Grupo grupo = null;
    
    public GruposDAO(Connection con){
        this.con = con;
        
    }

        public List consultaGrupos() {
        List<Grupo> grupos = new ArrayList<Grupo>();
        try{
           
            stmt = con.createStatement();
            String query = "SELECT id_grupo, grado, grupo, turno, corte FROM tc_grupos";
            rs = stmt.executeQuery(query);
            
            while(rs.next()) {
                grupo = new Grupo();
                grupo.setIdGrupo(rs.getInt("id_grupo"));
                grupo.setGrado(rs.getInt("grado"));
                grupo.setGrupo(rs.getString("grupo"));
                grupo.setTurno(rs.getString("turno"));
                grupo.setCorte(rs.getInt("corte"));
                grupos.add(grupo);  
            }
            
   
        }catch (SQLException sqle) {
            System.out.println(sqle.getMessage());
            System.out.println("Error SQL");
        } catch (Exception exc) {
            System.out.println("Se ha producido una excepción try "+exc.getMessage());
        }
        
        return grupos;   
    }
        
        public void insertarGrupo(Grupo grupo){
            String qInsert = "INSERT INTO tc_grupos VALUES(0," 
              + grupo.getGrado() + ",'"
              + grupo.getGrupo() + "','"
              + grupo.getTurno() + "',"
              + grupo.getCorte() + ")";
            System.out.println("En el DAO");
            
          try {
            stmt = con.createStatement();
            stmt.execute(qInsert);
          } catch (SQLException ex) {
              Logger.getLogger(GruposDAO.class.getName()).log(Level.SEVERE, null, ex);
              System.out.println("Falló insert");
          }
        }
    
}