<%--
  Created by IntelliJ IDEA.
  User: ericm
  Date: 8/15/2017
  Time: 3:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">


    <title>180 Login</title>

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
            height: 460px;
            padding-top: 15px;
            background: center no-repeat;
            background-image: url("${pageContext.request.contextPath}../resource/theme/img/login2.jpg");
            /*background-color: darkorange;*/

        }

        .block2 {
            min-height: 160px;
            padding-top: 40px;
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
        input[type=checkbox] {width:15px; height:15px;}
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

<div class="container col-lg-12 spacer"></div>


<div class="container col-lg-12 block">

    <div class="row col-xs-6 block2 bg-primary center">

        <form method="post" action="/updateemployer" class="form-horizontal" role="form" align="center">
            <div class="form-group">
                <label class="control-label col-sm-3" for="companyname"><font color="gray">company name</font></label>
                <div class="col-sm-8 col-xs-12">
                    <input type="text" name="company" id="companyname" value="${employerProfile.company}" required="true"
                           class="form-control"/>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-3" for="jobtitle"><font color="gray">job title</font></label>
                <div class="col-sm-8 col-xs-12">
                    <input type="text" name="jobTitle" id="jobtitle" value="${employerProfile.jobTitle}" required="true"
                           class="form-control"/>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-3" for="contactname"><font color="gray">contact name</font></label>
                <div class="col-sm-8 col-xs-12">
                    <input type="text" name="contactName" id="contactname" value="${employerProfile.contactName}" required="true"
                           class="form-control"/>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-3" for="contactphone"><font color="gray">contact phone</font></label>
                <div class="col-sm-8 col-xs-12">
                    <input type="tel" name="contactPhone" id="contactphone" value="${employerProfile.contactPhone}" required="true"
                           class="form-control"/>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-3" for="email"><font color="gray">email</font></label>
                <div class="col-sm-8 col-xs-12">
                    <input type="email" name="contactEmail" id="email" value="${employerProfile.contactEmail}" required="true"
                           class="form-control"/>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-3" for="jobdescript"><font color="gray">job
                    description</font></label>
                <div class="col-sm-8 col-xs-12">
                    <input type="text" name="jobDescription" id="jobdescript" value="${employerProfile.jobDescription}" required="true"
                           class="form-control"/>
                </div>
            </div>
            <div>
                <td><font color="gray">Update to hire potential Job Seekers with a violent background?</font></td>
                <td>
                    <font color="gray"><select name="crimetype" required="true"></font>
                    <option value="Violent">Yes</option>
                    <option value="Non-Violent">No</option>
                    </select>
                </td>
            </div><br>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-8">
                    <input type="submit" name="submit" id="submit" value="Submit" class="btn btn-default"/>
                </div>
            </div>
        </form>
    </div>


</div><!-- /.container -->


<!-- Bootstrap core JavaScript -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

</body>
</html>