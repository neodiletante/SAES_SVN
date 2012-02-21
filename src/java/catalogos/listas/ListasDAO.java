/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package catalogos.listas;
//import com.sun.istack.internal.logging.Logger;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author daniel
 */
public class ListasDAO{
    private String nombre;
    private int id_grupo;
    private int no_lista;
    private String color;
    private String grupo_estadistico;
    private int no_exp;
    private String nombreGrupo;
    private boolean tieneRegistros;
    Connection con = null;

  //  private Logger log= Logger.getLogger(ListasDAO.class);
    /**
     * @return the nombre
     */
    
    public ListasDAO() {}
    
    public ListasDAO(Connection con){
      this.con = con;
    }
    
    public String getNombre() {
        return nombre;
    }

    /**
     * @param nombre the nombre to set
     */
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    /**
     * @return the id_grupo
     */
    public int getId_grupo() {
        return id_grupo;
    }

    /**
     * @param id_grupo the id_grupo to set
     */
    public void setId_grupo(int id_grupo) {
        this.id_grupo = id_grupo;
    }

    /**
     * @return the no_lista
     */
    public int getNo_lista() {
        return no_lista;
    }

    /**
     * @param no_lista the no_lista to set
     */
    public void setNo_lista(int no_lista) {
        this.no_lista = no_lista;
    }
    
    public List map(ResultSet rst){
        ArrayList  retVar = null;
        ListasDAO dao =null;
        try{
          if(rst.first()){  
              rst.beforeFirst();
              retVar= new ArrayList();
              while(rst.next()){
                dao= new ListasDAO();
                dao.setNo_lista(rst.getInt("no_lista"));
                dao.setNombre(rst.getString("nombre"));
                dao.setId_grupo(rst.getInt("id_grupo"));
                dao.setColor(rst.getString("color"));
                dao.setGrupo_estadistico(rst.getString("gpo_estadistico"));
                dao.setNombreGrupo("nombre_grupo");
                dao.setNo_exp(Integer.parseInt(rst.getString("no_expediente")));
                dao.setTieneRegistros(rst.getInt("registros")>0);
                //System.out.println(dao.getNombre() + " " + dao.getNo_lista());
                retVar.add(dao);
                dao=null;
              }  
          }
        }
        catch(Exception ex){
         //  log.log(Level.WARNING, "Error:", ex);
          ex.printStackTrace();
        }
        return retVar;
    }
        
        public ListasDAO mapRqt(HttpServletRequest request){
            ListasDAO dao=new ListasDAO();
            dao.setId_grupo(Integer.parseInt(request.getParameter("id_grupo")));
            dao.setNo_lista(Integer.parseInt(request.getParameter("no_lista")));
            dao.setNombre(request.getParameter("nombre"));
            dao.setColor(request.getParameter("color"));
            dao.setGrupo_estadistico(request.getParameter("grupo_estadistico"));
            dao.setNo_exp(Integer.parseInt(request.getParameter("no_expediente")));
            return dao;
        }

    /**
     * @return the color
     */
    public String getColor() {
        return color;
    }

    /**
     * @param color the color to set
     */
    public void setColor(String color) {
        this.color = color;
    }

    /**
     * @return the grupo_estadistico
     */
    public String getGrupo_estadistico() {
        return grupo_estadistico;
    }

    /**
     * @param grupo_estadistico the grupo_estadistico to set
     */
    public void setGrupo_estadistico(String grupo_estadistico) {
        this.grupo_estadistico = grupo_estadistico;
    }
    
    public List getDatos(int id_grupo){
    //    System.out.println("En el getDAts 1");
        List retVar = null;
        ResultSet rst = null;
        PreparedStatement pst = null;
        StringBuilder query=new StringBuilder("select * from saes.vw_listas where id_grupo=?");
        try{
      //    System.out.println("En el getDAts 2");  
          pst=con.prepareStatement(query.toString(), ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
        //  System.out.println("En el getDAts 3");  
          pst.setInt(1, id_grupo);
          //System.out.println("En el getDAts 4");  
          rst=pst.executeQuery();
          ///System.out.println("En el getDAts 5");
            retVar = this.map(rst);
           // System.out.println("En el getDAts 6");
        }
        catch(Exception ex){
        //    log.log(Level.WARNING, "Error:", ex);
          ex.printStackTrace();
        }
        return retVar;
    }

    /**
     * @return the no_exp
     */
    public int getNo_exp() {
        return no_exp;
    }

    /**
     * @param no_exp the no_exp to set
     */
    public void setNo_exp(int no_exp) {
        this.no_exp = no_exp;
    }

    /**
     * @return the nombreGrupo
     */
    public String getNombreGrupo() {
        return nombreGrupo;
    }

    /**
     * @param nombreGrupo the nombreGrupo to set
     */
    public void setNombreGrupo(String nombreGrupo) {
        this.nombreGrupo = nombreGrupo;
    }

    /**
     * @return the tieneRegistros
     */
    public boolean isTieneRegistros() {
        return tieneRegistros;
    }

    /**
     * @param tieneRegistros the tieneRegistros to set
     */
    public void setTieneRegistros(boolean tieneRegistros) {
        this.tieneRegistros = tieneRegistros;
    }
    
    public boolean getTieneRegistros(){return this.tieneRegistros;}

  @Override
  public boolean equals(Object obj) {
    if (obj == null) {
      return false;
    }
    if (getClass() != obj.getClass()) {
      return false;
    }
    final ListasDAO other = (ListasDAO) obj;
    if (this.no_lista != other.no_lista) {
      return false;
    }
    return true;
  }

  @Override
  public int hashCode() {
    int hash = this.no_lista;
    return hash;
  }
    
    
    
    }

