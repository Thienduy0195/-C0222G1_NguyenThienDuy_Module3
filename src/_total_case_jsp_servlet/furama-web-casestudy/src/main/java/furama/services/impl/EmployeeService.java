package furama.services.impl;


import furama.models.person.employee.Degree;
import furama.models.person.employee.Division;
import furama.models.person.employee.Employee;
import furama.models.person.employee.Position;
import furama.repository.IEmployeeRepository;
import furama.repository.impl.EmployeeRepository;
import furama.services.IEmployeeService;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class EmployeeService implements IEmployeeService {
    IEmployeeRepository employeeRepository = new EmployeeRepository();
    public static final String REGEX_DOUBLE = "^\\+*\\d+(\\.\\d+)*$";
    public static final String REGEX_NAME = "^[\\p{Lu}\\p{Ll}\\s]+$";
    //    public static final String REGEX_DATE = "^((((19|[2-9]\\d)\\d{2})\\-(0[13578]|1[02])\\-(0[1-9]|[12]\\d|3[01]))|(((19|[2-9]\\d)\\d{2})\\-(0[13456789]|1[012])\\-(0[1-9]|[12]\\d|30))|(((19|[2-9]\\d)\\d{2})\\-02\\-(0[1-9]|1\\d|2[0-8]))|(((1[6-9]|[2-9]\\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00))\\-02\\-29))$";
    public static final String REGEX_NUMBER = "^[0-9]+$";
    public static final String REGEX_ID_CARD = "^[0-9]{9}$";
    public static final String REGEX_PHONE =   "^(84|0[3|5|7|8|9])+([0-9]{8})$"; //"^((\\(84\\)(\\+))|0)(90|91)+([0-9]{7})$";
    public static final String REGEX_EMAIL = "^[\\w\\-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$";
    @Override
    public List<Employee> selectAllEmployee() {
        return employeeRepository.selectAll();
    }

    @Override
    public Map<String, String> saveEmployee(Employee employee) {
        Map<String, String> map = new HashMap<>();
        if (!employee.getEmployeeName().matches(REGEX_NAME)) {
            map.put("name", "Invalid name");
        }
        if (!employee.getEmployeeIdCard().matches(REGEX_ID_CARD)) {
            map.put("idCard", "Invalid Id Card");
        }
        if (!String.valueOf(employee.getEmployeeSalary()).matches(REGEX_DOUBLE)) {
            map.put("salary", "Invalid Employee Salary");
        }
        if (!employee.getEmployeePhoneNumber().matches(REGEX_PHONE)) {
            map.put("phone", "Invalid Phone Number");
        }
        if (!employee.getEmployeeEmail().matches(REGEX_EMAIL)) {
            map.put("email", "Invalid Email");
        }
        if (map.isEmpty()){
            employeeRepository.save(employee);
        }
        return map;
    }

    @Override
    public Employee selectEmployee(String id) {
        return employeeRepository.select(id);
    }

    @Override
    public Map<String, String> updateEmployee(Employee employee) throws SQLException {
        Map<String, String> map = new HashMap<>();
        if (!employee.getEmployeeName().matches(REGEX_NAME)) {
            map.put("name", "Invalid name");
        }
        if (!employee.getEmployeeIdCard().matches(REGEX_NUMBER)) {
            map.put("idCard", "Invalid Id Card");
        }
        if (!String.valueOf(employee.getEmployeeSalary()).matches(REGEX_DOUBLE)) {
            map.put("salary", "Invalid Employee Salary");
        }
        if (!employee.getEmployeePhoneNumber().matches(REGEX_PHONE)) {
            map.put("phone", "Invalid Phone Number");
        }
        if (!employee.getEmployeeEmail().matches(REGEX_EMAIL)) {
            map.put("email", "Invalid Email");
        }
        if (map.isEmpty()){
            employeeRepository.update(employee);
        }
        return map;
    }

    @Override
    public void deleteEmployee(String id) throws SQLException {
        employeeRepository.delete(id);
    }

    @Override
    public List<Employee> searchEmployee(String name) {
        return employeeRepository.search(name);
    }

    @Override
    public List<Employee> searchWithPositionId(Integer positionId, String name) {
        return employeeRepository.searchWithPositionId(positionId, name);
    }


    @Override
    public List<Position> getPosition() {
        return employeeRepository.getPosition();
    }

    @Override
    public List<Degree> getDegree() {
        return employeeRepository.getDegree();
    }

    @Override
    public List<Division> getDivision() {
        return employeeRepository.getDivision();
    }
}
