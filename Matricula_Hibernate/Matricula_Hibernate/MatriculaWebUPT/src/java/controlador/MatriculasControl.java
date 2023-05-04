package controlador;

import jakarta.annotation.ManagedBean;
import jakarta.faces.bean.ViewScoped;
import java.util.List;
import modelo.dao.MatriculasDao;
import modelo.entidad.Matriculas;


/**
 *
 * @author elcon
 */
@ManagedBean
@ViewScoped
public class MatriculasControl {

    /**
     * Creates a new instance of MatriculasControl
     */
    private List<Matriculas> listaMatriculas;
    private Matriculas banco;

    public MatriculasControl() {
        banco = new Matriculas();
    }

    public List<Matriculas> getListaMatriculas() {
        MatriculasDao ad = new MatriculasDao();
        listaMatriculas = ad.listarMatriculas();
        return listaMatriculas;
    }

    public void setListaMatriculas(List<Matriculas> listaMatriculas) {
        this.listaMatriculas = listaMatriculas;
    }

    public Matriculas getMatriculas() {
        return banco;
    }

    public void setMatriculas(Matriculas banco) {
        this.banco = banco;
    }

    public void limpiarMatriculas() {
        banco = new Matriculas();
    }

    public void agregarMatriculas() {
        MatriculasDao ad = new MatriculasDao();
        ad.agregar(banco);
    }

    public void modificarMatriculas() {
        MatriculasDao ad = new MatriculasDao();
        ad.modificar(banco);
        limpiarMatriculas();
    }

    public void eliminarMatriculas() {
        MatriculasDao ad = new MatriculasDao();
        ad.eliminar(banco);
        limpiarMatriculas();
    }
}
