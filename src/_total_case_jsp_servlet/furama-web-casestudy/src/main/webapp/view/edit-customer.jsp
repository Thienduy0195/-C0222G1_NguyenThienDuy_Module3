<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 6/6/2022
  Time: 4:05 PM
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
                        <a class="nav-link text-white" href="/contract">Contract</a>
                    </li>
                </ul>
            </div>
        </nav>
    </nav>
</header>
<div class="container-fluid" align="center">
    <div class="col-4" >
        <form class="content-create-form" method="post">
            <p style="color: red">
                ${message}
            </p>
            <div class="form-group">
                <label for="customerId">Customer ID:</label>
                <c:if test="${customer != null}">
                    <input class="border-primary" id="customerId" name="customerId"  value="${customer.customerId}" readonly/>
                </c:if>
            </div>
            <div class="form-group">
                <label for="customerTypeId">Choose Customer type:</label>
                <select id="customerTypeId" name="customerType" class="form-control border-primary">
                    <c:forEach items="${customerTypeList}" var="customerType">
                        <option value="${customerType.customerTypeId}">
                                ${customerType.customerType}
                        </option>
                    </c:forEach>
                </select>
                <p style="color:red">${error.get("type")}</p>
            </div>
            <div class="form-group">
                <label for="customerName">Customer Name:</label>
                <input type="text" class="form-control" id="customerName"
                       name="customerName" value="${customer.customerName}">
                <p style="color:red">${error.get("name")}</p>
            </div>
            <div class="form-group">
                <label for="birthday">Customer Birthday:</label>
                <input id="birthday" type="date" name="customerBirthDay" size="45"
                       value="${customer.customerBirthDay}"
                />
            </div>
            <div class="form-group">
                <label for="customerGender">Choose Customer Gender:</label>
                <div id="customerGender">
                    <input class="radio" type="radio" name="customerGender" value="0" checked>Male
                    <input class="radio"  type="radio" name="customerGender" value="1">Female
                    <input class="radio"  type="radio" name="customerGender" value="${null}">Other
                </div>
            </div>
            <div class="form-group">
                <label for="customerIdCard">Customer ID Card:</label>
                <input type="text" class="form-control" id="customerIdCard" name="customerIdCard"
                       value="${customer.customerIdCard}">
                <p style="color:red">${error.get("idCard")}</p>
            </div>
            <div class="form-group">
                <label for="customerPhone">Customer Phone Number:</label>
                <input type="text" class="form-control" id="customerPhone" name="customerPhone"
                       value="${customer.customerPhone}">
                <p style="color:red">${error.get("phone")}</p>
            </div>
            <div class="form-group">
                <label for="customerEmail">Customer Email:</label>
                <input type="text" class="form-control" id="customerEmail" name="customerEmail"
                       value="${customer.customerEmail}">
                <p style="color:red">${error.get("email")}</p>
            </div>
            <div class="form-group">
                <label for="customerAddress">Customer Address:</label>
                <input type="text" class="form-control" id="customerAddress" name="customerAddress"
                       value="${customer.customerAddress}">
            </div>
            <%--        <div class="form-group form-check">--%>
            <%--            <input type="checkbox" class="form-check-input" id="exampleCheck1">--%>
            <%--            <label class="form-check-label" for="exampleCheck1">Check me out</label>--%>
            <%--        </div>--%>
            <span><button type="submit" class="btn btn-primary">SAVE</button></span>
            <span><a href="/customer" class="btn btn-danger"><< BACK</a></span>
        </form>
    </div>
</div>

</body>
</html>
