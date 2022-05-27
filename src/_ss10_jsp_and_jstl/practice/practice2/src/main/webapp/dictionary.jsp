<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 5/27/2022
  Time: 1:52 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Simple Dictionary</title>
</head>
<body>
<%!
    Map<String, String> dic = new HashMap<>();
%>

<%
    dic.put("hello", "Xin chào");
    dic.put("how", "Thế nào");
    dic.put("book", "Quyển vở");
    dic.put("computer", "Máy tính");

    String search = request.getParameter("search");

    String result = dic.get(search);
    if (result != null) {
%>
<p style="color: blue">WORD:  <%=search%></p>
<p style="color: blue">RESULT:  <%=result%></p>
<%
} else {
%>
"NOT FOUND THE WORD YOU'VE SEARCH"
<%
    }
%>
</body>
</html>
