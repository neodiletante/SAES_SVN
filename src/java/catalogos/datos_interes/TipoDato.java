/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package catalogos.datos_interes;

/**
 *
 * @author ulises
 */
public class TipoDato {
  private int tipo;
  private String descripcion;
  
  public TipoDato(){}
  
  public TipoDato(String descripcion){
    this.tipo = 0;
    this.descripcion = descripcion;
  }

  public String getDescripcion() {
    return descripcion;
  }

  public void setDescripcion(String descripcion) {
    this.descripcion = descripcion;
  }

  public int getTipo() {
    return tipo;
  }

  public void setTipo(int tipo) {
    this.tipo = tipo;
  }
  
}