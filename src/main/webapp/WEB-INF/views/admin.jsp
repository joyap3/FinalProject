<%--
  Created by IntelliJ IDEA.
  User: joyapuryear
  Date: 8/7/17
  Time: 10:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Admin Page</title>
</head>
<body>
<%--Displays links to view user Database--%>
${message}
<a href="/listusers">View Users</a>
<a href="/listjobs">View Jobs</a>
<%--<a href="/showAPI">API</a>--%>

<form action="/showAPI" method="get">
    <input type="text" name="firstName">
    <input type="text" name="lastName">
    <%--<input type="email" name="email">--%>
    <input type="submit" value="Search">

</form>
${allthejson}
<%--<form action="crimetype" method="post">--%>
<%--<input type="checkbox" name="violent" value="V" >--%>
<%--<input type="checkbox" name="non-violent" value="NV" checked>--%>
<%--<input type="submit" value="Submit">--%>

<%--</form>--%>

<table border="1">
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

    <c:forEach var = "myvar" items = "${jList}">
        <tr>
            <td>${myvar.jobId}</td>
            <td>${myvar.company}</td>
            <td>${myvar.jobTitle}</td>
            <td>${myvar.jobDescription}</td>
            <td><a href="deletejob?id=${myvar.jobId}"> Delete </a> </td>
        </tr>
    </c:forEach>


</table>


<%--Displays links to view jobs Database--%>

</body>
</html>
