<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 6/10/2022
  Time: 9:01 AM`
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>EDIT CUSTOMER</title>
    <link rel="stylesheet" href="bootstrap\bootstrap\css\bootstrap.min.css">
    <link rel="stylesheet" href="bootstrap\bootstrap\css\style_create.css">
    <style>
        /*body{*/
        /*    background-image: url('/img/background-create.jpg');*/
        /*}*/
    </style>
</head>
<body>
<header>
    <nav>
        <nav class="navbar navbar-expand-lg p-2 my-0 col " style="background: #d6d8db">
            <div class="navbar-collapse offcanvas-collapse" id="navbarsExampleDefault">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link text-white" href="/document">Home <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-white" href="/">About us</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-white" href="/">History</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-white" href="/">More</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-white" href="/">Read</a>
                    </li>
                </ul>
            </div>
        </nav>
    </nav>
</header>
<div class="container-fluid" align="center">
    <div class="col-4">
        <form class="content-create-form" method="post">
            <p style="color: red">${message}</p>
            <div class="form-group">
                <label for="documentId">Document's code:</label>
                <input type="text" class="form-control" id="documentId"
                       name="documentId" value="${document.documentId}" readonly>
            </div>
            <div class="form-group">
                <label for="patientId">Patient's Code:</label>
                <input id="patientId" type="text" name="patientId" size="45"
                       value="${document.patientId} " readonly
                />
            </div>
            <div class="form-group">
                <label for="patientName">Patient's Name:</label>
                <input id="patientName" type="text" name="patientName" size="45"
                       value="${patient.patientName}"
                />
                <p style="color: red">${patientNameError.get("patientName")}</p>
            </div>
            <div class="form-group">
                <label for="checkinDay">Check in date:</label>
                <input id="checkinDay" type="date" name="checkinDay" size="45"
                       value="${document.checkinDay}"
                />
                                <p style="color:red">${error.get("day")}</p>
            </div>
            <div class="form-group">
                <label for="checkoutDay">Check out date:</label>
                <input id="checkoutDay" type="date" name="checkoutDay" size="45"
                       value="${document.checkoutDay}"
                />
                <p style="color:red">${error.get("day")}</p>
            </div>
            <div class="form-group">
                <label for="checkinReason">Check in reason:</label>
                <input id="checkinReason" type="text" name="checkinReason" size="45"
                       value="${document.checkinReason}"
                />
            </div>
            <span><button type="submit" class="btn btn-primary">SAVE</button></span>
            <span><a href="/document" class="btn btn-danger"><< BACK</a></span>
        </form>
    </div>
</div>

</body>
</html>