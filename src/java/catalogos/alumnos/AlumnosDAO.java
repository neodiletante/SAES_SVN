/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package catalogos.alumnos;


import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ulises
 */
public class AlumnosDAO {
     private Connection con=null;
    private Statement stmt=null;
    private ResultSet rs=null;
    private Alumno alumno;
    
    AlumnosDAO(Connection con){
        this.con = con;
    }
    
    public List consultaAlumnos(){
        List<Alumno> alumnos = new ArrayList<Alumno>();
        String query = "SELECT no_expediente, Nombre, sexo FROM tc_alumno";
        try{
           
            stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
            rs = stmt.executeQuery(query);
              while(rs.next()) {
                int noExpediente = rs.getInt("no_expediente");
                String nombre = rs.getString("Nombre");
                String sexo = rs.getString("sexo");
                alumno = new Alumno(noExpediente, nombre, sexo);
                alumnos.add(alumno);
                
              }
              
        }catch(SQLException sqle){
            System.out.println("Error SQL en Alumno");
            sqle.printStackTrace();
        }
        return alumnos;
    }
    
    public Alumno buscarAlumno(int noExpediente){
      alumno = null;
      PreparedStatement psBuscar = null;
      String query = "SELECT * FROM tc_alumno WHERE noExpediente = ?";
    try {
      psBuscar = con.prepareStatement(query);
      psBuscar.setInt(1, noExpediente);
      rs = psBuscar.executeQuery();
       while(rs.next()) {
                //int noExpediente = rs.getInt("no_expediente");
                String nombre = rs.getString("Nombre");
                String sexo = rs.getString("sexo");
                alumno = new Alumno(noExpediente, nombre, sexo);               
              }
    } catch (SQLException ex) {
      Logger.getLogger(AlumnosDAO.class.getName()).log(Level.SEVERE, null, ex);
    }
      return alumno;
    }
    
    public int buscaAlumno(int noExpediente){
      //alumno = null;
      int cuenta = -1;
      PreparedStatement psBuscar = null;
      String query = "SELECT COUNT(*) AS cuenta FROM tc_alumno where no_expediente = ?";
    try {
      psBuscar = con.prepareStatement(query);
      psBuscar.setInt(1, noExpediente);
      rs = psBuscar.executeQuery();
       while(rs.next()) {
         cuenta = rs.getInt("cuenta");
                
       }
    } catch (SQLException ex) {
      Logger.getLogger(AlumnosDAO.class.getName()).log(Level.SEVERE, null, ex);
    }finally{
      return cuenta;
    }

    }
    
    public void borrarAlumno(int noExpediente){
        PreparedStatement psBorrar = null;
         String qBorrar = "DELETE FROM tc_alumno WHERE no_expediente = ?";
        try {
          psBorrar = con.prepareStatement(qBorrar);
          psBorrar.setInt(1,noExpediente);
          psBorrar.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AlumnosDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public int insertarAlumno(Alumno alumno){
      int status = -1;  
      int cuenta = buscaAlumno(alumno.getNoExpediente());
      if (cuenta>0){
        return 0;
      }
      System.out.println("En el método de insertar Alumno");
      PreparedStatement psInsertar = null;
      String qInsertar = "INSERT INTO tc_alumno VALUES(?,?,?)";        
      try {
        psInsertar = con.prepareStatement(qInsertar);
        psInsertar.setInt(1, alumno.getNoExpediente());
        psInsertar.setString(2, alumno.getNombre());
        psInsertar.setString(3, alumno.getSexo());
        psInsertar.executeUpdate();
        status=1;

      } catch (SQLException ex) {
          Logger.getLogger(AlumnosDAO.class.getName()).log(Level.SEVERE, null, ex);
      }finally{
        return status;
      }
    }
    
    public int modificarAlumno(int noExpedienteAnt, Alumno alumno){
      int cuenta = buscaAlumno(alumno.getNoExpediente());
      if(cuenta > 0 && noExpedienteAnt != alumno.getNoExpediente()){
        return 0;
      }
      int status = -1;
      PreparedStatement psModificar = null;
      String qModificar = 
        "UPDATE tc_alumno SET no_expediente = ?, Nombre = ?, sexo = ? WHERE no_expediente = ?";
      try {
        psModificar = con.prepareStatement(qModificar);
        psModificar.setInt(1, alumno.getNoExpediente());
        psModificar.setString(2, alumno.getNombre());
        psModificar.setString(3, alumno.getSexo());
        psModificar.setInt(4, noExpedienteAnt);
        psModificar.executeUpdate();
        status=1;
      } catch (SQLException ex) {
        Logger.getLogger(AlumnosDAO.class.getName()).log(Level.SEVERE, null, ex);
      }finally{
        return status;
      }
    }
}