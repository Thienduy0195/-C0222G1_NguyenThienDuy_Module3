<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 6/3/2022
  Time: 8:23 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>CUSTOMER MANAGEMENT</title>
    <link rel="stylesheet" href="bootstrap413/css/bootstrap.min.css" />
    <link rel="stylesheet" href="datatables/css/dataTables.bootstrap4.min.css" />
<%--    <link rel="stylesheet" href="bootstrap\bootstrap\css\bootstrap.min.css">--%>
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
            <form class="form-inline my-2 my-lg-0" action="/customer" method="get">
                <input type="hidden" name="action" value="search">
                <input class="form-control mr-sm-2" placeholder="Enter customer's name" type="text"
                       name="customerName">
                <button class="btn btn-light my-2 my-sm-0" type="submit">Search</button>
            </form>
        </div>
    </nav>


    <div align="center">
        <table class="table table-striped " id="tableCustomer" style="border-color: #a71d2a; margin: 0; background-color: white">
            <thead class="thead-dark">
            <tr>
                <th>ID</th>
                <th>Type</th>
                <th>Name</th>
                <th>Birth Day</th>
                <th>Gender</th>
                <th>Id Card</th>
                <th>Phone Number</th>
                <th>Email</th>
                <th>Address</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="customer" items="${customerList}">
                <tr>
                    <td><c:out value="${customer.customerId}"/></td>
                    <td>
                            ${customerTypeMap.get(customer.customerType)}
                    </td>
                    <td><c:out value="${customer.customerName}"/></td>
                    <td><c:out value="${customer.customerBirthDay}"/></td>
                    <td>
                            ${customerGenderMap.get(customer.customerGender)}
                    </td>
                    <td><c:out value="${customer.customerIdCard}"/></td>
                    <td><c:out value="${customer.customerPhone}"/></td>
                    <td><c:out value="${customer.customerEmail}"/></td>
                    <td><c:out value="${customer.customerAddress}"/></td>
                    <td>
                        <a href="/customer?action=edit&id=${customer.customerId}" target="_blank">
                            <button style="padding: 3px 6px" type="button" class="btn btn-primary">
                                Edit
                            </button>
                        </a>
                        <button type="button" class="btn btn-danger"
                                data-toggle="modal" data-target="#exampleModalCenter"
                                onclick="infoDelete(
                                    <%--                                    <c:out value='${customer.customerId}'/>,--%>
                                    <c:out value='\"${customer.customerId}\"'/>,
                                    <c:out value='\"${customer.customerName}\"'/>,
                                    <c:out value='\"${customer.customerEmail}\"'/>
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
                    <form action="/customer" method="post">
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
    </div>
    <%-- Create New --%>
    <a href="/customer?action=create" target="_blank">
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
    function infoDelete(customerId, customerName, customerEmail) {
        document.getElementById("id_delete").value = customerId;
        document.getElementById("name_delete").innerText = "Do you want to delete " + customerName + "?";
        document.getElementById("email_delete").innerText = "Email: " + customerEmail;
    }
</script>
<script>
    $(document).ready(function () {
        $('#tableCustomer').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 8
        });
    });
</script>