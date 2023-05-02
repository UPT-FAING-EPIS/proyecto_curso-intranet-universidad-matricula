package model;

import jakarta.enterprise.context.ApplicationScoped;
import jakarta.enterprise.inject.Default;
import jakarta.transaction.Transactional;
import io.quarkus.hibernate.orm.panache.PanacheEntity;
import io.quarkus.hibernate.orm.panache.PanacheRepositoryBase;
import jakarta.persistence.Entity;



@Default
@ApplicationScoped
public class EstudianteRepositorio implements PanacheRepositoryBase<Estudiante, Integer> {
    
    public Estudiante encontrarPorId(int id_estudiante) {
        return findById(id_estudiante);
    }
    


public boolean verificarLogin(int id_estudiante, String contrasena) {
        Estudiante estudiante = encontrarPorId(id_estudiante);
        if (estudiante != null) {
            return estudiante.getContrasena().equals(contrasena);
        } else {
            return false;
        }
    }


}
