package furama.services;

import furama.models.facility.RentType;
import furama.models.facility.Service;
import furama.models.facility.ServiceType;
import furama.models.person.customer.Customer;
import furama.models.person.customer.CustomerType;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface IServiceService {
    List<Service> selectAllService();

    Map<String, String> saveService(Service service);

    Service selectService(String id);

    Map<String, String> updateService(Service service) throws SQLException;

    void deleteService(String id) throws SQLException;

    List<Service> searchService(String name);


    List<RentType> getRentType();

    List<ServiceType> getServiceType();
}
