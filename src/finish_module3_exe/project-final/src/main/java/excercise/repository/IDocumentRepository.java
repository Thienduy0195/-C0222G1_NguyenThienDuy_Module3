package excercise.repository;

import excercise.models.DocumentPatient;
import excercise.models.Patient;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface IDocumentRepository {
    List<DocumentPatient> selectAllDocument();

    void save(DocumentPatient documentPatient);

    DocumentPatient select(String id);

    boolean update(DocumentPatient documentPatient) throws SQLException;

    boolean delete(String id) throws SQLException;

    List<DocumentPatient> search(String name);

}
