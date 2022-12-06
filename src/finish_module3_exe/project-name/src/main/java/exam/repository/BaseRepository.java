package exam.repository;

import exam.models.Customer;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BaseRepository {
    private String jdbcURL = "jdbc:mysql://localhost:3306/test_data?useSSL=false";
    private String username = "root";
    private String password = "12345678";
    private Connection connection;
    private static final String SELECT_ALL_CUSTOMER = "select * from customer;";
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

    public List<Customer> selectAll() {
        List<Customer> customerList = new ArrayList<>();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = this.getConnection().prepareStatement(SELECT_ALL_CUSTOMER);
            Customer customer;
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                customer = new Customer();
                customer.setCustomerId(resultSet.getString("customer_id"));
                customer.setCustomerName(resultSet.getString("customer_name"));
                customerList.add(customer);
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
        return customerList;
    }
}


