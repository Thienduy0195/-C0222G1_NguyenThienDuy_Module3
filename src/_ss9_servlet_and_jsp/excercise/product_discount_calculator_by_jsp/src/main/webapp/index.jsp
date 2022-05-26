<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 5/26/2022
  Time: 2:12 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>PRODUCT DISCOUNT CALCULATOR</title>
    <style>
      *{
        box-sizing: border-box;
      }
      #content{
        width: 430px;
        margin: 0 auto;
        padding: 0 20px 20px;
        display: inline-block;
        background: orangered;
        border: lightsalmon solid 2px;
      }

      label{
        width: 10em;
        padding-right: 1em;
        float: left;
        color: white;
        font-weight: 300;
      }

      #data input{
        float: left;
        width: 15em;
        margin-bottom: 0.5em;
      }
    </style>
  </head>
  <body>
  <div id="content">
    <h1 style="color: white">Product Discount Calculator</h1>
    <form action="/result.jsp" method="post">
      <div id="data">
        <label>Product Description</label>
        <input type="text" name="description">
        <br>
        <label>Price</label>
        <input type="text" name="price">
        <br>
        <label>Discount Percent</label>
        <input type="text" name="discount">
      </div>
      <div>
        <br>
        <input type="submit" value="Calculating Product Discount">
      </div>
    </form>
  </div>
  </body>
</html>
