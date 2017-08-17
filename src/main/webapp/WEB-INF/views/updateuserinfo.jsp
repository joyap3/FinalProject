<%--
  Created by IntelliJ IDEA.
  User: Steve
  Date: 8/9/2017
  Time: 15:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update Profile</title>
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
                <a class="nav-link" href="welcome.jsp/#about">About</a>
            </li>
        </ul>
            </span>
        </div>
        <div class="nav-item" align="right">
        <span style="float:right">
        <ul class="nav navbar-nav">
            <li class="nav-item">
                <a class="nav-link" class="text-right" href="/admin">${user}</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/logout">Log Out</a>
            </li>
        </ul>
        </span>
        </div>
    </nav>
</div>
<form action="/update" method="post">
    <table>

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
                <select name="skillSet" value="${userProfile.skillset}">
                    <option selected>${userProfile.skillset}</option>
                    <option value="trades">Trade Worker</option>
                    <option value="administration">Administration</option>
                    <option value="technology">Technology</option>
                    <option value="business">Business</option>
                    <option value="sales">Sales</option>
                    <option value="publicService">Public Service</option>
                    <option value="other">Other</option>
                </select>
            </td>
        </tr>

    </table>
    <input type="submit" value="Save">
</form>
</body>
</html>
