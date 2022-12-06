package excercise.repository;

import excercise.models.Patient;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BaseRepository {
    private String jdbcURL = "jdbc:mysql://localhost:3306/patient_document?useSSL=false";
    private String username = "root";
    private String password = "12345678";
    private Connection connection;
    private static final String SELECT_ALL_CUSTOMER = "select * from patient;";
    public BaseRepository() {
    }

    public Connection getConnection(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL,username,password);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }

}
