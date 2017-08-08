<%--
  Created by IntelliJ IDEA.
  User: ericm
  Date: 8/7/2017
  Time: 9:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register Job</title>
</head>
<body>
<form name="registerJob" action="/insertJob" method="post">
    <table>
        <tr>
            <td>Company Name:</td>
            <td><input type="text" name="company"></td>
        </tr>
        <tr>
            <td>Job Title:</td>
            <td><input type="text" name="jobTitle"></td>
        </tr>
        <tr>
            <td>Contact Name:</td>
            <td><input type="text" name="contactName"></td>
        </tr>
        <tr>
            <td>Phone Number:</td>
            <td><input type="tel" name="contactPhone"></td>
        </tr>
        <tr>
            <td>Email:</td>
            <td><input type="email" name="email"></td>
        </tr>
        <tr>
            <td>Job Description:</td>
            <td><input type="text" name="jobDescription"></td>
        </tr>
        <tr>
            <td><button name="submit" value="Submit">Register</button></td>
        </tr>
    </table>
</form>


</body>
</html>
