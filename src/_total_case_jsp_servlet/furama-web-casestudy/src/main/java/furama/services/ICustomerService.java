package furama.services;

import furama.models.person.customer.Customer;
import furama.models.person.customer.CustomerType;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface ICustomerService {
    List<Customer> selectAllCustomer();

    Map<String, String> saveCustomer(Customer customer);

    Customer selectCustomer(String id);

    Map<String, String> updateCustomer(Customer customer) throws SQLException;

    void deleteCustomer(String id) throws SQLException;

    List<Customer> searchCustomer(String name);

    Map<Integer, String> getType();

    Map<Integer, String> getGender();

    List<CustomerType> getCustomerType();
}
