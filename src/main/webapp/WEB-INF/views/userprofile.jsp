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

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>User Profile</title>
    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">

    <style>
        body {
            padding-top: 50px;
            background-color: #b9b5b4;
    </style>
</head>
<body>
<div>
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
                <a class="nav-link" href="/">Home</a>
            </li>
        </ul>
            </span>
        </div>
        <div class="nav-item" align="right">
        <span style="float:right">
        <ul class="nav navbar-nav">
            <li class="nav-item">
                <a class="nav-link" class="text-right" href="/login">${user}</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/logout">Log Out</a>
            </li>
        </ul>
        </span>
        </div>
    </nav>
</div>
<h1>Welcome, ${userProfile.firstName}</h1>

<table class="table table-bordered">
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


</table>
<a href="updateUserInfo?id=${userProfile.idUsers}"><button value="Edit Item">Edit</button></a>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
</html>
