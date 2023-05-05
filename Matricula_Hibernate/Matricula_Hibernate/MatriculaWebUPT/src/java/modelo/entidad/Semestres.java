package modelo.entidad;
// Generated 2 may. 2023 17:52:23 by Hibernate Tools 4.3.1


import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Semestres generated by hbm2java
 */
public class Semestres  implements java.io.Serializable {


     private Integer idSemestre;
     private String nombre;
     private Date fechaInicio;
     private Date fechaFin;
     private Set<Secciones> seccioneses = new HashSet<Secciones>(0);
     private Set<Matriculas> matriculases = new HashSet<Matriculas>(0);

    public Semestres() {
    }

    public Semestres(String nombre, Date fechaInicio, Date fechaFin, Set<Secciones> seccioneses, Set<Matriculas> matriculases) {
       this.nombre = nombre;
       this.fechaInicio = fechaInicio;
       this.fechaFin = fechaFin;
       this.seccioneses = seccioneses;
       this.matriculases = matriculases;
    }
   
    public Integer getIdSemestre() {
        return this.idSemestre;
    }
    
    public void setIdSemestre(Integer idSemestre) {
        this.idSemestre = idSemestre;
    }
    public String getNombre() {
        return this.nombre;
    }
    
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    public Date getFechaInicio() {
        return this.fechaInicio;
    }
    
    public void setFechaInicio(Date fechaInicio) {
        this.fechaInicio = fechaInicio;
    }
    public Date getFechaFin() {
        return this.fechaFin;
    }
    
    public void setFechaFin(Date fechaFin) {
        this.fechaFin = fechaFin;
    }
    public Set<Secciones> getSeccioneses() {
        return this.seccioneses;
    }
    
    public void setSeccioneses(Set<Secciones> seccioneses) {
        this.seccioneses = seccioneses;
    }
    public Set<Matriculas> getMatriculases() {
        return this.matriculases;
    }
    
    public void setMatriculases(Set<Matriculas> matriculases) {
        this.matriculases = matriculases;
    }




}


