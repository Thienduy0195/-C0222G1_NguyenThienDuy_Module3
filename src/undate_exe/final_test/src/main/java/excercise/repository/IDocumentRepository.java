package excercise.repository;

import excercise.models.Document;

import java.sql.SQLException;
import java.util.List;

public interface IDocumentRepository {
    List<Document> selectAllDocument();

    void save(Document document);

    Document select(String id);

    boolean update(Document document) throws SQLException;

    boolean delete(String id) throws SQLException;

    List<Document> search(String name);
}
