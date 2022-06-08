<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 6/3/2022
  Time: 8:44 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>CREATE NEW EMPLOYEE</title>
    <link rel="stylesheet" href="bootstrap\bootstrap\css\bootstrap.min.css">
    <link rel="stylesheet" href="bootstrap\bootstrap\css\style_create.css">
    <style>
        body{
            background-image: url('/img/background-create.jpg');
        }
    </style>
</head>
<body>
<header>
    <nav>
        <nav class="navbar navbar-expand-lg p-2 my-0 col " style="background: #d6d8db">
            <div class="navbar-collapse offcanvas-collapse" id="navbarsExampleDefault">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link text-white" href="/">Home <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-white" href="/employee">Employee</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-white" href="/customer">Customer</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-white" href="/service">Service</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-white" href="#">Contract</a>
                    </li>
                </ul>
            </div>
        </nav>
    </nav>
</header>
<div class="container-fluid" align="center">
    <%--<p>--%>
    <%--    <c:if test='${requestScope["message"] != null}'>--%>
    <%--        <span class="message">${requestScope["message"]}</span>--%>
    <%--    </c:if>--%>
    <%--</p>--%>
    <div class="col-4" >
        <form class="content-create-form" method="post">
            <div class="form-group">
                <label for="employeeName">Enter Employee Name:</label>
                <input type="text" class="form-control" id="employeeName"
                       name="employeeName" placeholder="(required)" value="${employee.employeeName}">
                <p style="color:red">${error.get("name")}</p>
            </div>
            <div class="form-group">
                <label for="employeeBirthday">Enter Employee Birthday:</label>
                <input type="date" class="form-control" id="employeeBirthday" name="employeeBirthday" value="${employee.employeeBirthday}">
            </div>
            <div class="form-group">
                <label for="employeeIdCard">Enter Employee ID Card:</label>
                <input type="text" class="form-control" id="employeeIdCard" name="employeeIdCard"
                       placeholder="9 characters (0-9)" value="${employee.employeeIdCard}">
                <p style="color:red">${error.get("idCard")}</p>
            </div>
            <div class="form-group">
                <label for="employeeSalary">Enter Employee Salary:</label>
                <input type="text" class="form-control" id="employeeSalary" name="employeeSalary"
                       placeholder="Please enter the salary" value="${employee.employeeSalary}">
                <p style="color:red">${error.get("salary")}</p>
                <%--            <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>--%>
            </div>
            <div class="form-group">
                <label for="employeePhoneNumber">Enter Employee Phone Number:</label>
                <input type="text" class="form-control" id="employeePhoneNumber" name="employeePhoneNumber"
                       placeholder="(84)+9xxxxxxxx" value="${employee.employeePhoneNumber}">
                <p style="color:red">${error.get("phone")}</p>
            </div>
            <div class="form-group">
                <label for="employeeEmail">Enter Employee Email:</label>
                <input type="text" class="form-control" id="employeeEmail" name="employeeEmail"
                       placeholder="example@gmail.com" value="${employee.employeeEmail}">
                <p style="color:red">${error.get("email")}</p>
            </div>
            <div class="form-group">
                <label for="employeeAddress">Enter Employee Address:</label>
                <input type="text" class="form-control" id="employeeAddress" name="employeeAddress"
                       placeholder="(not required)" value="${employee.employeeAddress}">
            </div>
            <div class="form-group">
                <label for="employeePositionId">Choose Employee Position:</label>
                <select id="employeePositionId" name="employeePositionId" class="form-control border-primary">
                    <c:forEach items="${positionList}" var="position">
                        <option value="${position.positionId}">
                                ${position.positionName}
                        </option>
                    </c:forEach>
                </select>
<%--                <p style="color:red">${error.get("type")}</p>--%>
            </div>
            <div class="form-group">
                <label for="employeeDegreeId">Choose Employee Degree:</label>
                <select id="employeeDegreeId" name="employeeDegreeId" class="form-control border-primary">
                    <c:forEach items="${degreeList}" var="degree">
                        <option value="${degree.degreeId}">
                                ${degree.degreeName}
                        </option>
                    </c:forEach>
                </select>
            </div>
            <div class="form-group">
                <label for="employeeDivisionId">Choose Employee Division:</label>
                <select id="employeeDivisionId" name="employeeDivisionId" class="form-control border-primary">
                    <c:forEach items="${divisionList}" var="division">
                        <option value="${division.divisionId}">
                                ${division.divisionName}
                        </option>
                    </c:forEach>
                </select>
            </div>
            <%--        <div class="form-group form-check">--%>
            <%--            <input type="checkbox" class="form-check-input" id="exampleCheck1">--%>
            <%--            <label class="form-check-label" for="exampleCheck1">Check me out</label>--%>
            <%--        </div>--%>
            <span><button type="submit" class="btn btn-primary">SAVE</button></span>
            <span><a href="/employee" class="btn btn-danger"><< BACK</a></span>
        </form>
    </div>
</div>
</body>
</html>
