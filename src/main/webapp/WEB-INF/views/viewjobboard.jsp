<%--
  Created by IntelliJ IDEA.
  User: Steve
  Date: 8/11/2017
  Time: 12:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Job Listings</title>
</head>
<body>
${message}
<table>
    <tr>
        <th>Company</th>
        <th>Job Title</th>
        <th>Job Description</th>
        <th>Contact Name</th>
        <th>Contact Email</th>
    </tr>
    <c:forEach var="job" items="${unrestricted}">
        <tr>
            <td>${job.company}</td>
            <td>${job.jobTitle}</td>
            <td>${job.jobDescription}</td>
            <td>${job.contactName}</td>
            <td>${job.contactEmail}</td>
        </tr>
    </c:forEach>
    <c:forEach var="job" items="${restricted}">
        <tr>
            <td>${job.company}</td>
            <td>${job.jobTitle}</td>
            <td>${job.jobDescription}</td>
            <td>${job.contactName}</td>
            <td>${job.contactEmail}</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
