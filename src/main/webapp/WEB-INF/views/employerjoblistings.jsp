<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Steve
  Date: 8/17/2017
  Time: 11:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Job List</title>
</head>
<body>
<table border="1">
    <tr>
        <th>Job ID</th>
        <th>Company</th>
        <th>Job Title</th>
        <th>Job Description</th>
        <th>Crime Type</th>
        <th>Edit Job</th>
    </tr>
<c:forEach items="${jobList}" var="jobList">
    <tr>
        <td>${jobList.jobId}</td>
        <td>${jobList.company}</td>
        <td>${jobList.jobTitle}</td>
        <td>${jobList.jobDescription}</td>
        <td>${jobList.crimetype}</td>
        <td><a href="updateEmployerInfo?id=${jobList.jobId}"><button value="Edit Item">Edit</button></a></td>
    </tr>
</c:forEach>
</table>

<a href="/makenewjob"><button value="Add Job">Add New Job</button></a>

</body>
</html>
