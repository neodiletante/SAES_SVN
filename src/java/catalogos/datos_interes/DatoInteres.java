/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package catalogos.datos_interes;

/**
 *
 * @author ulises
 */
public class DatoInteres {
  private int idDato;
  private String descripcion;
  private int tipo;
  private String descTipo;

   

  public DatoInteres(){}
  
  public DatoInteres(String idDato, String descripcion, String tipo){
    this.idDato = Integer.parseInt(idDato);
    this.descripcion = descripcion;
    this.tipo = Integer.parseInt(tipo);
  }
  
  public DatoInteres(String descripcion, String tipo){
    this.idDato = 0;
    this.descripcion = descripcion;
    this.tipo = Integer.parseInt(tipo);
  }
  
  public String getDescripcion() {
    return descripcion;
  }

  public void setDescripcion(String descripcion) {
    this.descripcion = descripcion;
  }

  public int getIdDato() {
    return idDato;
  }

  public void setIdDato(int idDato) {
    this.idDato = idDato;
  }

  public int getTipo() {
    return tipo;
  }

  public void setTipo(int tipo) {
    this.tipo = tipo;
  }
  
   public String getDescTipo() {
        return descTipo;
    }

    public void setDescTipo(String descTipo) {
        this.descTipo = descTipo;
    }
  
}