/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

/**
 *
 * @author maria
 */
public class Grupo {
    private int idGrupo;
    private int grado;
    private String grupo;
    private String turno;
    private int corte;
    
    public Grupo(){
    }
    
    public Grupo(String grado, String grupo, String turno, String corte){
        this.grado = Integer.parseInt(grado);
        this.grupo = grupo;
        this.turno = turno;
        this.corte = Integer.parseInt(corte);
        System.out.println("GRupo creado");
    }
    
    
    public int getCorte() {
        return corte;
    }

    public void setCorte(int corte) {
        this.corte = corte;
    }

    public int getGrado() {
        return grado;
    }

    public void setGrado(int grado) {
        this.grado = grado;
    }

    public String getGrupo() {
        return grupo;
    }

    public void setGrupo(String grupo) {
        this.grupo = grupo;
    }

    public int getIdGrupo() {
        return idGrupo;
    }

    public void setIdGrupo(int idGrupo) {
        this.idGrupo = idGrupo;
    }

    public String getTurno() {
        return turno;
    }

    public void setTurno(String turno) {
        this.turno = turno;
    }

    public void setGrado(String grado) {
        this.grado = Integer.parseInt(grado); 
    }

    public void setCorte(String corte) {
        this.corte = Integer.parseInt(corte);
    }

}
