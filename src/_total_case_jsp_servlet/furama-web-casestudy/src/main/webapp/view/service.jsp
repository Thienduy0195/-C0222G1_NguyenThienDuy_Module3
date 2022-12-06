<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 6/6/2022
  Time: 3:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>SERVICE MANAGEMENT</title>
    <link rel="stylesheet" href="bootstrap413/css/bootstrap.min.css" />
    <link rel="stylesheet" href="datatables/css/dataTables.bootstrap4.min.css" />
</head>
<body>

<div class="container-fluid border col-12 " style="width: 100%; padding: 0 0; background-color: #dae0e5">
    <nav class="navbar navbar-expand-lg p-2 my-0 col">
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
            <form class="form-inline my-2 my-lg-0" action="/service" method="get">
                <input type="hidden" name="action" value="search">
                <input class="form-control mr-sm-2" placeholder="Enter service's name" type="text"
                       name="serviceName">
                <button class="btn btn-light my-2 my-sm-0" type="submit">Search</button>
            </form>
        </div>
    </nav>


    <div align="center">
        <table class="table table-striped " id="tableService" style="border-color: #a71d2a; margin: 0; background-color: white">
            <thead class="thead-dark">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Area</th>
                <th>Cost</th>
                <th>Max People</th>
                <th>Rent Type</th>
                <th>Service Type</th>
                <th>Room Standard</th>
                <th>Other Convenience</th>
                <th>Pool Area</th>
                <th>Number of floor</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="service" items="${serviceList}">
                <tr>
                    <td>${service.serviceId}</td>
                    <td>${service.serviceName}</td>
                    <td>${service.serviceArea}</td>
                    <td>${service.serviceCost}</td>
                    <td>${service.serviceMaxPeople}</td>
                    <td>
                        <c:forEach var="rentType" items="${rentTypeList}">
                            <c:if test="${service.rentTypeId==rentType.rentTypeId}">${rentType.rentTypeName}</c:if>
                        </c:forEach>
                    </td>
                    <td>
                        <c:forEach var="serviceType" items="${serviceTypeList}">
                            <c:if test="${service.serviceTypeId==serviceType.serviceTypeId}">${serviceType.serviceTypeName}</c:if>
                        </c:forEach>
                    </td>
                    <td>${service.standardRoom}</td>
                    <td>${service.descriptionOtherConvenience}</td>
                    <td>${service.poolArea}</td>
                    <td>${service.numberOfFloor}</td>
                    <td>
                            <%--                        <a href="/service?action=edit&id=${service.serviceId}">--%>
                            <%--                            <button type="button" class="btn btn-primary">--%>
                            <%--                                Edit--%>
                            <%--                            </button>--%>
                            <%--                        </a>--%>
                        <button type="button" class="btn btn-danger"
                                data-toggle="modal" data-target="#exampleModalCenter"
                                onclick="infoDelete(
                                    <%--                                    <c:out value='${customer.customerId}'/>,--%>
                                    <c:out value='\"${service.serviceId}\"'/>,
                                    <c:out value='\"${service.serviceName}\"'/>,
                                        )">
                            Delete
                        </button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

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
                    <form action="/service" method="post">
                        <div class="modal-body">
                            <input type="hidden" name="action" value="delete">
                            <input type="hidden" id="id_delete" name="id">
                            <div id="name_delete"></div>
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
        <a href="/service?action=create" target="_blank">
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
    function infoDelete(id, name) {
        document.getElementById("id_delete").value = id;
        document.getElementById("name_delete").innerText = "Do you want to delete " + name + "?";
    }
</script>
<script>
    $(document).ready(function() {
        $('#tableService').dataTable( {
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 8
        } );
    } );
</script>