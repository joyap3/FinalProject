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

<h1>Welcome, ${userProfile.firstName} ${firstName}</h1>

<table>

    <tr>
        <td>First Name:</td>
        <td>${userProfile.firstName} ${firstName}</td>
    </tr>
    <tr>
        <td>Middle Name:</td>
        <td>${userProfile.middleName} ${middleName}</td>
    </tr>
    <tr>
        <td>Last Name:</td>
        <td>${userProfile.lastName} ${lastName}</td>
    </tr>
    <tr>
        <td>Birthday:</td>
        <td>${userProfile.birthday} ${birthday}</td>
    </tr>
    <tr>
        <td>Address:</td>
        <td>${userProfile.address} ${address}</td>
    </tr>
    <tr>
        <td>Zip:</td>
        <td>${userProfile.zip} ${zip}</td>
    </tr>
    <tr>
        <td>Phone Number:</td>
        <td>${userProfile.phoneNumber} ${phoneNumber}</td>
    </tr>
    <tr>
        <td>email:</td>
        <td>${userProfile.email} ${email}</td>
    </tr>
    <tr>
        <td>skillset:</td>
        <td>${userProfile.skillset} ${skillSet}</td>
    </tr>
    <tr>
        <td>
            <a href="updateUserInfo?id=${userProfile.idUsers}">
                <button value="Edit Item">Edit</button>
            </a>
        </td>
    </tr>
</table>
</body>
</html>
