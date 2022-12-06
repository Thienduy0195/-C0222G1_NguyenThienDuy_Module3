package excercise.controllers;

import excercise.models.Document;
import excercise.models.Patient;
import excercise.services.DocumentService;
import excercise.services.IDocumentService;
import excercise.services.IPatientService;
import excercise.services.PatientService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "DocumentServlet", urlPatterns = "/")
public class DocumentServlet extends HttpServlet {
    IDocumentService documentService = new DocumentService();
    IPatientService patientService = new PatientService();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
//                createCustomer(request, response);
                break;
            case "edit":
//                editCustomer(request, response);
                break;
            case "delete":
//                deleteCustomer(request, response);
                break;
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
//                showCreateForm(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "delete":
                break;
            case "search":
//                searchUser(request, response);
                break;
            default:
                showList(request, response);
        }
    }

    private void showList(HttpServletRequest request, HttpServletResponse response) {
        List<Document> documentList = new ArrayList<>();
        documentList = documentService.selectAllDocument();
        List<Patient> patientList = patientService.selectAllPatient();

        request.setAttribute("documentList", documentList);
        request.setAttribute("patientList", patientList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) {
        String documentId = request.getParameter("id");
        Document document = documentService.select(documentId);

        List<Patient> patientList = patientService.selectAllPatient();

        request.setAttribute("document", document);
        request.setAttribute("patientList", patientList);
        try {
            request.getRequestDispatcher("view/edit.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
