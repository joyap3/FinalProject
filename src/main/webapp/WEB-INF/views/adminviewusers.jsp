<%--
  Created by IntelliJ IDEA.
  User: joyapuryear
  Date: 8/15/17
  Time: 3:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>View Users</title>
</head>
<body>
<div>
    <nav>
        <a class="nav-link" href="/">Home</a> |
        <a class="nav-link" href="/admin">Dashboard</a> |
        <a class="nav-link" href="/listjobs">View Jobs</a> |
        <a class="nav-link" href="/viewcriminalresults">Background Search</a> |
        <a class="nav-link" href="/logout">Log Out</a>
    </nav>
</div>
<br>
<table border="1" class="table table-bordered">

    <tr>
        <th>First Name</th>
        <th>Middle Name</th>
        <th>Last Name</th>
        <th>DOB</th>
        <th>Email</th>
        <th>Address</th>
        <th>Zip</th>
        <th>Phone Number</th>
        <th>Skill Set</th>
        <th>Crime Type</th>
        <th>Edit User Info</th>
        <th>Delete User Info</th>
    </tr>
    <c:forEach var = "myvar" items = "${uList}">
    <tr>
        <td>${myvar.firstName}</td>
        <td>${myvar.middleName}</td>
        <td>${myvar.lastName}</td>
        <td>${myvar.birthday}</td>
        <td>${myvar.email}</td>
        <td>${myvar.address}</td>
        <td>${myvar.zip}</td>
        <td>${myvar.phoneNumber}</td>
        <td>${myvar.skillset}</td>
        <td>${myvar.crimetype}</td>
        <td><a href="updatecrimetype?id=${myvar.idUsers}"><button value="Edit Item">Edit</button></a></td>
        <td><a href="deleteuser?id=${myvar.idUsers}"><button value="Delete Item">Delete</button></a></td>
    </tr>
    </c:forEach>
</table>
</body>
</html>
