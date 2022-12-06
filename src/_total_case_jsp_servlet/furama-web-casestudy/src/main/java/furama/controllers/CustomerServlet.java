package furama.controllers;

import furama.models.person.customer.Customer;
import furama.models.person.customer.CustomerType;
import furama.services.impl.CustomerService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "CustomerServlet", urlPatterns = "/customer")
public class CustomerServlet extends HttpServlet {
    CustomerService customerService = new CustomerService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createCustomer(request, response);
                break;
            case "edit":
                editCustomer(request, response);
                break;
            case "delete":
                deleteCustomer(request, response);
                break;
        }
    }

    private void createCustomer(HttpServletRequest request, HttpServletResponse response) {
        Map<String, String> createMap = new HashMap<>();
        Customer customer = null;
        String customerID = request.getParameter("customerId");
        customer = customerService.selectCustomer(customerID);
        if(customer!=null){
            String message = "Customer id is exist!!";
            List<CustomerType> customerTypeList = customerService.getCustomerType();
            request.setAttribute("customerTypeList", customerTypeList);
            request.setAttribute("message", message);
            request.setAttribute("customer", customer);
            try {
                request.getRequestDispatcher("view/create-customer.jsp").forward(request, response);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }else {
            Integer customerType = Integer.parseInt(request.getParameter("customerType"));
            String customerName = request.getParameter("customerName");
            String customerBirthday = request.getParameter("customerBirthday");
            Integer customerGender = Integer.parseInt(request.getParameter("customerGender"));
            String customerIdCard = request.getParameter("customerIdCard");
            String customerPhone = request.getParameter("customerPhone");
            String customerEmail = request.getParameter("customerEmail");
            String customerAddress = request.getParameter("customerAddress");
            customer = new Customer(customerID, customerType, customerName,
                    customerBirthday, customerGender, customerIdCard,
                    customerPhone, customerEmail, customerAddress);
            createMap = customerService.saveCustomer(customer);
            if (createMap.isEmpty()) {
                try {
                    response.sendRedirect("/customer");
                } catch (IOException e) {
                    e.printStackTrace();
                }
            } else {
                List<CustomerType> customerTypeList = customerService.getCustomerType();
                request.setAttribute("customerTypeList", customerTypeList);
                request.setAttribute("customer", customer);
                request.setAttribute("error", createMap);
                try {
                    request.getRequestDispatcher("view/create-customer.jsp").forward(request, response);
                } catch (ServletException e) {
                    e.printStackTrace();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }

    }

    private void editCustomer(HttpServletRequest request, HttpServletResponse response) {
        Integer customerType = Integer.parseInt(request.getParameter("customerType"));
        String customerName = request.getParameter("customerName");
        String customerBirthDay = request.getParameter("customerBirthDay");
        String gender =request.getParameter("customerGender");
        Integer customerGender;
        if (gender.equals("")){
            customerGender=null;
        }else {
            customerGender=Integer.parseInt(gender);
        }
        String customerIdCard = request.getParameter("customerIdCard");
        String customerPhone = request.getParameter("customerPhone");
        String customerEmail = request.getParameter("customerEmail");
        String customerAddress = request.getParameter("customerAddress");
        String customerId = request.getParameter("id");
        Customer customer = customerService.selectCustomer(customerId);
        Map<String, String> map;
        if (customer != null) {
            customer.setCustomerType(customerType);
            customer.setCustomerName(customerName);
            customer.setCustomerBirthDay(customerBirthDay);
            customer.setCustomerGender(customerGender);
            customer.setCustomerIdCard(customerIdCard);
            customer.setCustomerPhone(customerPhone);
            customer.setCustomerEmail(customerEmail);
            customer.setCustomerAddress(customerAddress);
            try {
                map = customerService.updateCustomer(customer);
                if (map.isEmpty()) {
                    response.sendRedirect("/customer");
                } else {
                    List<CustomerType> customerTypeList = customerService.getCustomerType();
                    request.setAttribute("customer", customer);
                    request.setAttribute("customerTypeList", customerTypeList);
                    request.setAttribute("message", "Update failed!");
                    request.setAttribute("error", map);
                    try {
                        request.getRequestDispatcher("view/edit-customer.jsp").forward(request, response);
                    } catch (ServletException e) {
                        e.printStackTrace();
                    }
                }
            } catch (SQLException | IOException throwables) {
                throwables.printStackTrace();
            }
        }
    }

    private void deleteCustomer(HttpServletRequest request, HttpServletResponse response) {
        String customerId = request.getParameter("id");
        try{
            customerService.deleteCustomer(customerId);
            List<Customer> customerList = customerService.selectAllCustomer();
            Map<Integer, String> customerTypeMap = customerService.getType();
            Map<Integer, String> customerGenderMap = customerService.getGender();
            request.setAttribute("customerList", customerList);
            request.setAttribute("customerTypeMap", customerTypeMap);
            request.setAttribute("customerGenderMap", customerGenderMap);
            request.getRequestDispatcher("view/customer.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showCreateForm(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "delete":
                break;
            case "search":
                searchUser(request, response);
                break;
            default:
                showList(request, response);
        }
    }

    private void showList(HttpServletRequest request, HttpServletResponse response) {
        List<Customer> customerList = new ArrayList<>();
//        List<CustomerType> customerTypeList = new ArrayList<>();
        customerList = customerService.selectAllCustomer();
        Map<Integer, String> customerTypeMap = customerService.getType();
        Map<Integer, String> customerGenderMap = customerService.getGender();
//        customerTypeList = customerService.getCustomerType();
        request.setAttribute("customerList", customerList);
        request.setAttribute("customerTypeMap", customerTypeMap);
        request.setAttribute("customerGenderMap", customerGenderMap);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/customer.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void searchUser(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("customerName");
        String searchName = name.replaceAll(" ","");
        List<Customer> customerList = customerService.searchCustomer(searchName);
        String mess="";
        if (customerList.isEmpty()){
            mess = "Not found the searching name!";
        }
        Map<Integer, String> customerTypeMap = customerService.getType();
        Map<Integer, String> customerGenderMap = customerService.getGender();
        request.setAttribute("customerList", customerList);
        request.setAttribute("customerTypeMap", customerTypeMap);
        request.setAttribute("customerGenderMap", customerGenderMap);
        request.setAttribute("mess", mess);
        try {
            request.getRequestDispatcher("view/customer.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) {
        String customerId = request.getParameter("id");
        Customer customer = customerService.selectCustomer(customerId);
//        if (customer==null){
//            request
//        }
        List<CustomerType> customerTypeList = customerService.getCustomerType();
//        Map<Integer, String> customerTypeMap = customerService.getType();
        Map<Integer, String> customerGenderMap = customerService.getGender();
        request.setAttribute("customer", customer);
        request.setAttribute("customerTypeList", customerTypeList);
        request.setAttribute("customerGenderMap", customerGenderMap);
        try {
            request.getRequestDispatcher("view/edit-customer.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) {
        try {
            List<CustomerType> customerTypeList = customerService.getCustomerType();
            request.setAttribute("customerTypeList", customerTypeList);
            request.getRequestDispatcher("view/create-customer.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
