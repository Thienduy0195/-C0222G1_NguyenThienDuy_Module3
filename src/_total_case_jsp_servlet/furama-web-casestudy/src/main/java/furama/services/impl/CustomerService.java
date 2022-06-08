package furama.services.impl;

import furama.models.person.customer.Customer;
import furama.models.person.customer.CustomerType;
import furama.repository.ICustomerRepository;
import furama.repository.impl.CustomerRepository;
import furama.services.ICustomerService;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CustomerService implements ICustomerService {
    ICustomerRepository customerRepository = new CustomerRepository();
    public static final String REGEX_CUSTOMER_ID ="^KH(\\-)[0-9]{4}$";
    public static final String REGEX_NAME = "^[\\p{Lu}\\p{Ll}\\s]+$";
//    public static final String REGEX_DATE = "^((((19|[2-9]\\d)\\d{2})\\-(0[13578]|1[02])\\-(0[1-9]|[12]\\d|3[01]))|(((19|[2-9]\\d)\\d{2})\\-(0[13456789]|1[012])\\-(0[1-9]|[12]\\d|30))|(((19|[2-9]\\d)\\d{2})\\-02\\-(0[1-9]|1\\d|2[0-8]))|(((1[6-9]|[2-9]\\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00))\\-02\\-29))$";
    public static final String REGEX_NUMBER = "^[0-9]+$";
    public static final String REGEX_ID_CARD = "^[0-9]{9}$";
    public static final String REGEX_PHONE =   "^(84|0[3|5|7|8|9])+([0-9]{8})$"; //"^((\\(84\\)(\\+))|0)(90|91)+([0-9]{7})$";
    public static final String REGEX_EMAIL = "^[\\w\\-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$";


    @Override
    public List<Customer> selectAllCustomer() {
        return customerRepository.selectAll();
    }

    @Override
    public Map<String, String> saveCustomer(Customer customer) {
        Map<String, String> map = new HashMap<>();
        if (!customer.getCustomerId().matches(REGEX_CUSTOMER_ID)) {
            map.put("id", "Invalid ID");
        }
        if (!String.valueOf(customer.getCustomerType()).matches(REGEX_NUMBER)) {
            map.put("type", "Invalid customer type");
        }
        if (!customer.getCustomerName().matches(REGEX_NAME)) {
            map.put("name", "Invalid name");
        }
        if (!customer.getCustomerIdCard().matches(REGEX_ID_CARD)) {
            map.put("idCard", "Invalid customer id card");
        }
        if (!customer.getCustomerPhone().matches(REGEX_PHONE)) {
            map.put("phone", "Invalid phone number");
        }
        if (!customer.getCustomerEmail().matches(REGEX_EMAIL)){
            map.put("email", "Invalid email");
        }
        if (map.isEmpty()){
            customerRepository.save(customer);
        }
        return map;
    }

    @Override
    public Customer selectCustomer(String id) {
        return customerRepository.select(id);
    }

    @Override
    public Map<String, String> updateCustomer(Customer customer) throws SQLException {
        Map<String, String> map = new HashMap<>();
        if (!String.valueOf(customer.getCustomerType()).matches(REGEX_NUMBER)) {
            map.put("type", "Invalid customer type");
        }
        if (!customer.getCustomerName().matches(REGEX_NAME)) {
            map.put("name", "Invalid name");
        }
        if (!customer.getCustomerIdCard().matches(REGEX_NUMBER)) {
            map.put("idCard", "Invalid customer id card");
        }
        if (!customer.getCustomerPhone().matches(REGEX_PHONE)) {
            map.put("phone", "Invalid phone number");
        }
        if (!customer.getCustomerEmail().matches(REGEX_EMAIL)){
            map.put("email", "Invalid email");
        }
        if (map.isEmpty()){
            customerRepository.update(customer);
        }
        return map;
    }

    @Override
    public void deleteCustomer(String id) throws SQLException {
        customerRepository.delete(id);
    }

    @Override
    public List<Customer> searchCustomer(String name) {
        return customerRepository.search(name);
    }

    @Override
    public Map<Integer, String> getType() {
        return customerRepository.getType();
    }

    @Override
    public Map<Integer, String> getGender() {
        return customerRepository.getGender();
    }

    @Override
    public List<CustomerType> getCustomerType(){
        List<CustomerType> customerTypeList = null;
        customerTypeList = customerRepository.getCustomerType();
        return customerTypeList;
    }

}
