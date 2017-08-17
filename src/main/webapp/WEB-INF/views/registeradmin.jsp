<%--
  Created by IntelliJ IDEA.
  User: Steve
  Date: 8/17/2017
  Time: 09:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register Admin</title>
</head>
<body>

<form name="registerAdmin" action="/registerAdmin" method="post">
    <table border="1">
        <tr>
            <td>First Name:</td>
            <td><input name="firstName" required></td>
        </tr>
        <tr>
            <td>Last Name:</td>
            <td><input name="lastName" required></td>
        </tr>
        <tr>
            <td>Email:</td>
            <td><input type="email" name="email"></td>
        </tr>
        <tr>
            <td>Password:</td>
            <td><input type="password" name="password" required></td>
        </tr>
        <tr>
            <td>Confirm Password:</td>
            <td><input type="password" name="confirmPassword" required></td>
        </tr>
    </table>
    <input type="submit" name="Submit">
</form>


</body>
</html>
