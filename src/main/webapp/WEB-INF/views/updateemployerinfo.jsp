<%--
  Created by IntelliJ IDEA.
  User: ericm
  Date: 8/15/2017
  Time: 3:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update Employer Info</title>
</head>
<body>
<div>
    <nav>
        <a class="navbar-brand" href="#">180</a> |
        <a class="nav-link" href="/">Home</a> |
        <a class="nav-link" href="/registerEmployer">Register Job</a> |
        <a class="nav-link" href="/login">Profile</a>
        <a class="nav-link" href="/logout">Log Out</a>
    </nav>
</div>
<form action="/updateemployer" method="post">

    <table>
        <tr>
            <td>Company:</td>
            <td><input name="company" value="${employerProfile.company}"></td>
        </tr>
        <tr>
            <td>Job Title:</td>
            <td><input name="jobTitle" value="${employerProfile.jobTitle}"></td>
        </tr>
        <tr>
            <td>Contact Name:</td>
            <td><input name="contactName" value="${employerProfile.contactName}"></td>
        </tr>
        <tr>
            <td>Address:</td>
            <td><input name="contactPhone" value="${employerProfile.contactPhone}"></td>
        </tr>
        <tr>
            <td>Email:</td>
            <td><input name="contactEmail" value="${employerProfile.contactEmail}"></td>
        </tr>
        <tr>
            <td>Job Description:</td>
            <td><input name="jobDescription" value="${employerProfile.jobDescription}"></td>
        </tr>
        <tr>
            <td>Current Crime Type:</td>
            <td>${employerProfile.crimetype}</td>
        </tr>
        <tr>
            <td>Update Crime type:</td>
            <td>Hire potential Job Seekers with a violent background?</td>
            <td>
                <select name="crimetype" required="true">
                    <option value="Violent">Yes</option>
                    <option value="Non-Violent">No</option>
                </select>
            </td>
        </tr>
        <%--Update crime type needs better formatting--%>
    </table>
    <input type="submit" value="Save">
</form>

</body>
</html>
