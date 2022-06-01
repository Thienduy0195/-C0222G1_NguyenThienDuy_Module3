<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 5/30/2022
  Time: 9:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
<p><a href="/product">Back To Products List</a></p>
<form method="post">
    <table >
        <tr>
            <th>Name</th>
            <td>${requestScope["products"].name}</td>
        </tr>
        <tr>
            <th>Price</th>
            <td>${requestScope["products"].price}</td>
        </tr>
        <tr>
            <th>Description</th>
            <td>${requestScope["products"].description}</td>
        </tr>
        <tr>
            <th>Producer</th>
            <td>${requestScope["products"].producer}</td>
        </tr>
        <tr>
            <input type="submit" value="Delete Product">
        </tr>
    </table>

</form>

</body>
</html>
