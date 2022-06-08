package furama.controllers;

import furama.models.facility.RentType;
import furama.models.facility.Service;
import furama.models.facility.ServiceType;
import furama.models.person.customer.Customer;
import furama.services.IServiceService;
import furama.services.impl.ServiceOfService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "ServiceServlet", urlPatterns = "/service")
public class ServiceServlet extends HttpServlet {
    IServiceService serviceOfService = new ServiceOfService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createService(request, response);
                break;
            case "delete":
                deleteService(request, response);
                break;
            default:
                showCreateForm(request, response);
        }
    }

    private void deleteService(HttpServletRequest request, HttpServletResponse response) {
        String serviceId = request.getParameter("id");
        try{
            serviceOfService.deleteService(serviceId);
            List<Service> serviceList = serviceOfService.selectAllService();
            List<RentType> rentTypeList = serviceOfService.getRentType();
            List<ServiceType> serviceTypeList = serviceOfService.getServiceType();
            request.setAttribute("serviceList", serviceList);
            request.setAttribute("rentTypeList", rentTypeList);
            request.setAttribute("serviceTypeList", serviceTypeList);
            request.getRequestDispatcher("view/service.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    private void createService(HttpServletRequest request, HttpServletResponse response) {

        String serviceId = request.getParameter("serviceId");
        String serviceName = request.getParameter("serviceName");

        Integer serviceArea = null;
        try {
            serviceArea = Integer.valueOf(request.getParameter("serviceArea"));
        } catch (NumberFormatException e) {
            e.getStackTrace();
        }

        Double serviceCost = null;
        try {
            serviceCost = Double.valueOf(request.getParameter("serviceCost"));
        } catch (NumberFormatException e) {
            e.getStackTrace();
        }

        Integer serviceMaxPeople = null;
        try {
            serviceMaxPeople = Integer.valueOf(request.getParameter("serviceMaxPeople"));
        } catch (NumberFormatException e) {
            e.getStackTrace();
        }

        Integer rentTypeId = Integer.parseInt(request.getParameter("rentTypeId"));
        Integer serviceTypeId = Integer.parseInt(request.getParameter("serviceTypeId"));
        String standardRoom = request.getParameter("standardRoom");
        String descriptionOtherConvenience = request.getParameter("descriptionOtherConvenience");

        Double poolArea = 0.0;
        try {
            poolArea = Double.parseDouble(request.getParameter("poolArea"));
        } catch (NumberFormatException e) {
            e.getStackTrace();
        }

        Integer numberOfFloor = null;
        try {
            numberOfFloor = Integer.valueOf(request.getParameter("numberOfFloor"));
        } catch (NumberFormatException e) {
            e.getStackTrace();
        }

        Service service = new Service(serviceId, serviceName, serviceArea, serviceCost, serviceMaxPeople,
                rentTypeId, serviceTypeId, standardRoom, descriptionOtherConvenience, poolArea, numberOfFloor);
        Map<String, String> map = serviceOfService.saveService(service);
        if (map.isEmpty()) {
            try {
                response.sendRedirect("/service");
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else {
            List<ServiceType> serviceTypeList = serviceOfService.getServiceType();
            request.setAttribute("serviceTypeList", serviceTypeList);
            List<RentType> rentTypeList = serviceOfService.getRentType();
            request.setAttribute("rentTypeList", rentTypeList);
            request.setAttribute("service", service);
            request.setAttribute("error", map);
            try {
                request.getRequestDispatcher("view/create-service.jsp").forward(request, response);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) {
        List<ServiceType> serviceTypeList = serviceOfService.getServiceType();
        request.setAttribute("serviceTypeList", serviceTypeList);
        List<RentType> rentTypeList = serviceOfService.getRentType();
        request.setAttribute("rentTypeList", rentTypeList);
        try {
            request.getRequestDispatcher("view/create-service.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
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
            case "search":
                searchService(request,response);
                break;
            default:
                showListService(request, response);
        }
    }

    private void searchService(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("serviceName");
        String searchName = name.replaceAll(" ","");
        List<Service> serviceList = serviceOfService.searchService(searchName);
        String mess="";
        if (serviceList.isEmpty()){
            mess = "Not found the searching name!";
        }
        List<ServiceType> serviceTypeList = serviceOfService.getServiceType();
        List<RentType> rentTypeList = serviceOfService.getRentType();
        request.setAttribute("serviceList", serviceList);
        request.setAttribute("serviceTypeList", serviceTypeList);
        request.setAttribute("rentTypeList", rentTypeList);
        request.setAttribute("mess", mess);
        try {
            request.getRequestDispatcher("view/service.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showListService(HttpServletRequest request, HttpServletResponse response) {
        List<Service> serviceList = serviceOfService.selectAllService();
        List<ServiceType> serviceTypeList = serviceOfService.getServiceType();
        List<RentType> rentTypeList = serviceOfService.getRentType();
        request.setAttribute("serviceList", serviceList);
        request.setAttribute("serviceTypeList", serviceTypeList);
        request.setAttribute("rentTypeList", rentTypeList);
        try {
            request.getRequestDispatcher("view/service.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
