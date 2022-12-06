package excercise.repository;

import excercise.models.Document;
import sun.plugin.javascript.navig.Document;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DocumentRepository implements IDocumentRepository {
    BaseRepository baseRepository = new BaseRepository();
        private static final String SELECT_ALL_DOCUMENT = "select * from document;";
        private static final String INSERT_DOCUMENT_SQL = "insert into document values (?,?,?,?);";
        private static final String SELECT_DOCUMENT_BY_ID = "select * from document where document_id=?;";
        private static final String UPDATE_DOCUMENT_SQL = "update document set checkin_day=?, checkout_day=?, checkin_reason=? where document_id = ?;";
        private static final String DELETE_DOCUMENT_SQL = "delete from document where document_id = ?;";
        private static final String SEARCH_DOCUMENT_SQL = "select d.document_id, d.patient_id, p.patient_name, d.checkin_day, d.checkout_day, d.checkin_reason \n" +
                "from document d\n" +
                "join patient p on d.patient_id= p.patient_id where p.patient_name like ? and d.checkin_reason like ?;";
    @Override
    public List<Document> selectAllDocument() {
        List<Document> documentList = new ArrayList<>();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = baseRepository.getConnection().prepareStatement(SELECT_ALL_DOCUMENT);
            Document document;
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                document = new Document();
                document.setDocumentId(resultSet.getString("document_id"));
                document.setPatientId(resultSet.getString("patient_id"));
                document.setCheckinDay(resultSet.getString("checkin_day"));
                document.setCheckoutDay(resultSet.getString("checkout_day"));
                document.setCheckinReason(resultSet.getString("checkin_reason"));
                documentList.add(document);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                preparedStatement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return documentList;
    }

    @Override
    public void save(Document document) {
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = baseRepository.getConnection().prepareStatement(INSERT_DOCUMENT_SQL);
            preparedStatement.setInt(1, Integer.parseInt(document.getPatientId()));
            preparedStatement.setString(2, document.getCheckinDay());
            preparedStatement.setString(3, document.getCheckoutDay());
            preparedStatement.setString(4, document.getCheckinReason());
            preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            try {
                preparedStatement.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
    }

    @Override
    public Document select(String id) {
        Document document = null;
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = baseRepository.getConnection().prepareStatement(SELECT_DOCUMENT_BY_ID);
            preparedStatement.setString(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                document = new Document();
                document.setDocumentId(id);
                document.setPatientId(resultSet.getString(2));
                document.setCheckinDay(resultSet.getString(3));
                document.setCheckoutDay(resultSet.getString(4));
                document.setCheckinReason(resultSet.getString(5));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            try {
                preparedStatement.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        return document;
    }

    @Override
    public boolean update(Document document) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = baseRepository.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_DOCUMENT_SQL);) {
            preparedStatement.setString(1, document.getCheckinDay());
            preparedStatement.setString(2, document.getCheckoutDay());
            preparedStatement.setString(3, document.getCheckinReason());
            preparedStatement.setString(4, document.getDocumentId());
            rowUpdated = preparedStatement.executeUpdate() > 0;
        }
        return rowUpdated;
    }

    @Override
    public boolean delete(String id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = baseRepository.getConnection();
             PreparedStatement statement = connection.prepareStatement(DELETE_DOCUMENT_SQL);) {
            statement.setString(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    @Override
    public List<Document> search(String name) {
        PreparedStatement preparedStatement = null;
        List<Document> documentList = new ArrayList<>();
        try {
            preparedStatement = baseRepository.getConnection().prepareStatement(SEARCH_DOCUMENT_SQL);
            preparedStatement.setString(1, "%"+name+"%");
            ResultSet resultSet = preparedStatement.executeQuery();
            Document document;
            while (resultSet.next()){
                document = new Document();
                document.setDocumentId(resultSet.getString(1));
                document.setPatientId(resultSet.getString(2));
                document.setCheckinDay(resultSet.getString(3));
                document.setCheckoutDay(resultSet.getString(4));
                document.setCheckinReason(resultSet.getString(5));
                documentList.add(document);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return documentList;
    }
}
