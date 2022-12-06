package excercise.controllers;

import excercise.models.DocumentPatient;
import excercise.models.Patient;
import excercise.services.DocumentService;
import excercise.services.PatientService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@WebServlet(name = "PatientServlet", urlPatterns = "/document")
public class DocumentPatientServlet extends HttpServlet {

    DocumentService documentService = new DocumentService();
    PatientService patientService = new PatientService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                break;
            case "edit":
                editDocument(request, response);
                break;
            case "delete":
                deleteDocument(request, response);
                break;
        }
    }

    private void deleteDocument(HttpServletRequest request, HttpServletResponse response) {
        String documentId = request.getParameter("id");
        try {
            documentService.delete(documentId);
            response.sendRedirect("/document");
        } catch (SQLException | IOException throwables) {
            throwables.printStackTrace();
        }

    }

    private void editDocument(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String documentId = request.getParameter("documentId");
        String patientId = request.getParameter("patientId");
        String patientIdUpdate = patientId.replaceAll(" ", "");
        String checkinDay = request.getParameter("checkinDay");
        String checkoutDay = request.getParameter("checkoutDay");
        String checkinReason = request.getParameter("checkinReason");
        DocumentPatient document = new DocumentPatient(documentId, patientIdUpdate, checkinDay, checkoutDay, checkinReason);
        String patientName = request.getParameter("patientName");
        Patient updatePatient = new Patient(patientIdUpdate, patientName);
        Map<String, String> map = null;
        Map<String, String> patientMap = null;
        try {
            map = documentService.update(document);
            patientMap=patientService.update(updatePatient);
            if (map.isEmpty()&& patientMap.isEmpty()) {
                List<DocumentPatient> documentList = new ArrayList<>();
                documentList = documentService.selectAllDocument();
                List<Patient> patientList = patientService.selectAllPatient();
                request.setAttribute("documentList", documentList);
                request.setAttribute("patientList", patientList);
                request.setAttribute("message", "Successfully Updated!!");
                request.getRequestDispatcher("list-document.jsp").forward(request, response);
            } else {
                request.setAttribute("document", document);
                request.setAttribute("patient", updatePatient);
                request.setAttribute("message", "Update failed!");
                request.setAttribute("error", map);
                request.setAttribute("patientNameError", patientMap);
                try {
                    request.getRequestDispatcher("edit.jsp").forward(request, response);
                } catch (ServletException e) {
                    e.printStackTrace();
                }
            }
        } catch (SQLException | IOException | ServletException throwables) {
            throwables.printStackTrace();
        }

    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
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
        List<DocumentPatient> documentList = new ArrayList<>();
        documentList = documentService.selectAllDocument();
        List<Patient> patientList = patientService.selectAllPatient();
        request.setAttribute("documentList", documentList);
        request.setAttribute("patientList", patientList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("list-document.jsp");
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
        String idName = request.getParameter("idName");

        DocumentPatient document = documentService.select(documentId);

        List<Patient> patientList = patientService.selectAllPatient();
        Patient patient = null;
        for (Patient item : patientList) {
            if (item.getPatientId().equals(idName)) {
                patient = item;
            }
        }
        request.setAttribute("document", document);
        request.setAttribute("patientList", patientList);
        request.setAttribute("patient", patient);
        try {
            request.getRequestDispatcher("edit.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
