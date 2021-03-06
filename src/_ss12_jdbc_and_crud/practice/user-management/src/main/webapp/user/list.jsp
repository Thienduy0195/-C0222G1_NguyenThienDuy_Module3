<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 5/31/2022
  Time: 2:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>User Management Application</title>
    <style>
        th{
            background: springgreen;
        }
        table {
            border-collapse: collapse;
        }
    </style>
</head>
<body>
<center>
    <h1>User Management</h1>
    <div class="tit">
        <span>
            <a href="/users?action=create">Add New User</a>
        </span>
        <span>|</span>
        <span>
            <a href="/users?action=create">Search User</a>
        </span>
    </div>

</center>
<div align="center">
    <table border="1" cellpadding="5">
        <caption><h2>LIST OF USERS</h2></caption>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Country</th>
            <th>Actions</th>
        </tr>
        <c:forEach var="user" items="${listUser}">
            <tr>
                <td><c:out value="${user.id}"/></td>
                <td><c:out value="${user.name}"/></td>
                <td><c:out value="${user.email}"/></td>
                <td><c:out value="${user.country}"/></td>
                <td>
                    <a href="/users?action=edit&id=${user.id}">Edit</a>
                    <a href="/users?action=delete&id=${user.id}">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>
