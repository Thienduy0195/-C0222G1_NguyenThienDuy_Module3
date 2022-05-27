<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 5/27/2022
  Time: 3:31 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>CUSTOMER LIST EXCERCISE</title>
</head>
<body>
<table>
  <tr>
    <th>No.</th>
    <th>NAME</th>
    <th>DATE OF BIRTH</th>
    <th>ADDRESS</th>
    <th>IMAGE</th>
    <th>GENDER</th>
    <th>POINT</th>
  </tr>
  <c:forEach items="${customerList}" var="customer" varStatus="num">
    <tr>
      <td>${num.count}</td>
      <td>${customer.customerName}</td>
      <td>${customer.dateOfBirth}</td>
      <td>${customer.address}</td>
      <td>${customer.image}</td>
      <td>
        <c:if test="${customer.gender == 0}">Male</c:if>
        <c:if test="${customer.gender == 1}">Female</c:if>
        <c:if test="${customer.gender == null}">Other</c:if>
      </td>
      <td>
        <c:choose>
          <c:when test="${customer.point <=10 && customer.point >8}">Excellent</c:when>
          <c:when test="${customer.point <=8 && customer.point >6.5}">Good</c:when>
          <c:when test="${customer.point <=6.5 && customer.point >5}">Not Good</c:when>
          <c:when test="${customer.point <=5 && customer.point >0}">Bad</c:when>
          <c:otherwise>Error</c:otherwise>
        </c:choose>
      </td>
    </tr>
  </c:forEach>
</table>
</body>
</html>
