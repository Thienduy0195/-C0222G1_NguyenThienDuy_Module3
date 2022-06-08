package furama.repository;

import furama.models.person.employee.Degree;
import furama.models.person.employee.Division;
import furama.models.person.employee.Employee;
import furama.models.person.employee.Position;

import java.util.List;

public interface IEmployeeRepository extends ICRUDRepository<Employee, Integer, String> {
    List<Position> getPosition();
    List<Degree> getDegree();
    List<Division> getDivision();
    List<Employee> searchWithPositionId(Integer positionId, String name);
}
