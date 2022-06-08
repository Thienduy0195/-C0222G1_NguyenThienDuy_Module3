package furama.repository.impl;

import furama.models.facility.RentType;
import furama.models.facility.Service;
import furama.models.facility.ServiceType;
import furama.repository.BaseRepository;
import furama.repository.IServiceRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class ServiceRepository implements IServiceRepository {
    BaseRepository baseRepository = new BaseRepository();
    private static final String SELECT_ALL_SERVICE = "select * from service;";
    private static final String INSERT_SERVICE_SQL = "insert into service values (?,?,?,?,?,?,?,?,?,?,?);";
    private static final String SELECT_SERVICE_BY_ID = "select * from service where service_id=?;";
    private static final String UPDATE_SERVICE_SQL = "update service set service_name=?, service_area=?, service_cost=?, " +
            "service_max_people=?, rent_type_id=?, service_type_id=?, room_standard=?, other_convenience_description=?, " +
            "pool_area=?, number_of_floor=? where service_id=?;";
    private static final String DELETE_SERVICE_SQL = "delete from service where service_id = ?;";
    private static final String SEARCH_SERVICE_SQL = "select * from service where `service_name` like ?;";
    private static final String GET_SERVICE_RENT_TYPE_SQL = "select * from rent_type;";
    private static final String GET_SERVICE_TYPE_SQL = "select * from service_type;";

    @Override
    public List<Service> selectAll() {
        List<Service> serviceList = new ArrayList<>();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = baseRepository.getConnection().prepareStatement(SELECT_ALL_SERVICE);
            Service service;
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                service = new Service();
                service.setServiceId(resultSet.getString(1));
                service.setServiceName(resultSet.getString(2));
                service.setServiceArea(resultSet.getInt(3));
                service.setServiceCost(resultSet.getDouble(4));
                service.setServiceMaxPeople(resultSet.getInt(5));
                service.setRentTypeId(resultSet.getInt(6));
                service.setServiceTypeId(resultSet.getInt(7));
                service.setStandardRoom(resultSet.getString(8));
                service.setDescriptionOtherConvenience(resultSet.getString(9));
                service.setPoolArea(resultSet.getDouble(10));
                service.setNumberOfFloor(resultSet.getInt(11));
                serviceList.add(service);
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
        return serviceList;
    }

    @Override
    public void save(Service service) {
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = baseRepository.getConnection().prepareStatement(INSERT_SERVICE_SQL);
            preparedStatement.setString(1, service.getServiceId());
            preparedStatement.setString(2, service.getServiceName());
            preparedStatement.setInt(3, service.getServiceArea());
            preparedStatement.setDouble(4, service.getServiceCost());
            preparedStatement.setInt(5, service.getServiceMaxPeople());
            preparedStatement.setInt(6, service.getRentTypeId());
            preparedStatement.setInt(7, service.getServiceTypeId());
            preparedStatement.setString(8, service.getStandardRoom());
            preparedStatement.setString(9, service.getDescriptionOtherConvenience());
            preparedStatement.setDouble(10, service.getPoolArea());
            preparedStatement.setInt(11, service.getNumberOfFloor());
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
    public Service select(String id) {
        Service service = null;
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = baseRepository.getConnection().prepareStatement(SELECT_SERVICE_BY_ID);
            preparedStatement.setString(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                service = new Service();
                service.setServiceId(id);
                service.setServiceName(resultSet.getString(2));
                service.setServiceArea(resultSet.getInt(3));
                service.setServiceCost(resultSet.getDouble(4));
                service.setServiceMaxPeople(resultSet.getInt(5));
                service.setRentTypeId(resultSet.getInt(6));
                service.setServiceTypeId(resultSet.getInt(7));
                service.setStandardRoom(resultSet.getString(8));
                service.setDescriptionOtherConvenience(resultSet.getString(9));
                service.setPoolArea(resultSet.getDouble(10));
                service.setNumberOfFloor(resultSet.getInt(11));
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
        return service;
    }

    @Override
    public boolean update(Service service) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = baseRepository.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_SERVICE_SQL);) {
            preparedStatement.setString(1, service.getServiceName());
            preparedStatement.setInt(2, service.getServiceArea());
            preparedStatement.setDouble(3, service.getServiceCost());
            preparedStatement.setInt(4, service.getServiceMaxPeople());
            preparedStatement.setInt(5, service.getRentTypeId());
            preparedStatement.setInt(6, service.getServiceTypeId());
            preparedStatement.setString(7, service.getStandardRoom());
            preparedStatement.setString(8, service.getDescriptionOtherConvenience());
            preparedStatement.setDouble(9, service.getPoolArea());
            preparedStatement.setInt(10, service.getNumberOfFloor());
            preparedStatement.setString(11, service.getServiceId());
            rowUpdated = preparedStatement.executeUpdate() > 0;
        }
        return rowUpdated;
    }

    @Override
    public boolean delete(String id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = baseRepository.getConnection();
             PreparedStatement statement = connection.prepareStatement(DELETE_SERVICE_SQL);) {
            statement.setString(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    @Override
    public List<Service> search(String name) {
        PreparedStatement preparedStatement = null;
        List<Service> serviceList = new ArrayList<>();
        try {
            preparedStatement = baseRepository.getConnection().prepareStatement(SEARCH_SERVICE_SQL);
            preparedStatement.setString(1, "%"+name+"%");
            ResultSet resultSet = preparedStatement.executeQuery();
            Service service;
            while (resultSet.next()){
                service = new Service();
                service.setServiceId(resultSet.getString(1));
                service.setServiceName(resultSet.getString(2));
                service.setServiceArea(resultSet.getInt(3));
                service.setServiceCost(resultSet.getDouble(4));
                service.setServiceMaxPeople(resultSet.getInt(5));
                service.setRentTypeId(resultSet.getInt(6));
                service.setServiceTypeId(resultSet.getInt(7));
                service.setStandardRoom(resultSet.getString(8));
                service.setDescriptionOtherConvenience(resultSet.getString(9));
                service.setPoolArea(resultSet.getDouble(10));
                service.setNumberOfFloor(resultSet.getInt(11));
                serviceList.add(service);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return serviceList;
    }

    @Override
    public Map<Integer, String> getType() {
        return null;
    }

    @Override
    public Map<Integer, String> getGender() {
        return null;
    }

    @Override
    public List<RentType> getRentType() {
        List<RentType> rentTypeList = new ArrayList<>();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = baseRepository.getConnection().prepareStatement(GET_SERVICE_RENT_TYPE_SQL);
            RentType rentType;
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                rentType = new RentType();
                rentType.setRentTypeId(resultSet.getInt(1));
                rentType.setRentTypeName(resultSet.getString(2));
                rentTypeList.add(rentType);
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
        return rentTypeList;
    }

    @Override
    public List<ServiceType> getServiceType() {
        List<ServiceType> serviceTypeList = new ArrayList<>();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = baseRepository.getConnection().prepareStatement(GET_SERVICE_TYPE_SQL);
            ServiceType serviceType;
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                serviceType = new ServiceType();
                serviceType.setServiceTypeId(resultSet.getInt(1));
                serviceType.setServiceTypeName(resultSet.getString(2));
                serviceTypeList.add(serviceType);
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
        return serviceTypeList;
    }
}
