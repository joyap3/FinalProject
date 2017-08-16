<%--
  Created by IntelliJ IDEA.
  User: ericm
  Date: 8/14/2017
  Time: 4:39 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Employer Profile</title>
</head>
<body>
<div>
    <nav>
        <a class="navbar-brand" href="#">180</a> |
        <a class="nav-link" href="/">Home</a> |
        <a class="nav-link" href="/registerEmployer">Register Job</a> |
        <a class="nav-link" href="/viewJobBoard">View Jobs</a> |
        <a class="nav-link" href="/login">Profile</a>
        <a class="nav-link" href="/logout">Log Out</a>
    </nav>
</div>

<h1>Welcome, ${employerProfile.contactName}</h1>

<table border="1">
<tr>
    <td>Company:</td>
    <td>${employerProfile.company}</td>
</tr>
<tr>
    <td>Job Title:</td>
    <td>${employerProfile.jobTitle}</td>
</tr>
<tr>
    <td>Contact Name:</td>
    <td>${employerProfile.contactName}</td>
</tr>
<tr>
    <td>Address:</td>
    <td>${employerProfile.contactPhone}</td>
</tr>
<tr>
    <td>Email:</td>
    <td>${employerProfile.contactEmail}</td>
</tr>
<tr>
    <td>Job Description:</td>
    <td>${employerProfile.jobDescription}</td>
</tr>
<tr>
    <td>Crime Type:</td>
    <td>${employerProfile.crimetype}</td>
</tr>
    <tr>
        <td>
            <a href="updateEmployerInfo?id=${employerProfile.jobId}">
                <button value="Edit Item">Edit</button>
            </a>
        </td>
    </tr>
</table>

</body>
</html>
