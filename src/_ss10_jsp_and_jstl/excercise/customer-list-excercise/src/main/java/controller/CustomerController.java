package controller;

import model.Customer;

import javax.servlet.annotation.WebServlet;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerController", urlPatterns = "/customer")
public class CustomerController extends javax.servlet.http.HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {

    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        List<Customer> customerList = new ArrayList<>();
        customerList.add(new Customer("Wayne Rooney", "02/05/1985", "Manchester", "https://media.bongda.com.vn/files/f1/2016/05/05/rooney2jpg.jpg?fixImage", 0, 9));
        customerList.add(new Customer(" Cris. Ronaldo", "02/10/1985", "Manchester", "https://photo-cms-plo.zadn.vn/w850/Uploaded/2022/yqjvzdjwp/2022_05_26/manchester-united-ronaldo-3680.jpeg", 0, 10));
        customerList.add(new Customer("Luis Nani", "02/06/1988", "Manchester", "https://cdn-img.thethao247.vn/storage/files/thangmv/2021/12/15/441a12e9-3f57-4a7f-99d7-82f4231ee397-1639534178.jpg", 0, 8));
        customerList.add(new Customer("Luis Katie", "02/08/1990", "Manchester", "https://assets.manutd.com/AssetPicker/images/0/0/12/31/794527/KATIE_ZELEM_medium.jpg", 1, 6.5));
        request.setAttribute("listCustomer", customerList);
        request.getRequestDispatcher("customer-list.jsp").forward(request,response);
    }
}
