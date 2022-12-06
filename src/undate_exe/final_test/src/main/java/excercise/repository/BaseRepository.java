package excercise.repository;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class BaseRepository {
    private String jdbcURL = "jdbc:mysql://localhost:3306/patient_document?useSSL=false";
    private String username = "root";
    private String password = "12345678";
    private Connection connection;

    public BaseRepository() {
    }

    public Connection getConnection(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL,username,password);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }finally {
            if(connection==null){
                System.out.println("NULLL");
            }
        }
        return connection;
    }
}
