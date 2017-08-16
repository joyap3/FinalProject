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
<div>
    <nav>
        <a class="navbar-brand" href="#">180</a> |
        <a class="nav-link" href="/">Home</a> |
        <a class="nav-link" href="/viewJobBoard">View Jobs</a> |
        <a class="nav-link" href="/login">Profile</a> |
        <a class="nav-link" href="/logout">Log Out</a>
    </nav>
</div>
<h1>Welcome, ${userProfile.firstName}</h1>

<table border="1">
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
    <tr>
        <td>skillset:</td>
        <td>${userProfile.skillset}</td>
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
