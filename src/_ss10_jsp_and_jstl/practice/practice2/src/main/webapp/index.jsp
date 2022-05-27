<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 5/27/2022
  Time: 1:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<head>
  <title>Simple Dictionary</title>
  <style>
    .content{
      box-sizing: border-box;
      border: 2px solid chocolate;
      width: 300px;
      margin: 0 auto;
      background: linear-gradient(blue, greenyellow);
    }

    #submit{
      background: grey;
      border: none;
      color: white;
    }
  </style>
</head>
<body>
<div class="content">
  <h2>Vietnamese Dictionary</h2>
  <form action="dictionary.jsp" method="post">
    <input type="text" name="search" placeholder="Enter your word: "/>
    <input type = "submit" id = "submit" value = "Search"/>
  </form>
</div>
</body>
</html>
