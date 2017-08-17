<%--
  Created by IntelliJ IDEA.
  User: ericm
  Date: 8/14/2017
  Time: 4:39 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Employer Profile</title>

    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">

    <style>
        body {
            padding-top: 50px;
            background-color: #b9b5b4;
        }
        .spacer {
            margin-top: 2%;
            margin-bottom: 2%;
        }
        .block {
            height: 260px;
            padding-top: 30px;
            background: center no-repeat;
            background-image: url("${pageContext.request.contextPath}../resource/theme/img/login2.jpg");

        }
        .block2 {
            min-height: 160px;
            padding-top: 15px;
            background: rgba(225, 245, 255, 0.8)
        }
        .center {
            position: absolute;
            /*  top: 0;
              bottom: 0; */
            left: 0;
            right: 0;
            margin: auto;
        }
    </style>
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


<%--<div>--%>
<%--<nav>--%>
<%--<a class="navbar-brand" href="#">180</a> |--%>
<%--<a class="nav-link" href="/">Home</a> |--%>
<%--<a class="nav-link" href="/registerEmployer">Register Job</a> |--%>
<%--<a class="nav-link" href="/viewJobBoard">View Jobs</a> |--%>
<%--<a class="nav-link" href="/login">Profile</a>--%>
<%--<a class="nav-link" href="/logout">Log Out</a>--%>
<%--</nav>--%>
<%--</div>--%>

<h1>Welcome, ${employerProfile.contactName}</h1>

<table class="table table-bordered">
    <tr>
        <td>Company:</td>
        <td>${employerProfile.company}</td>
    </tr>
    <tr>
        <td>Contact Name:</td>
        <td>${employerProfile.contactName}</td>
    </tr>
    <tr>
        <td>Phone Number:</td>
        <td>${employerProfile.contactPhone}</td>
    </tr>
    <tr>
        <td>Email:</td>
        <td>${employerProfile.contactEmail}</td>
    </tr>

</table>



<a href="/viewjoblistings"><button value="View Jobs">View Job Listings</button></a>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
</html>
