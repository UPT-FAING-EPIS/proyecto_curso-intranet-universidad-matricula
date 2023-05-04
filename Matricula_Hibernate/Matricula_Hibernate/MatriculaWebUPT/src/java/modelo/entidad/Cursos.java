package modelo.entidad;
// Generated 2 may. 2023 17:52:23 by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Cursos generated by hbm2java
 */
public class Cursos  implements java.io.Serializable {


     private Integer idCurso;
     private String nombre;
     private String codigo;
     private String descripcion;
     private Integer creditos;
     private Set<DetalleMatricula> detalleMatriculas = new HashSet<DetalleMatricula>(0);
     private Set<Secciones> seccioneses = new HashSet<Secciones>(0);

    public Cursos() {
    }

	
    public Cursos(String nombre, String codigo) {
        this.nombre = nombre;
        this.codigo = codigo;
    }
    public Cursos(String nombre, String codigo, String descripcion, Integer creditos, Set<DetalleMatricula> detalleMatriculas, Set<Secciones> seccioneses) {
       this.nombre = nombre;
       this.codigo = codigo;
       this.descripcion = descripcion;
       this.creditos = creditos;
       this.detalleMatriculas = detalleMatriculas;
       this.seccioneses = seccioneses;
    }
   
    public Integer getIdCurso() {
        return this.idCurso;
    }
    
    public void setIdCurso(Integer idCurso) {
        this.idCurso = idCurso;
    }
    public String getNombre() {
        return this.nombre;
    }
    
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    public String getCodigo() {
        return this.codigo;
    }
    
    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }
    public String getDescripcion() {
        return this.descripcion;
    }
    
    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
    public Integer getCreditos() {
        return this.creditos;
    }
    
    public void setCreditos(Integer creditos) {
        this.creditos = creditos;
    }
    public Set<DetalleMatricula> getDetalleMatriculas() {
        return this.detalleMatriculas;
    }
    
    public void setDetalleMatriculas(Set<DetalleMatricula> detalleMatriculas) {
        this.detalleMatriculas = detalleMatriculas;
    }
    public Set<Secciones> getSeccioneses() {
        return this.seccioneses;
    }
    
    public void setSeccioneses(Set<Secciones> seccioneses) {
        this.seccioneses = seccioneses;
    }




}

