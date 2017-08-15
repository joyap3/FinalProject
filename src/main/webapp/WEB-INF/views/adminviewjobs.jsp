<%--
  Created by IntelliJ IDEA.
  User: joyapuryear
  Date: 8/15/17
  Time: 3:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>View Jobs</title>
</head>
<body>
<table>
<c:forEach var = "myvar" items = "${jList}">
    <thead>
    <tr>
        <td>${myvar.jobId}</td>
        <td>${myvar.company}</td>
        <td>${myvar.jobTitle}</td>
        <td>${myvar.jobDescription}</td>
            <%--<td>--${myvar.crimetype}--</td>--%>
        <td><a href="deletejob?id=${myvar.jobId}"> Delete </a> </td>
    </tr>
    </thead>
</c:forEach>

</table>
</body>
</html>
