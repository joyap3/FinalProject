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
<nav class="navbar navbar-inverse navbar-dark bg-inverse navbar-fixed-top navbar-full">
    <div align="left">
        <span style="float:left">
        <ul class="nav navbar-nav">
            <li class="nav-item">
                <a class="navbar-brand" href="/"><img src="${pageContext.request.contextPath}../resource/theme/img/logo.png"/></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/registerEmployer">Post A Job <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/login">Profile</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/viewJobBoard">Job Listings</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="welcome.jsp/#about">About</a>
            </li>
        </ul>
            </span>
    </div>
    <div class="nav-item" align="right">
        <span style="float:right">
        <ul class="nav navbar-nav">
            <li class="nav-item">
                <a class="nav-link" class="text-right" href="/admin">${user}</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/logout">Log Out</a>
            </li>
        </ul>
        </span>
    </div>
</nav>
<br>
${message}
<br>
<br>
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
