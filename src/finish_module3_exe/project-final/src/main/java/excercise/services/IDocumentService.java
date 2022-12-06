package excercise.services;

import excercise.models.DocumentPatient;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface IDocumentService {
    List<DocumentPatient> selectAllDocument();

    Map<String, String> save(DocumentPatient document);

    DocumentPatient select(String id);

    Map<String, String> update(DocumentPatient document) throws SQLException;

    boolean delete(String id) throws SQLException;

    List<DocumentPatient> search(String name);
}
