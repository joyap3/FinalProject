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
<table class="table table-bordered">
    <c:forEach var = "myvar" items = "${uList}">
    <tr>
        <td>${myvar.firstName}</td>
        <td>${myvar.lastName}</td>
        <td>${myvar.birthday}</td>
        <td>${myvar.email}</td>
        <td>${myvar.address}</td>
        <td>${myvar.zip}</td>
        <td>${myvar.phoneNumber}</td>
        <td>${myvar.crimetype}</td>
        <td><a href="deleteuser?id=${myvar.idUsers}"> Delete </a> </td>
        <td>
            <a href="updatecrimetype?id=${myvar.idUsers}">
                <button value="Edit Item">Edit</button>
            </a>
            </form> </td>
    </tr>
    </c:forEach>
</table>
</body>
</html>
