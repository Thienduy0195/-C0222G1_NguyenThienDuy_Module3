package furama.repository;

import furama.models.person.customer.Customer;
import furama.models.person.customer.CustomerType;

import java.util.List;

public interface ICustomerRepository extends ICRUDRepository<Customer, Integer, String> {
    List<CustomerType> getCustomerType();
}
