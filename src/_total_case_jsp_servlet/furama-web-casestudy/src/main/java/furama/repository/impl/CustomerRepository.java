package furama.repository.impl;

import furama.models.person.customer.Customer;
import furama.models.person.customer.CustomerType;
import furama.repository.BaseRepository;
import furama.repository.ICustomerRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

public class CustomerRepository implements ICustomerRepository {
    BaseRepository baseRepository = new BaseRepository();
    private static final String SELECT_ALL_CUSTOMER = "select * from customer;";
    private static final String INSERT_CUSTOMER_SQL = "insert into customer values (?,?,?,?,?,?,?,?,?);";
    private static final String SELECT_CUSTOMER_BY_ID = "select * from customer where customer_id=?;";
    private static final String UPDATE_CUSTOMER_SQL = "update customer set customer_type_id = ?, customer_name = ?, customer_birthday= ?, customer_gender=?, customer_id_card= ?, customer_phone = ?, customer_email = ?, customer_address=? where customer_id = ?;";
    private static final String DELETE_CUSTOMER_SQL = "delete from customer where customer_id = ?;";
    private static final String SEARCH_CUSTOMER_SQL = "select * from customer where `customer_name` like ?;";
    private static final String GET_CUSTOMER_TYPE_SQL = "select * from customer_type;";


    @Override
    public List<Customer> selectAll() {
        List<Customer> customerList = new ArrayList<>();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = baseRepository.getConnection().prepareStatement(SELECT_ALL_CUSTOMER);
            Customer customer;
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                customer = new Customer();
                customer.setCustomerId(resultSet.getString("customer_id"));
                customer.setCustomerType(resultSet.getInt("customer_type_id"));
                customer.setCustomerName(resultSet.getString("customer_name"));
                customer.setCustomerBirthDay(resultSet.getString("customer_birthday"));
                customer.setCustomerGender(resultSet.getInt("customer_gender"));
                customer.setCustomerIdCard(resultSet.getString("customer_id_card"));
                customer.setCustomerPhone(resultSet.getString("customer_phone"));
                customer.setCustomerEmail(resultSet.getString("customer_email"));
                customer.setCustomerAddress(resultSet.getString("customer_address"));
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

    @Override
    public void save(Customer customer) {
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = baseRepository.getConnection().prepareStatement(INSERT_CUSTOMER_SQL);
            preparedStatement.setString(1, customer.getCustomerId());
            preparedStatement.setInt(2, customer.getCustomerType());
            preparedStatement.setString(3, customer.getCustomerName());
            preparedStatement.setString(4, customer.getCustomerBirthDay());
            preparedStatement.setInt(5, customer.getCustomerGender());
            preparedStatement.setString(6, customer.getCustomerIdCard());
            preparedStatement.setString(7, customer.getCustomerPhone());
            preparedStatement.setString(8, customer.getCustomerEmail());
            preparedStatement.setString(9, customer.getCustomerAddress());
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
    public Customer select(String id) {
        Customer customer = null;
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = baseRepository.getConnection().prepareStatement(SELECT_CUSTOMER_BY_ID);
            preparedStatement.setString(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                customer = new Customer();
                customer.setCustomerId(id);
                customer.setCustomerType(resultSet.getInt(2));
                customer.setCustomerName(resultSet.getString(3));
                customer.setCustomerBirthDay(resultSet.getString(4));
                customer.setCustomerGender(resultSet.getInt(5));
                customer.setCustomerIdCard(resultSet.getString(6));
                customer.setCustomerPhone(resultSet.getString(7));
                customer.setCustomerEmail(resultSet.getString(8));
                customer.setCustomerAddress(resultSet.getString(9));
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
        return customer;
    }

    @Override
    public boolean update(Customer customer) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = baseRepository.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_CUSTOMER_SQL);) {
            preparedStatement.setInt(1, customer.getCustomerType());
            preparedStatement.setString(2, customer.getCustomerName());
            preparedStatement.setString(3, customer.getCustomerBirthDay());
            preparedStatement.setInt(4, customer.getCustomerGender());
            preparedStatement.setString(5, customer.getCustomerIdCard());
            preparedStatement.setString(6, customer.getCustomerPhone());
            preparedStatement.setString(7, customer.getCustomerEmail());
            preparedStatement.setString(8, customer.getCustomerAddress());
            preparedStatement.setString(9, customer.getCustomerId());
            rowUpdated = preparedStatement.executeUpdate() > 0;
        }
        return rowUpdated;
    }

    @Override
    public boolean delete(String id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = baseRepository.getConnection();
             PreparedStatement statement = connection.prepareStatement(DELETE_CUSTOMER_SQL);) {
            statement.setString(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    @Override
    public List<Customer> search(String name) {
        PreparedStatement preparedStatement = null;
        List<Customer> customerList = new ArrayList<>();
        try {
            preparedStatement = baseRepository.getConnection().prepareStatement(SEARCH_CUSTOMER_SQL);
            preparedStatement.setString(1, "%"+name+"%");
            ResultSet resultSet = preparedStatement.executeQuery();
            Customer customer;
            while (resultSet.next()){
                customer = new Customer();
                customer.setCustomerId(resultSet.getString(1));
                customer.setCustomerType(resultSet.getInt(2));
                customer.setCustomerName(resultSet.getString(3));
                customer.setCustomerBirthDay(resultSet.getString(4));
                customer.setCustomerGender(resultSet.getInt(5));
                customer.setCustomerIdCard(resultSet.getString(6));
                customer.setCustomerPhone(resultSet.getString(7));
                customer.setCustomerEmail(resultSet.getString(8));
                customer.setCustomerAddress(resultSet.getString(9));
                customerList.add(customer);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return customerList;
    }

    @Override
    public Map<Integer, String> getType() {
        Map <Integer, String> map = new TreeMap<>();
        PreparedStatement preparedStatement = null;
        try{
            preparedStatement = baseRepository.getConnection().prepareStatement(GET_CUSTOMER_TYPE_SQL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                Integer customerTypeId = resultSet.getInt(1);
                String customerTypeName = resultSet.getString(2);
                map.put(customerTypeId, customerTypeName);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally {
            try {
                preparedStatement.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        return map;
    }

    @Override
    public Map<Integer, String> getGender() {
        Map <Integer, String> map = new TreeMap<>();
        map.put(0, "Male");
        map.put(1, "Female");
//        map.put(null, "Other");
        return map;
    }

    @Override
    public List<CustomerType> getCustomerType(){
        List<CustomerType> customerTypeList = new ArrayList<>();
        PreparedStatement preparedStatement = null;
        try{
            preparedStatement = baseRepository.getConnection().prepareStatement(GET_CUSTOMER_TYPE_SQL);
            ResultSet resultSet = preparedStatement.executeQuery();
            CustomerType customerType = null;
            while (resultSet.next()){
                Integer customerTypeId = resultSet.getInt(1);
                String customerTypeName = resultSet.getString(2);
                customerType = new CustomerType(customerTypeId, customerTypeName);
                customerTypeList.add(customerType);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally {
            try {
                preparedStatement.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        return customerTypeList;
    }
}
