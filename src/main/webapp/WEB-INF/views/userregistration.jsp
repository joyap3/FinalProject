<%--
  Created by IntelliJ IDEA.
  User: Steve
  Date: 8/7/2017
  Time: 14:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>User Registration</title>

    <!-- BOOTSTRAP STYLES-->
    <link href="resource/theme/bs-admin/assets/css/bootstrap.css" rel="stylesheet"/>
    <!-- FONTAWESOME STYLES-->
    <link href="resource/theme/bs-admin/assets/css/custom.css" rel="stylesheet"/>
    <!-- CUSTOM STYLES-->
    <link href="resource/theme/bs-admin/assets/css/font-awesome.css" rel="stylesheet"/>
    <!-- GOOGLE FONTS-->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'/>
    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">

    <style>
        body {
            padding-top: 5px;
            background-color: #b9b5b4;
        }
        .spacer {
            margin-top: 2%;
            margin-bottom: 2%;
        }
        .block {
            height: 700px;
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
<%--<a href="registerjob">register job</a>--%>
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

<div class="container col-lg-12 spacer">
    <div class="container col-lg-12 block">

        <div class="row col-xs-6 block2 bg-primary center">

            <form name="registerUser" method="post" action="/insertUser" onsubmit="return validateForm()" class="form-horizontal" role="form" align="center">
                <div class="form-group"><br>
                    <label class="control-label col-sm-3" for="firstName"><font color="gray">first name</font></label>
                    <div class="col-sm-8 col-xs-12">
                        <input type="text" name="firstName" id="firstName" placeholder="first name" required="true"
                               class="form-control"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-3" for="middleName"><font color="gray">middle name</font></label>
                    <div class="col-sm-8 col-xs-12">
                        <input type="text" name="middleName" id="middleName" placeholder="middle name" required="true"
                               class="form-control"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-3" for="lastName"><font color="gray">last name</font></label>
                    <div class="col-sm-8 col-xs-12">
                        <input type="text" name="lastName" id="lastName" placeholder="last name" required="true"
                               class="form-control"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-3" for="birthday"><font color="gray">date of birth</font></label>
                    <div class="col-sm-8 col-xs-12">
                        <input type="date" name="birthday" id="birthday" placeholder="date of birth" required="true"
                               class="form-control"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-3" for="address"><font color="gray">address</font></label>
                    <div class="col-sm-8 col-xs-12">
                        <input type="text" name="address" id="address" placeholder="address" required="true"
                               class="form-control"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-3" for="zip"><font color="gray">zip code</font></label>
                    <div class="col-sm-8 col-xs-12">
                        <input type="text" name="zip" id="zip" placeholder="zip code" required="true"
                               class="form-control"/>
                    </div>
                </div>
                    <div class="form-group">
                        <label class="control-label col-sm-3" for="phoneNumber"><font color="gray">phone number</font></label>
                        <div class="col-sm-8 col-xs-12">
                            <input type="tel" name="phoneNumber" id="phoneNumber" placeholder="phone number" required="true"
                                   class="form-control"/>
                        </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-3" for="email"><font color="gray">email</font></label>
                    <div class="col-sm-8 col-xs-12">
                        <input type="email" name="email" id="email" placeholder="email" required="true"
                               class="form-control"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-3" for="password"><font color="gray">password</font></label>
                    <div class="col-sm-8 col-xs-12">
                        <input type="password" name="password" id="password" placeholder="password" required="true"
                               class="form-control"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-3" for="cfPassword"><font color="gray">confirm password</font></label>
                    <div class="col-sm-8 col-xs-12">
                        <input type="password" name="cfPassword" id="cfPassword" placeholder="confirm password" required="true"
                               class="form-control"/>
                    </div>
                </div>
                <div>
                    <td><font color="gray">Skill-set:</font>

                    <font color="gray">
                    <select name="skillSet">

                        <option value="Trade Worker">Trade Worker</option>
                        <option value="Administration">Administration</option>
                        <option value="Technology">Technology</option>
                        <option value="Business">Business</option>
                        <option value="Sales">Sales</option>
                        <option value="Public Service">Public Service</option>
                        <option value="Other">Other</option>
                    </select>
                    </font>
                </div><br>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-8">
                        <input type="submit" name="submit" id="submit" value="Submit" class="btn btn-default"/>
                    </div>
                </div>
            </form>
            <font color="gray">Already registered with us? </font><a href="/login">Login here</a>
        </div>


    </div>
</div>

<script src="/resource/registervalidation.js"></script>

<!-- Bootstrap core JavaScript -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

</body>
</html>
