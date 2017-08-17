<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Steve
  Date: 8/17/2017
  Time: 11:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Job List</title>
    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">

    <style>
        body {
            padding-top: 50px;
            background-color: #c8b897;
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
<table class="table table-bordered">
    <tr>
        <th>Job ID</th>
        <th>Company</th>
        <th>Job Title</th>
        <th>Job Description</th>
        <th>Crime Type</th>
        <th>Edit Job</th>
    </tr>
<c:forEach items="${jobList}" var="jobList">
    <tr>
        <td>${jobList.jobId}</td>
        <td>${jobList.company}</td>
        <td>${jobList.jobTitle}</td>
        <td>${jobList.jobDescription}</td>
        <td>${jobList.crimetype}</td>
        <td><a href="updateEmployerInfo?id=${jobList.jobId}"><button value="Edit Item">Edit</button></a></td>
    </tr>
</c:forEach>
</table>

<a href="/makenewjob"><button value="Add Job">Add New Job</button></a>



<!-- Bootstrap core JavaScript -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
</html>
