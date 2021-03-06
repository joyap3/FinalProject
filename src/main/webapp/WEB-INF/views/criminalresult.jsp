<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: kuwu
  Date: 2017/08/14
  Time: 16:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Criminal Results</title>

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

<br>
<%--${index}--%>
<%--${fName}--%>
<%--${lName}--%>
<%--${dob}--%>
<%--${sex}--%>
<%--${race}--%>
<%--${desc}--%>
<%--${caseNum}--%>
<%--${jurisd}--%>
<div>
    <div class="container col-lg-12 spacer"></div>
    <div class="container col-lg-12 block">
        <div class="row col-xs-6 block2 bg-primary center">
            <form method="post" action="/showAPI" class="form-horizontal" role="form" align="center">
                <div class="form-group">
                    <font color="gray" align="center"><strong>${message}</strong></font><br><br>
                    <label class="control-label col-sm-3" for="first name"><font color="gray">first name</font></label>
                    <div class="col-sm-8 col-xs-12">
                        <input type="text" color="black" name="firstName" id="first name" placeholder="first name"
                               required="true" class="form-control"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-3" for="last name"><font color="gray">last name</font></label>
                    <div class="col-sm-8 col-xs-12">
                        <input type="text" name="lastName" id="last name" placeholder="last name" required="true"
                               class="form-control"/>
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
</div>

<div>
    <table class="table table-bordered">
        <c:forEach var="myvar" items="${cList}" varStatus="status">
            <tr>
                <td>${myvar.firstName}</td>
                <td>${myvar.lastName}</td>
                    <%--<td>${myvar.fullName}</td>--%>
                <td>${myvar.dob}</td>
                <td>${myvar.sex}</td>
                <td>${myvar.race}</td>
                <td>${myvar.description}</td>
                    <%--<td>--${myvar.category}--</td>--%>
                <td>${myvar.casenumber}</td>
                <td>${myvar.jurisdiction}</td>
                <td>
                    <a href="criminalchoice?id=${status.index}&fName=${myvar.firstName}&lName=${myvar.lastName}&dob=${myvar.dob}&sex=${myvar.sex}&race=${myvar.race}&desc=${myvar.description}&caseNum=${myvar.casenumber}&jurisd=${myvar.jurisdiction}">
                        <button value="Edit Item">Select</button>
                    </a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
<div>
    ${newtable}
    <a href="/listusers">
        <button value="Update User">Update Users</button>
    </a>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
</html>
