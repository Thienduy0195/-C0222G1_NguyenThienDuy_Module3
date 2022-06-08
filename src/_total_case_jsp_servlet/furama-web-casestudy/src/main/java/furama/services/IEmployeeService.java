package furama.services;

import furama.models.person.customer.Customer;
import furama.models.person.customer.CustomerType;
import furama.models.person.employee.Degree;
import furama.models.person.employee.Division;
import furama.models.person.employee.Employee;
import furama.models.person.employee.Position;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface IEmployeeService {
    List<Employee> selectAllEmployee();

    Map<String, String> saveEmployee(Employee employee);

    Employee selectEmployee(String id);

    Map<String, String> updateEmployee(Employee employee) throws SQLException;

    void deleteEmployee(String id) throws SQLException;

    List<Employee> searchEmployee(String name);

    List<Employee> searchWithPositionId(Integer positionId, String name);

    List<Position> getPosition();

    List<Degree> getDegree();

    List<Division> getDivision();
}
