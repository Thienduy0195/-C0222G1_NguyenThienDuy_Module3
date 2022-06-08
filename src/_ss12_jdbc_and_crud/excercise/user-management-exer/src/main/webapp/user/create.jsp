<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 6/1/2022
  Time: 5:47 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Create New User</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container" style="margin: 5% auto">
    <div>
        <a href="/users">
            <button type="button" class="btn btn-primary">BACK TO LIST</button>
        </a>
        <div>
            <form method="post">
                <caption>
                    <h2>Add New User</h2>
                </caption>
                <table  border="1" cellpadding="5" class="table table-info col-8">
                    <tbody>
                    <tr>
                        <th>User Name</th>
                        <td>
                            <input type="text" name="name" id="name" size="45">
                        </td>
                        <p style="color:red">${error.get("name")}</p>
                    </tr>
                    <tr>
                        <th>Email</th>
                        <td>
                            <input type="text" name="email" id="email" size="45">
                        </td>
                        <p style="color:red">${error.get("email")}</p>
                    </tr>
                    <tr>
                        <th>Country</th>
                        <td>
                            <input type="text" name="country" id="country" size="45">
                        </td>
                        <p style="color:red">${error.get("country")}</p>
                    </tr>
                    </tbody>
                </table>
                <button type="submit" class="btn btn-success">CREATE USER</button>
            </form>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>