<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 5/30/2022
  Time: 9:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
<p>
    <c:if test='${requestScope["message"] != null}'>
        <span class="message">${requestScope["message"]}</span>
    </c:if>
</p>
<p><a href="/product">Back To Products Management Site</a></p>
<form method="post">
    <fieldset>
        <legend>PRODUCT INFORMATION</legend>
        <table>
            <tr>
                <td>Id:</td>
                <td><input type="text" name="id"></td>
            </tr>
            <tr>
                <td>Name:</td>
                <td><input type="text" name="name"></td>
            </tr>
            <tr>
                <td>Price:</td>
                <td><input type="text" name="price"></td>
            </tr>
            <tr>
                <td>Description:</td>
                <td><input type="text" name="description"></td>
            </tr>
            <tr>
                <td>Producer:</td>
                <td><input type="text" name="producer"></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Create product"></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
