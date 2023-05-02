package model;

import jakarta.inject.Inject;
import jakarta.ws.rs.*;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;

import io.quarkus.security.identity.SecurityIdentity;
import io.swagger.v3.oas.annotations.Parameter;

import model.Credenciales;
import model.Estudiante;
import model.EstudianteRepositorio;

@Path("/login")

public class Controlador {
    
    @Inject
    EstudianteRepositorio estudianteRepositorio;
    
    
    @POST
    @Produces(MediaType.APPLICATION_JSON)
    @Consumes(MediaType.APPLICATION_JSON)
    
    @Parameter
    public Response login(LoginRequest request) {
        Estudiante estudiante = estudianteRepositorio.encontrarPorId(request.getId_estudiante());
        if (estudiante != null && estudiante.getContrasena().equals(request.getContrasena())) {
            return Response.ok().build();
        } else {
            return Response.status(Response.Status.UNAUTHORIZED).build();
        }
    }

    public static class LoginRequest {
        private int id_estudiante;
        private String contrasena;

        public int getId_estudiante() {
            return id_estudiante;
        }

        public void setId_estudiante(int id_estudiante) {
            this.id_estudiante = id_estudiante;
        }

        public String getContrasena() {
            return contrasena;
        }

        public void setContrasena(String contrasena) {
            this.contrasena = contrasena;
        }
    }
}
