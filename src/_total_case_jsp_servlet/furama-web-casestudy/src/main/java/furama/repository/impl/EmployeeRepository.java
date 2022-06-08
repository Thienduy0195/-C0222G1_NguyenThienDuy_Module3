package furama.repository.impl;

import furama.models.person.employee.Degree;
import furama.models.person.employee.Division;
import furama.models.person.employee.Employee;
import furama.models.person.employee.Position;
import furama.repository.BaseRepository;
import furama.repository.IEmployeeRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class EmployeeRepository implements IEmployeeRepository {

    BaseRepository baseRepository = new BaseRepository();
    private static final String SELECT_ALL_EMPLOYEE = "select * from employee;";
    private static final String INSERT_EMPLOYEE_SQL = "insert into employee (employee_name, employee_birthday, employee_id_card, employee_salary, employee_phone, employee_email, employee_address, position_id, education_degree_id, division_id, user_name) " +
            "values (?,?,?,?,?,?,?,?,?,?,'admin@gmail.com');";
    private static final String SELECT_EMPLOYEE_BY_ID = "select * from employee where employee_id=?;";
    private static final String UPDATE_EMPLOYEE_SQL = "update employee set employee_name = ?, employee_birthday = ?, employee_id_card = ?, \n" +
            "employee_salary = ?, employee_phone = ?, employee_email = ?, employee_address = ?, \n" +
            "position_id = ?, education_degree_id = ?, division_id =? where employee_id = ?;";
    private static final String DELETE_EMPLOYEE_SQL = "delete from employee where employee_id = ?;";
    private static final String SEARCH_EMPLOYEE_SQL = "select * from employee where `employee_name` like ?;";
    private static final String SEARCH_EMPLOYEE_WITH_POSITION_SQL = "select * from employee where `employee_name` like ? and position_id= ?;";
    private static final String GET_EMPLOYEE_POSITION_SQL = "select * from position;";
    private static final String GET_EMPLOYEE_DEGREE_SQL = "select * from education_degree;";
    private static final String GET_EMPLOYEE_DIVISION_SQL = "select * from division;";


    @Override
    public List<Employee> selectAll() {
        List<Employee> employeeList = new ArrayList<>();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = baseRepository.getConnection().prepareStatement(SELECT_ALL_EMPLOYEE);
            Employee employee;
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                employee = new Employee();
                employee.setEmployeeId(resultSet.getInt(1));
                employee.setEmployeeName(resultSet.getString(2));
                employee.setEmployeeBirthday(resultSet.getString(3));
                employee.setEmployeeIdCard(resultSet.getString(4));
                employee.setEmployeeSalary(Double.parseDouble(resultSet.getString(5)));
                employee.setEmployeePhoneNumber(resultSet.getString(6));
                employee.setEmployeeEmail(resultSet.getString(7));
                employee.setEmployeeAddress(resultSet.getString(8));
                employee.setEmployeePositionId(resultSet.getInt(9));
                employee.setEmployeeDegreeId(resultSet.getInt(10));
                employee.setEmployeeDivisionId(resultSet.getInt(11));
                employee.setUserName(resultSet.getString(12));
                employeeList.add(employee);
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
        return employeeList;
    }

    @Override
    public void save(Employee employee) {
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = baseRepository.getConnection().prepareStatement(INSERT_EMPLOYEE_SQL);
            preparedStatement.setString(1, employee.getEmployeeName());
            preparedStatement.setString(2, employee.getEmployeeBirthday());
            preparedStatement.setString(3, employee.getEmployeeIdCard());
            preparedStatement.setDouble(4, employee.getEmployeeSalary());
            preparedStatement.setString(5, employee.getEmployeePhoneNumber());
            preparedStatement.setString(6, employee.getEmployeeEmail());
            preparedStatement.setString(7, employee.getEmployeeAddress());
            preparedStatement.setInt(8, employee.getEmployeePositionId());
            preparedStatement.setInt(9, employee.getEmployeeDegreeId());
            preparedStatement.setInt(10, employee.getEmployeeDivisionId());
//            preparedStatement.setString(11, employee.getUserName());
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
    public Employee select(String id) {

        Employee employee = null;
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = baseRepository.getConnection().prepareStatement(SELECT_EMPLOYEE_BY_ID);
            preparedStatement.setString(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                employee = new Employee();
                employee.setEmployeeId(Integer.parseInt(id));
                employee.setEmployeeName(resultSet.getString(2));
                employee.setEmployeeBirthday(resultSet.getString(3));
                employee.setEmployeeIdCard(resultSet.getString(4));
                employee.setEmployeeSalary(resultSet.getDouble(5));
                employee.setEmployeePhoneNumber(resultSet.getString(6));
                employee.setEmployeeEmail(resultSet.getString(7));
                employee.setEmployeeAddress(resultSet.getString(8));
                employee.setEmployeePositionId(resultSet.getInt(9));
                employee.setEmployeeDegreeId(resultSet.getInt(10));
                employee.setEmployeeDivisionId(resultSet.getInt(11));
                employee.setUserName(resultSet.getString(12));
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
        return employee;
    }

    @Override
    public boolean update(Employee employee) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = baseRepository.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_EMPLOYEE_SQL);) {
            preparedStatement.setString(1, employee.getEmployeeName());
            preparedStatement.setString(2, employee.getEmployeeBirthday());
            preparedStatement.setString(3, employee.getEmployeeIdCard());
            preparedStatement.setDouble(4, employee.getEmployeeSalary());
            preparedStatement.setString(5, employee.getEmployeePhoneNumber());
            preparedStatement.setString(6, employee.getEmployeeEmail());
            preparedStatement.setString(7, employee.getEmployeeAddress());
            preparedStatement.setInt(8, employee.getEmployeePositionId());
            preparedStatement.setInt(9, employee.getEmployeeDegreeId());
            preparedStatement.setInt(10, employee.getEmployeeDivisionId());
            preparedStatement.setInt(11, employee.getEmployeeId());
            rowUpdated = preparedStatement.executeUpdate() > 0;
        }
        return rowUpdated;
    }

    @Override
    public boolean delete(String id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = baseRepository.getConnection();
             PreparedStatement statement = connection.prepareStatement(DELETE_EMPLOYEE_SQL);) {
            statement.setString(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    @Override
    public List<Employee> search(String name) {
        PreparedStatement preparedStatement = null;
        List<Employee> employeeList = new ArrayList<>();
        try {
            preparedStatement = baseRepository.getConnection().prepareStatement(SEARCH_EMPLOYEE_SQL);
            preparedStatement.setString(1, "%"+name+"%");
            ResultSet resultSet = preparedStatement.executeQuery();
            Employee employee;
            while (resultSet.next()){
                employee = new Employee();
                employee.setEmployeeId(resultSet.getInt(1));
                employee.setEmployeeName(resultSet.getString(2));
                employee.setEmployeeBirthday(resultSet.getString(3));
                employee.setEmployeeIdCard(resultSet.getString(4));
                employee.setEmployeeSalary(resultSet.getDouble(5));
                employee.setEmployeePhoneNumber(resultSet.getString(6));
                employee.setEmployeeEmail(resultSet.getString(7));
                employee.setEmployeeAddress(resultSet.getString(8));
                employee.setEmployeePositionId(resultSet.getInt(9));
                employee.setEmployeeDegreeId(resultSet.getInt(10));
                employee.setEmployeeDivisionId(resultSet.getInt(11));
                employee.setUserName(resultSet.getString(12));
                employeeList.add(employee);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return employeeList;
    }

    @Override
    public List<Employee> searchWithPositionId(Integer positionId, String name) {
        PreparedStatement preparedStatement = null;
        List<Employee> employeeList = new ArrayList<>();
        try {
            preparedStatement = baseRepository.getConnection().prepareStatement(SEARCH_EMPLOYEE_WITH_POSITION_SQL);
            preparedStatement.setString(1, "%"+name+"%");
            preparedStatement.setInt(2, positionId);
            ResultSet resultSet = preparedStatement.executeQuery();
            Employee employee;
            while (resultSet.next()){
                employee = new Employee();
                employee.setEmployeeId(resultSet.getInt(1));
                employee.setEmployeeName(resultSet.getString(2));
                employee.setEmployeeBirthday(resultSet.getString(3));
                employee.setEmployeeIdCard(resultSet.getString(4));
                employee.setEmployeeSalary(resultSet.getDouble(5));
                employee.setEmployeePhoneNumber(resultSet.getString(6));
                employee.setEmployeeEmail(resultSet.getString(7));
                employee.setEmployeeAddress(resultSet.getString(8));
                employee.setEmployeePositionId(resultSet.getInt(9));
                employee.setEmployeeDegreeId(resultSet.getInt(10));
                employee.setEmployeeDivisionId(resultSet.getInt(11));
                employee.setUserName(resultSet.getString(12));
                employeeList.add(employee);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return employeeList;
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
    public List<Position> getPosition() {
        List<Position> positionList = new ArrayList<>();
        PreparedStatement preparedStatement = null;
        try{
            preparedStatement = baseRepository.getConnection().prepareStatement(GET_EMPLOYEE_POSITION_SQL);
            ResultSet resultSet = preparedStatement.executeQuery();
            Position position = null;
            while (resultSet.next()){
                Integer positionId = resultSet.getInt(1);
                String positionName = resultSet.getString(2);
                position = new Position(positionId, positionName);
                positionList.add(position);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally {
            try {
                preparedStatement.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        return positionList;
    }

    @Override
    public List<Degree> getDegree() {
        List<Degree> degreeList = new ArrayList<>();
        PreparedStatement preparedStatement = null;
        try{
            preparedStatement = baseRepository.getConnection().prepareStatement(GET_EMPLOYEE_DEGREE_SQL);
            ResultSet resultSet = preparedStatement.executeQuery();
            Degree degree = null;
            while (resultSet.next()){
                Integer degreeId = resultSet.getInt(1);
                String degreeName = resultSet.getString(2);
                degree = new Degree(degreeId, degreeName);
                degreeList.add(degree);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally {
            try {
                preparedStatement.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        return degreeList;
    }

    @Override
    public List<Division> getDivision() {
        List<Division> divisionList = new ArrayList<>();
        PreparedStatement preparedStatement = null;
        try{
            preparedStatement = baseRepository.getConnection().prepareStatement(GET_EMPLOYEE_DIVISION_SQL);
            ResultSet resultSet = preparedStatement.executeQuery();
            Division division = null;
            while (resultSet.next()){
                Integer divisionId = resultSet.getInt(1);
                String divisionName = resultSet.getString(2);
                division = new Division(divisionId, divisionName);
                divisionList.add(division);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally {
            try {
                preparedStatement.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        return divisionList;
    }
}
