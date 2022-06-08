package furama.repository;

import furama.models.facility.RentType;
import furama.models.facility.Service;
import furama.models.facility.ServiceType;

import java.util.List;

public interface IServiceRepository extends ICRUDRepository<Service, Integer, String> {
    List<RentType> getRentType();
    List<ServiceType> getServiceType();
}
