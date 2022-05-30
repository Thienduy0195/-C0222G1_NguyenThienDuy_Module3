<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 5/30/2022
  Time: 5:27 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>PRODUCT SITE</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <style>
        th{
            background: darkorange;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>PRODUCT MANAGEMENT SITE</h2>
    <p>
        <a href="/product?action=create">Create new product</a>
    </p>
    <table class="table table-bordered " style="text-align: center;width: 100%">
        <tr class="row">
            <th class="col-1">ID</th>
            <th class="col-2">NAME</th>
            <th class="col-2">PRICE</th>
            <th class="col-3">DESCRIPTION</th>
            <th class="col-2">PRODUCER</th>
            <th class="col-1">EDIT</th>
            <th class="col-1">DELETE</th>
        </tr>
        <c:forEach var="item" items="${products}">
            <tr class="row">
                <th class="col-1">${item.id}</th>
                <td class="col-2"><a href="/product?action=view&id=${item.id}">${item.name}</a></td>
                <td class="col-2">${item.price}</td>
                <td class="col-3">${item.description}</td>
                <td class="col-2">${item.producer}</td>
                <td class="col-1"><a href="/product?action=edit&id=${item.id}">edit</a></td>
                <td class="col-1"><a href="/product?action=delete&id=${item.id}">delete</a></td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>
