<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: Steve
  Date: 8/10/2017
  Time: 14:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>View API</title>

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
<br>
<br>
<br>
<div>
    <form id="updateUser" action="/crimetype" method="post">
        <table class="table table-bordered">
            <tr>
                <td>First Name:</td>
                <td><input name="firstName" value="${userProfile.firstName}"></td>
            </tr>
            <tr>
                <td>Middle Name:</td>
                <td><input name="middleName" value="${userProfile.middleName}"></td>
            </tr>
            <tr>
                <td>Last Name:</td>
                <td><input name="lastName" value="${userProfile.lastName}"></td>
            </tr>
            <tr>
                <td>Birthday:</td>
                <td><input name="birthday" value="${userProfile.birthday}"></td>
            </tr>
            <tr>
                <td>Address:</td>
                <td><input name="address" value="${userProfile.address}"></td>
            </tr>
            <tr>
                <td>Zip:</td>
                <td><input name="zip" value="${userProfile.zip}"></td>
            </tr>
            <tr>
                <td>Phone Number:</td>
                <td><input name="phoneNumber" value="${userProfile.phoneNumber}"></td>
            </tr>
            <tr>
                <td>email:</td>
                <td><input name="email" value="${userProfile.email}"></td>
            </tr>
            <tr>
                <td>Skill-set:</td>
                <td>
                    <select form="updateUser" name="skillSet">
                        <option selected>${userProfile.skillset}</option>
                        <option value="Trade Worker">Trade Worker</option>
                        <option value="Administration">Administration</option>
                        <option value="Technology">Technology</option>
                        <option value="Business">Business</option>
                        <option value="Sales">Sales</option>
                        <option value="Public Service">Public Service</option>
                        <option value="Other">Other</option>

                    </select>
                </td>
            </tr>
            <tr>
                <td>Crime Type:</td>
                <td>
                    <select form="updateUser" name="crimetype">
                        <option selected>${userProfile.crimetype}</option>
                        <option value="Violent">Violent</option>
                        <option value="Non-Violent">Non-Violent</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>
                    <input type="submit" value="Submit">
                </td>
            </tr>
        </table>
    </form>
</div>



<!-- Bootstrap core JavaScript -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
</html>
