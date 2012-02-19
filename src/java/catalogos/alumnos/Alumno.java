/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package catalogos.alumnos;

/**
 *
 * @author ulises
 */
public class Alumno {
    private int noExpediente;
    private String nombre;
    private String sexo;
    
    public Alumno(){}
    
    public Alumno(int noExpediente, String nombre, String sexo){
        this.setNoExpediente(noExpediente);
        this.setNombre(nombre);
        this.setSexo(sexo);
    }
    
    public Alumno(String noExpediente, String nombre, String sexo){
        this.setNoExpediente(Integer.parseInt(noExpediente));
        this.setNombre(nombre);
        this.setSexo(sexo);
    }
    
    public int getNoExpediente() {
        return noExpediente;
    }

    public void setNoExpediente(int noExpediente) {
        this.noExpediente = noExpediente;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }
   
}