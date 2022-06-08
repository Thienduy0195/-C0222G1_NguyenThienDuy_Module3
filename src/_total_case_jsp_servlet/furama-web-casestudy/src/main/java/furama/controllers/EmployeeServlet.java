package furama.controllers;

import furama.models.person.employee.Degree;
import furama.models.person.employee.Division;
import furama.models.person.employee.Employee;
import furama.models.person.employee.Position;
import furama.services.IEmployeeService;
import furama.services.impl.EmployeeService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sound.midi.MidiDevice;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@WebServlet(name = "EmployeeServlet", urlPatterns = "/employee")
public class EmployeeServlet extends HttpServlet {
    IEmployeeService employeeService = new EmployeeService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createEmployee(request, response);
                break;
            case "edit":
                try {
                    editEmployee(request, response);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                break;
            case "delete":
                try {
                    deleteEmployee(request, response);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                break;
            default:
                showListEmployee(request, response);
        }
    }

    private void createEmployee(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        Integer employeeId = null;
        String employeeName = request.getParameter("employeeName");
        String employeeBirthday = request.getParameter("employeeBirthday");
        String employeeIdCard = request.getParameter("employeeIdCard");
        Double employeeSalary = -1.0;
        try {
            employeeSalary = Double.valueOf(request.getParameter("employeeSalary"));
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }
        String employeePhoneNumber = request.getParameter("employeePhoneNumber");
        String employeeEmail = request.getParameter("employeeEmail");
        String employeeAddress = request.getParameter("employeeAddress");
        Integer employeePositionId = Integer.parseInt(request.getParameter("employeePositionId"));
        Integer employeeDegreeId = Integer.parseInt(request.getParameter("employeeDegreeId"));
        Integer employeeDivisionId = Integer.parseInt(request.getParameter("employeeDivisionId"));
        Employee employee = new Employee(employeeId, employeeName, employeeBirthday, employeeIdCard, employeeSalary,
                employeePhoneNumber, employeeEmail, employeeAddress, employeePositionId, employeeDegreeId, employeeDivisionId, employeeEmail);
        Map<String, String> createMap = employeeService.saveEmployee(employee);
        if (createMap.isEmpty()) {
            response.sendRedirect("/employee");
        } else {
            List<Position> positionList = employeeService.getPosition();
            List<Degree> degreeList = employeeService.getDegree();
            List<Division> divisionList = employeeService.getDivision();
            request.setAttribute("employee", employee);
            request.setAttribute("positionList", positionList);
            request.setAttribute("degreeList", degreeList);
            request.setAttribute("divisionList", divisionList);
            request.setAttribute("error", createMap);
            request.getRequestDispatcher("view/create-employee.jsp").forward(request, response);
        }
    }

    private void deleteEmployee(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
        String employeeId = request.getParameter("id");
        employeeService.deleteEmployee(employeeId);
        response.sendRedirect("/employee");
    }

    private void editEmployee(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException, SQLException {
        Integer employeeId = Integer.valueOf(request.getParameter("id"));
        String employeeName = request.getParameter("employeeName");
        String employeeBirthday = request.getParameter("employeeBirthday");
        String employeeIdCard = request.getParameter("employeeIdCard");
        Double employeeSalary = -1.0;
        try {
            employeeSalary = Double.valueOf(request.getParameter("employeeSalary"));
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }
        String employeePhoneNumber = request.getParameter("employeePhoneNumber");
        String employeeEmail = request.getParameter("employeeEmail");
        String employeeAddress = request.getParameter("employeeAddress");
        Integer employeePositionId = Integer.valueOf(request.getParameter("employeePositionId"));

        Integer employeeDegreeId = Integer.valueOf(request.getParameter("employeeDegreeId"));

        Integer employeeDivisionId = Integer.valueOf(request.getParameter("employeeDivisionId"));

        String userName = request.getParameter("userName");
        Employee employee = new Employee(employeeId, employeeName, employeeBirthday, employeeIdCard, employeeSalary, employeePhoneNumber, employeeEmail, employeeAddress, employeePositionId, employeeDegreeId  , employeeDivisionId, userName);
        Map<String, String> map;
        if (employee != null) {
            map = employeeService.updateEmployee(employee);
            if (map.isEmpty()) {
                response.sendRedirect("/employee");
            } else {
                List<Degree> degreeList = employeeService.getDegree();
                List<Position> positionList = employeeService.getPosition();
                List<Division> divisionList = employeeService.getDivision();
                request.setAttribute("employee", employee);
                request.setAttribute("message", "Update failed!");
                request.setAttribute("positionList", positionList);
                request.setAttribute("degreeList", degreeList);
                request.setAttribute("divisionList", divisionList);
                request.setAttribute("error", map);
                request.getRequestDispatcher("view/edit-employee.jsp").forward(request, response);
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showCreateForm(request, response);
                break;
            case "edit":
                showEditForm(request,response);
                break;
            case "search":
                searchEmployee(request, response);
                break;
            default:
                showListEmployee(request, response);
        }
    }


    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        Employee employee = employeeService.selectEmployee(id);
        List<Degree> degreeList = employeeService.getDegree();
        List<Position> positionList = employeeService.getPosition();
        List<Division> divisionList = employeeService.getDivision();
        request.setAttribute("positionList", positionList);
        request.setAttribute("degreeList", degreeList);
        request.setAttribute("divisionList", divisionList);
        request.setAttribute("employee",employee);
        request.getRequestDispatcher("view/edit-employee.jsp").forward(request,response);
    }

    private void searchEmployee(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("employeeName");
        String searchName = name.replaceAll(" ","");
        Integer positionId = Integer.parseInt(request.getParameter("employeePositionSearch"));
        List<Employee> employeeList = new ArrayList<>();
        if(positionId==0){
            employeeList = employeeService.searchEmployee(searchName);
        }else {
            employeeList=employeeService.searchWithPositionId(positionId, searchName);
        }
        String mess="";
        if (employeeList.isEmpty()){
            mess = "Not found the searching name!";
        }
        List<Position> positionList = employeeService.getPosition();
        List<Degree> degreeList = employeeService.getDegree();
        List<Division> divisionList = employeeService.getDivision();
        request.setAttribute("employeeList", employeeList);
        request.setAttribute("positionList", positionList);
        request.setAttribute("degreeList", degreeList);
        request.setAttribute("divisionList", divisionList);
        request.setAttribute("mess", mess);
        try {
            request.getRequestDispatcher("view/employee.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Position> positionList = employeeService.getPosition();
        List<Degree> degreeList = employeeService.getDegree();
        List<Division> divisionList = employeeService.getDivision();
        request.setAttribute("positionList", positionList);
        request.setAttribute("degreeList", degreeList);
        request.setAttribute("divisionList", divisionList);
        request.getRequestDispatcher("view/create-employee.jsp").forward(request, response);
    }


    private void showListEmployee(HttpServletRequest request, HttpServletResponse response) {
        List<Employee> employeeList = new ArrayList<>();
        employeeList = employeeService.selectAllEmployee();
        List<Position> positionList = employeeService.getPosition();
        List<Degree> degreeList = employeeService.getDegree();
        List<Division> divisionList = employeeService.getDivision();
        request.setAttribute("employeeList", employeeList);
        request.setAttribute("positionList", positionList);
        request.setAttribute("degreeList", degreeList);
        request.setAttribute("divisionList", divisionList);
        try {
            request.getRequestDispatcher("view/employee.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
