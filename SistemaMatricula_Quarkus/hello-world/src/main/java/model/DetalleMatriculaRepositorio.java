/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import io.quarkus.hibernate.orm.panache.Panache;
import io.quarkus.hibernate.orm.panache.PanacheQuery;
import io.quarkus.hibernate.orm.panache.PanacheRepositoryBase;
import model.DetalleMatricula;
import jakarta.persistence.EntityManager;

public class DetalleMatriculaRepositorio implements PanacheRepositoryBase<DetalleMatricula, Integer>  {
    
    public DetalleMatricula buscarPorId(int id) {
        return findById(id);
    }

    public void crear(DetalleMatricula detalleMatricula) {
        persist(detalleMatricula);
    }

    public void actualizar(DetalleMatricula detalleMatricula) {
        EntityManager em = getEntityManager();
        
    DetalleMatricula entidad = findById(detalleMatricula.getIdDetalle());
    if (entidad != null) {
        entidad.setMatricula(detalleMatricula.getMatricula());
        entidad.setCurso(detalleMatricula.getCurso());
        em.persist(entidad);
    } else {
        throw new RuntimeException("No se puede actualizar la entidad DetalleMatricula con id " + detalleMatricula.getIdDetalle() + " porque no existe en la base de datos.");
    }
}

    public void eliminar(DetalleMatricula detalleMatricula) {
        delete(detalleMatricula);
    }

    
    
    public void delete(DetalleMatricula detalleMatricula) {
        EntityManager em = getEntityManager();
        em.remove(detalleMatricula);
    }
    
}
