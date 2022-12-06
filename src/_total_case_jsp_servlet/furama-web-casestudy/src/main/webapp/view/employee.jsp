<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 6/5/2022
  Time: 10:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>EMPLOYEE MANAGEMENT</title>
    <link rel="stylesheet" href="bootstrap413/css/bootstrap.min.css" />
    <link rel="stylesheet" href="datatables/css/dataTables.bootstrap4.min.css" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>

<div class="container-fluid border col-12 " style="width: 100%; padding: 0 0; background-color: #dae0e5">
    <nav class="navbar navbar-expand-lg p-2 my-0 col ">
        <div class="navbar-collapse offcanvas-collapse" id="navbarsExampleDefault">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link text-black-50" href="/">Home <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-black-50" href="/employee">Employee</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-black-50" href="/customer">Customer</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-black-50" href="/service">Service</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-black-50" href="#">Contract</a>
                </li>
            </ul>
            <form class="form-inline my-2 my-lg-0" action="/employee" method="get">
                <select style="margin: 0 0.5em" name="employeePositionSearch" id="">
                    <c:forEach items="${positionList}" var="position">
                        <option value="${position.positionId}">
                                ${position.positionName}
                        </option>
                    </c:forEach>
                    <option value="0" spellcheck="false">Choose Position</option>
                </select>
                <input type="hidden" name="action" value="search">
                <input class="form-control mr-sm-2" placeholder="Enter employee's name" type="text"
                       name="employeeName">
                <button class="btn btn-dark my-2 my-sm-0" type="submit">Search</button>
            </form>
        </div>
    </nav>


    <div align="center">
        <table class="table table-striped " id="tableEmployee" style="border-color: #a71d2a; margin: 0; background-color: white">
            <thead class="thead-dark">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Birth Day</th>
                <th>Id Card</th>
                <th>Salary</th>
                <th>Phone Number</th>
                <th>Email</th>
                <th>Address</th>
                <th>Position</th>
                <%--                <th>Degree</th>--%>
                <%--                <th>Division</th>--%>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="employee" items="${employeeList}">
                <tr>
                    <td>${employee.employeeId}</td>
                    <td>${employee.employeeName}</td>
                    <td>${employee.employeeBirthday}</td>
                    <td>${employee.employeeIdCard}</td>
                    <td>${employee.employeeSalary}</td>
                    <td>${employee.employeePhoneNumber}</td>
                    <td>${employee.employeeEmail}</td>
                    <td>${employee.employeeAddress}</td>
                    <td>
                        <c:forEach var="position" items="${positionList}">
                            <c:if test="${employee.employeePositionId==position.positionId}">${position.positionName}</c:if>
                        </c:forEach>
                    </td>
                        <%--                    <td>--%>
                        <%--                        <c:forEach var="degree" items="${degreeList}">--%>
                        <%--                            <c:if test="${employee.employeeDegreeId==degree.degreeId}">${degree.degreeName}</c:if>--%>
                        <%--                        </c:forEach>--%>
                        <%--                    </td>--%>
                        <%--                    <td>--%>
                        <%--                        <c:forEach var="division" items="${divisionList}">--%>
                        <%--                            <c:if test="${employee.employeeDivisionId==division.divisionId}">${division.divisionName}</c:if>--%>
                        <%--                        </c:forEach>--%>
                        <%--                    </td>--%>
                    <td>
                        <a href="/employee?action=edit&id=${employee.employeeId}">
                            <button type="button" class="btn btn-primary">
                                Edit
                            </button>
                        </a>
                        <button type="button" class="btn btn-danger"
                                data-toggle="modal" data-target="#exampleModalCenter"
                                onclick="infoDelete(
                                    <c:out value='\"${employee.employeeId}\"'/>,
                                    <c:out value='\"${employee.employeeName}\"'/>,
                                    <c:out value='\"${employee.employeeEmail}\"'/>
                                        )">
                            Delete
                        </button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

        <%--       Delete Modal--%>
        <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog"
             aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle">Confirm Delete?</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form action="/employee" method="post">
                        <div class="modal-body">
                            <input type="hidden" name="action" value="delete">
                            <input type="hidden" id="id_delete" name="id">
                            <div id="name_delete"></div>
                            <div id="email_delete"></div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">NO</button>
                            <button type="submit" class="btn btn-danger">YES</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <%-- Create New --%>
        <a href="/employee?action=create" target="_blank">
            <button type="button" class="btn btn-primary">Create New</button>
        </a>
        <p style="font-size: 2em">${mess}</p>

        <script src="jquery/jquery-3.5.1.min.js"></script>
        <script src="datatables/js/jquery.dataTables.min.js"></script>
        <script src="datatables/js/dataTables.bootstrap4.min.js"></script>
        <script src="bootstrap\bootstrap\js\bootstrap.min.js"></script>
</body>
</html>
<script>
    function infoDelete(id, name, mail) {
        document.getElementById("id_delete").value = id;
        document.getElementById("name_delete").innerHTML = "Do you want to delete <b style='color: blue'>" +name+ "</b>?";
        document.getElementById("email_delete").innerText = "Email: " + mail;
    }
</script>
<script>
    $(document).ready(function() {
        $('#tableEmployee').dataTable( {
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 8
        } );
    } );
</script>
