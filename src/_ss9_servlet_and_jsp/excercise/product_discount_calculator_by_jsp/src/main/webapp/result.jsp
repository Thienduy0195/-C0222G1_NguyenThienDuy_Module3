<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 5/26/2022
  Time: 2:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Result</title>
</head>
<body>
<%
    String description = request.getParameter("description");
    float price = Float.parseFloat(request.getParameter("price"));
    int discountPercent = Integer.parseInt(request.getParameter("discount"));
    float discount = price * discountPercent / 100;
    float total = price-discount;
%>

<h1>Product Description: <%=description%> </h1>
<h1>Product Price: <%=price%> </h1>
<h1>Product Discount Percent: <%=discountPercent%> %</h1>
<h1>Product Discount: <%=discount%> </h1>
<h1>Product Total Price: <%=total%> </h1>
</body>
</html>
