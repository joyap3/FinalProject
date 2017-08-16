<%--
  Created by IntelliJ IDEA.
  User: joyapuryear
  Date: 8/15/17
  Time: 3:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>View Jobs</title>


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
<%--<div>--%>
<%--<nav>--%>
<%--<a class="nav-link" href="/">Home</a> |--%>
<%--<a class="nav-link" href="/admin">Dashboard</a> |--%>
<%--<a class="nav-link" href="/listusers">View Users</a> |--%>
<%--<a class="nav-link" href="/viewcriminalresults">Background Search</a> |--%>
<%--<a class="nav-link" href="/logout">Log Out</a>--%>
<%--</nav>--%>
<%--</div>--%>


<nav class="navbar navbar-dark bg-inverse navbar-full" id="nav-main">
    <a class="navbar-brand" href="/">180</a>
    <ul class="nav navbar-nav">
        <li class="nav-item active">
        <li><a class="nav-link" href="/">Home</a></li>
        </li>
        <li class="nav-item">
        <li><a class="nav-link" href="/admin">Dashboard</a></li>
        </li>
        <li class="nav-item">
        <li><a class="nav-link" href="/listusers">View Users</a></li>
        </li>
        <li class="nav-item">
        <li><a class="nav-link" href="/viewcriminalresults">Background Search</a></li>
        </li>
        <li class="nav-item">
        <li><a class="nav-link" href="/logout">Log Out</a></li>
        </li>
    </ul>
    <form class="form-inline pull-xs-right">
        <input class="form-control" type="text" placeholder="Search">
        <button class="btn btn-success-outline" type="submit">Search</button>
    </form>
</nav>


<br>

<table class="table table-bordered">
    <tr>
        <th>Job ID</th>
        <th>Company Name</th>
        <th>Job Title</th>
        <th>Contact Name</th>
        <th>Contact Email</th>
        <th>Contact Phone</th>
        <th>Job Description</th>
        <th>Crimetype</th>
        <th>Update</th>
    </tr>
    <c:forEach var = "myvar" items = "${jList}">
        <tr>
            <td>${myvar.jobId}</td>
            <td>${myvar.company}</td>
            <td>${myvar.jobTitle}</td>
            <td>${myvar.contactName}</td>
            <td>${myvar.contactEmail}</td>
            <td>${myvar.contactPhone}</td>
            <td>${myvar.jobDescription}</td>
            <td>${myvar.crimetype}</td>
            <td><a href="deletejob?id=${myvar.jobId}"><button value="Delete Job">Delete</button></a></td>
        </tr>
    </c:forEach>

</table>


<!-- Bootstrap core JavaScript -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
</html>