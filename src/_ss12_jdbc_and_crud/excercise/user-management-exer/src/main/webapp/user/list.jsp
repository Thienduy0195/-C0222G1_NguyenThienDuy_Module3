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
    <title>USER MANAGEMENT</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <style>
        table{
            width: 100%;
        }
        .header-panel{
            display: flex;
            justify-content: space-between;
        }

        button{
            margin-right: 0.5em;
        }
        /*input{*/
        /*    border-collapse: collapse;*/
        /*}*/
        h1{
            color: limegreen;
            margin: 0.5em 0.5em;
        }
    </style>
</head>
<body>
<center>
    <div class="container" align="center">
        <h1>USER MANAGEMENT</h1>
        <div class="header-panel">
            <div>
                <%-- Back to menu --%>
                <a href="/users">
                    <button type="button" class="btn btn-primary">Home</button>
                </a>
                <%-- Create New --%>
                <a href="/users?action=create">
                    <button type="button" class="btn btn-success">Creating New User</button>
                </a>
            </div>
            <div>
                <%-- SEARCH --%>
                <form class="search-form" action="/users" method="get">
                    <input type="hidden" name="action" value="search">
                    <label class="btn btn-light">User's name:</label>
                    <input type="text" name="name">
                    <button class="btn btn-primary" type="submit">Search</button>
                </form>
            </div>
        </div>
        <%-- Show List --%>
        <div class="content" align="center">
<%--            <caption><h2>List of Users</h2></caption>--%>
                <table class="table  table-bordered table-secondary round">
                    <thead>
                    <tr>
                        <th class="col-1">No.</th>
                        <th class="col-1">ID</th>
                        <th class="col-2">Name</th>
                        <th class="col-4">Email</th>
                        <th class="col-2">Country</th>
                        <th class="col-3" colspan="2" style="text-align: center">Option</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="user" items="${listUser}" varStatus="no">
                        <tr>
                            <td><c:out value="${no.count}"/></td>
                            <td><c:out value="${user.id}"/></td>
                            <td><c:out value="${user.name}"/></td>
                            <td><c:out value="${user.email}"/></td>
                            <td><c:out value="${user.country}"/></td>
                            <td style="border: none" class="col-1">
                                <a href="/users?action=edit&id=${user.id}">
                                    <button type="button" class="btn btn-primary">
                                        Edit
                                    </button>
                                </a>
                            </td>
                            <td style="border: none" class="col-1">
                                <button type="button" class="btn btn-danger"
                                        data-toggle="modal" data-target="#exampleModalCenter"
                                        onclick="infoDelete(
                                            <c:out value='${user.id}'/>,
                                            <c:out value='\"${user.name}\"'/>,
                                            <c:out value='\"${user.email}\"'/>,
                                            <c:out value='\"${user.country}\"'/>,
                                                )">
                                    Delete
                                </button>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>


            <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog"
                 aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLongTitle">Confirm Delete?</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <form action="/users" method="post">
                            <div class="modal-body">
                                <input type="hidden" name="action" value="delete">
                                <input type="hidden" id="id_delete" name="id">
                                <div id="name_delete"></div>
                                <div id="email_delete"></div>
                                <div id="country_delete"></div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">NO</button>
                                <button type="submit" class="btn btn-danger">YES</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
</center>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
<script>
    function infoDelete(id, name, email, country) {
        document.getElementById("id_delete").value = id;
        document.getElementById("name_delete").innerText = "Name: " + name;
        document.getElementById("email_delete").innerText = "Email " + email;
        document.getElementById("country_delete").innerText = "Country: " + country;
    }
</script>