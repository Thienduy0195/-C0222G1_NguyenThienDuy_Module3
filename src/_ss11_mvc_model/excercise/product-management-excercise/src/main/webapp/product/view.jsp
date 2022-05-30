<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 5/30/2022
  Time: 9:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>View Product</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
    <p>
        <a href="/product">Back Products List</a>
    </p>
<table border="1px">
    <tr>
        <th>ID</th>
        <td>${requestScope["products"].id}</td>
    </tr>
    <tr>
        <td>NAME</td>
        <td>${requestScope["products"].name}</td>
    </tr>
    <tr>
        <th>PRICE</th>
        <td>${requestScope["products"].price}</td>
    </tr>
    <tr>
        <th>DESCRIPTION</th>
        <td>${requestScope["products"].description}</td>
    </tr>
    <tr>
        <th>PRODUCER</th>
        <td>${requestScope["products"].producer}</td>
    </tr>
</table>
</body>
</html>
