package furama.services.impl;

import furama.models.facility.RentType;
import furama.models.facility.Service;
import furama.models.facility.ServiceType;
import furama.repository.IServiceRepository;
import furama.repository.impl.ServiceRepository;
import furama.services.IServiceService;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ServiceOfService implements IServiceService {
    IServiceRepository serviceRepository = new ServiceRepository();

    public static final String REGEX_SERVICE_ID ="^DV(\\-)[0-9]{4}$";
    public static final String REGEX_DOUBLE = "^\\+*\\d+(\\.\\d+)*$";
    public static final String REGEX_NAME = "^[\\p{Lu}\\p{Ll}\\s]+$";
    public static final String REGEX_NUMBER = "^[0-9]+$";
    public static final String REGEX_PHONE =   "^(84|0[3|5|7|8|9])+([0-9]{8})$"; //"^((\\(84\\)(\\+))|0)(90|91)+([0-9]{7})$";
    public static final String REGEX_EMAIL = "^[\\w\\-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$";

    @Override
    public List<Service> selectAllService() {
        return serviceRepository.selectAll();
    }

    @Override
    public Map<String, String> saveService(Service service) {
        Map<String, String> map = new HashMap<>();
        if (!service.getServiceId().matches(REGEX_SERVICE_ID)) {
            map.put("id", "Invalid ID!");
        }
        if (!service.getServiceName().matches(REGEX_NAME)) {
            map.put("name", "Invalid name!");
        }
        if (!String.valueOf(service.getServiceArea()).matches(REGEX_NUMBER)) {
            map.put("area", "Invalid service area!");
        }
        if (!String.valueOf(service.getServiceCost()).matches(REGEX_DOUBLE)) {
            map.put("cost", "Invalid service cost!");
        }
        if (!String.valueOf(service.getServiceMaxPeople()).matches(REGEX_NUMBER)) {
            map.put("maxPeople", "Invalid max people!");
        }
        if ((service.getPoolArea()!=null) && (!String.valueOf(service.getPoolArea()).matches(REGEX_DOUBLE))) {
            map.put("poolArea", "Invalid pool area!");
        }
        if (!String.valueOf(service.getNumberOfFloor()).matches(REGEX_NUMBER)) {
            map.put("numberOfFloor", "Invalid number of floor!");
        }
        if (map.isEmpty()){
            serviceRepository.save(service);
        }
        return map;
    }

    @Override
    public Service selectService(String id) {
        return null;
    }

    @Override
    public Map<String, String> updateService(Service service) throws SQLException {
        return null;
    }

    @Override
    public void deleteService(String id) throws SQLException {
        serviceRepository.delete(id);
    }

    @Override
    public List<Service> searchService(String name) {
        return serviceRepository.search(name);
    }

    @Override
    public List<RentType> getRentType() {
        return serviceRepository.getRentType();
    }

    @Override
    public List<ServiceType> getServiceType() {
        return serviceRepository.getServiceType();
    }
}
