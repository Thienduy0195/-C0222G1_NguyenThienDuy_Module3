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
    <title>Edit Product</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

</head>
<body>
<p>
    <c:if test='${requestScope["message"] != null}'>
        <span class="message">${requestScope["message"]}</span>
    </c:if>
</p>
<p><a href="/product">Back To Products List</a></p>
<form method="post">
    <table class="table">
        <tr>
            <th>Name</th>
            <td><input type="text" placeholder="Edit name" name="name"
                       value="${requestScope["products"].name}"></td>
        </tr>
        <tr>
            <th>Price</th>
            <td><input type="text" placeholder="Edit price" name="price"
                       value="${requestScope["products"].price}"></td>
        </tr>
        <tr>
            <th>Description</th>
            <td><input type="text"  name="description"
                       value="${requestScope["products"].description}"></td>
        </tr>
        <tr>
            <th>Producer</th>
            <td><input type="text" placeholder="Edit producer" name="producer"
                       value="${requestScope["products"].producer}"></td>
        </tr>
        <tr>
            <td>
                <input type="submit" value="Update Product ">
            </td>
        </tr>
    </table>
</form>
</body>
</html>
