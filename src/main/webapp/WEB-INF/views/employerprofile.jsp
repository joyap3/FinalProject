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

<h1>Welcome, ${employerProfile.contactName}</h1>

<table>
<tr>
    <td>Company:</td>
    <td>${employerProfile.company} ${companyName}</td>
</tr>
<tr>
    <td>Job Title:</td>
    <td>${employerProfile.jobTitle} ${jobTitle}</td>
</tr>
<tr>
    <td>Contact Name:</td>
    <td>${employerProfile.contactName} ${contactName}</td>
</tr>
<tr>
    <td>Address:</td>
    <td>${employerProfile.contactPhone} ${contactPhone}</td>
</tr>
<tr>
    <td>Email:</td>
    <td>${employerProfile.contactEmail} ${contactEmail}</td>
</tr>
<tr>
    <td>Job Description:</td>
    <td>${employerProfile.jobDescription} ${jobDescription}</td>
</tr>
<tr>
    <td>Crime Type:</td>
    <td>${employerProfile.crimetype} ${crimeType}</td>
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
