<%--
  Created by IntelliJ IDEA.
  User: Steve
  Date: 8/7/2017
  Time: 15:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<html>
<head>
    <title>User Profile</title>
</head>
<body>
<a href="login">go to login</a>

<table>

    <tr>
        <td>First Name:</td>
        <td>${userProfile.firstName}</td>
    </tr>
    <tr>
        <td>Middle Name:</td>
        <td>${userProfile.middleName}</td>
    </tr>
    <tr>
        <td>Last Name:</td>
        <td>${userProfile.lastName}</td>
    </tr>
    <tr>
        <td>Birthday:</td>
        <td>${userProfile.birthday}</td>
    </tr>
    <tr>
        <td>Address:</td>
        <td>${userProfile.address}</td>
    </tr>
    <tr>
        <td>Zip:</td>
        <td>${userProfile.zip}</td>
    </tr>
    <tr>
        <td>Phone Number:</td>
        <td>${userProfile.phoneNumber}</td>
    </tr>
    <tr>
        <td>email:</td>
        <td>${userProfile.email}</td>
    </tr>


</table>
</body>
</html>
