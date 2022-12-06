package excercise.services;

import excercise.models.Document;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface IDocumentService {
    List<Document> selectAllDocument();

    Map<String, String> save(Document document);

    Document select(String id);

    Map<String, String> update(Document document) throws SQLException;

    boolean delete(String id) throws SQLException;

    List<Document> search(String name);
}
