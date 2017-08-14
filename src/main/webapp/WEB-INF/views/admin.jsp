<%--
  Created by IntelliJ IDEA.
  User: joyapuryear
  Date: 8/7/17
  Time: 10:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Admin Page</title>

    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">

    <style>
        body {
            padding-top: 10px;
            background-color: #b9b5b4;
        }
        .spacer {
            margin-top: 1%;
            margin-bottom: 2%;
        }
        .block {
            height: 260px;
            padding-top: 25px;
            background: center no-repeat;
            background-image: url("${pageContext.request.contextPath}../resource/theme/img/login2.jpg");

        }
        .block2 {
            min-height: 160px;
            padding-top: 10px;
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
<nav class="navbar navbar-inverse navbar-fixed-top ">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand " href="/">180</a>

        </div>
        <div id="navbar" class="collapse navbar-collapse">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#about">About</a></li>
                <li class="active"><a href="/">Home</a></li>

                <li><a href="#contact">Contact</a></li>
            </ul>
        </div><!--/.nav-collapse -->
    </div>
</nav>
<br><br>
<%--Displays links to view user Database--%>
<div class="container col-lg-12 spacer">
<p><a href="/listusers">View Users</a>  |  <a href="/listjobs">View Jobs</a></p>
</div>
<%--<a href="/showAPI">API</a>--%>
<%--<form action="/showAPI" method="get">--%>
    <%--<input type="text" name="firstName" placeholder="first name">--%>
    <%--<input type="text" name="lastName" placeholder="last name">--%>
    <%--&lt;%&ndash;<input type="text" name="dob" placeholder="yyyy-mm-dd">&ndash;%&gt;--%>
    <%--<input type="submit" value="Search">--%>
<%--</form>--%>
<div class="container col-lg-12 spacer"></div>
<div class="container col-lg-12 block">
    <div class="row col-xs-6 block2 bg-primary center">
        <form method="post" action="/showAPI"  class="form-horizontal" role="form" align="center">
            <div class="form-group" >
                <font color="gray" align="center"><strong>${message}</strong></font><br><br>
                <label class="control-label col-sm-3"  for="first name"><font color="gray">first name</font></label>
                <div class="col-sm-8 col-xs-12">
                    <input type="text" color="black" name="firstName" id="first name" placeholder="first name" required="true" class="form-control"/>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-3" for="last name"><font color="gray">last name</font></label>
                <div class="col-sm-8 col-xs-12">
                    <input type="text" name="lastName" id="last name" placeholder="last name" required="true" class="form-control"/>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-8">
                    <input type="submit" name="search" id="search" value="Search" class="btn btn-default"/>
                </div>
            </div>
        </form>
    </div>

</div><!-- /.container -->

<br>
${dbresult}
<br>
<br>
${allthejson}


<table class="table table-bordered">
    <c:forEach var = "myvar" items = "${uList}">

        <tr>
            <td>${myvar.firstName}</td>
            <td>${myvar.lastName}</td>
            <td>${myvar.birthday}</td>
            <td>${myvar.email}</td>
            <td>${myvar.address}</td>
            <td>${myvar.zip}</td>
            <td>${myvar.phoneNumber}</td>
            <td>--${myvar.crimetype}--</td>
            <td><a href="deleteuser?id=${myvar.idUsers}"> Delete </a> </td>
            <td>
                <a href="updatecrimetype?id=${myvar.idUsers}">
                    <button value="Edit Item">Edit</button>
                </a>
                </form> </td>
        </tr>

    </c:forEach>

    <c:forEach var = "myvar" items = "${jList}">
    <thead>
        <tr>
            <td>${myvar.jobId}</td>
            <td>${myvar.company}</td>
            <td>${myvar.jobTitle}</td>
            <td>${myvar.jobDescription}</td>
            <%--<td>--${myvar.crimetype}--</td>--%>
            <td><a href="deletejob?id=${myvar.jobId}"> Delete </a> </td>
        </tr>
    </thead>
    </c:forEach>

</table>

<!-- Bootstrap core JavaScript -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>



</body>
</html>
