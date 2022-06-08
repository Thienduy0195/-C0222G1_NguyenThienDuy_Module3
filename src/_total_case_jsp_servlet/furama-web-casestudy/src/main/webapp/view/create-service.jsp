<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 6/3/2022
  Time: 8:47 AM
  To change this template use File | Settings | File Templates.
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>CREATE NEW SERVICE</title>
    <link rel="stylesheet" href="bootstrap\bootstrap\css\bootstrap.min.css">
    <link rel="stylesheet" href="bootstrap\bootstrap\css\style_create.css">
<%--    <link rel="stylesheet" href="bootstrap\bootstrap\css\style.css">--%>
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
        <div class="col-4">
            <form class="content-create-form" method="post">
                <div class="form-group">
                    <label for="serviceId">Enter Service ID:</label>
                    <input type="text" class="form-control" id="serviceId" name="serviceId"
                           placeholder="DV-XXXX(X:0-9)">
                    <p style="color:red">${error.get("id")}</p>
                    <%--            <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>--%>
                </div>
                <div class="form-group">
                    <label for="serviceName">Enter Service Name:</label>
                    <input type="text" class="form-control" id="serviceName"
                           name="serviceName" placeholder="(required)">
                    <p style="color:red">${error.get("name")}</p>
                </div>
                <div class="form-group">
                    <label for="serviceArea">Enter Service Area:</label>
                    <input type="text" class="form-control" id="serviceArea" name="serviceArea">
                    <p style="color:red">${error.get("area")}</p>
                </div>
                <div class="form-group">
                    <label for="serviceCost">Enter Service Cost:</label>
                    <input type="text" class="form-control" id="serviceCost" name="serviceCost">
                    <p style="color:red">${error.get("cost")}</p>
                </div>
                <div class="form-group">
                    <label for="serviceMaxPeople">Enter Service Max People:</label>
                    <input type="text" class="form-control" id="serviceMaxPeople" name="serviceMaxPeople">
                    <p style="color:red">${error.get("maxPeople")}</p>
                </div>
                <div class="form-group">
                    <label for="rentTypeId">Choose Rent type:</label>
                    <select id="rentTypeId" name="rentTypeId" class="form-control border-primary">
                        <c:forEach items="${rentTypeList}" var="rentType">
                            <option value="${rentType.rentTypeId}">
                                    ${rentType.rentTypeName}
                            </option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-group">
                    <label for="serviceTypeId">Choose Service type:</label>
                    <select id="serviceTypeId" name="serviceTypeId" class="form-control border-primary">
                        <c:forEach items="${serviceTypeList}" var="serviceType">
                            <option value="${serviceType.serviceTypeId}">
                                    ${serviceType.serviceTypeName}
                            </option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-group">
                    <label for="standardRoom">Enter The Room Standard:</label>
                    <select id="standardRoom" name="standardRoom" class="form-control border-primary">
                        <option value="Base">Normal</option>
                        <option value="Luxury">Luxury</option>
                        <option value="Premium">VIP</option>
                    </select>
                    <%--                <input type="text" class="form-control" id="standardRoom" name="standardRoom">--%>
                </div>
                <div class="form-group">
                    <label for="descriptionOtherConvenience">Enter Other Convenience:</label>
                    <select id="descriptionOtherConvenience" name="descriptionOtherConvenience" class="form-control border-primary">
                        <option value="Sauna Massage">Sauna Massage</option>
                        <option value="Breakfast">Breakfast</option>
                        <option value="Laundry">Laundry</option>
                        <option value="Airport Shuttle">Airport Shuttle</option>
                    </select>
                    <%--                <input type="text" class="form-control" id="descriptionOtherConvenience" name="descriptionOtherConvenience">--%>
                </div>
                <div class="form-group">
                    <label for="poolArea">Enter Pool Area:</label>
                    <input type="text" class="form-control" id="poolArea" name="poolArea">
                    <p style="color:red">${error.get("poolArea")}</p>
                </div>
                <div class="form-group">
                    <label for="numberOfFloor">Enter Number Of Floor:</label>
                    <input type="text" class="form-control" id="numberOfFloor" name="numberOfFloor">
                    <p style="color:red">${error.get("numberOfFloor")}</p>
                </div>
                <%--        <div class="form-group form-check">--%>
                <%--            <input type="checkbox" class="form-check-input" id="exampleCheck1">--%>
                <%--            <label class="form-check-label" for="exampleCheck1">Check me out</label>--%>
                <%--        </div>--%>
                <span><button type="submit" class="btn btn-primary">SAVE</button></span>
                <span><a href="/service" class="btn btn-danger"><< BACK</a></span>
            </form>
        </div>
    </div>
</body>
</html>