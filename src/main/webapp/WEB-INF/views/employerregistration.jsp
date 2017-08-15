<%--
  Created by IntelliJ IDEA.
  User: ericm
  Date: 8/14/2017
  Time: 9:16 PM
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

        .text-nowrap {
            white-space: nowrap;
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

<nav class="navbar navbar-inverse navbar-fixed-top ">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"
                    aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand " href="/">180</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
            <ul class="nav navbar-nav navbar-right">
                <li class="active"><a href="/">Home</a></li>
                <!-- <li><a href="#about">About</a></li> -->
                <li><a href="#contact">Contact</a></li>
            </ul>
        </div><!--/.nav-collapse -->
    </div>
</nav>

<div class="container col-lg-12 spacer"></div>


<div class="container col-lg-12 block">

    <div class="row col-xs-6 block2 bg-primary center">

        <form method="post" action="/insertEmployer" class="form-horizontal" role="form" align="center">
            <div class="form-group">
                <label class="control-label col-sm-3" for="companyname"><font color="gray">company name</font></label>
                <div class="col-sm-8 col-xs-12">
                    <input type="text" name="company" id="companyname" placeholder="company name" required="true"
                           class="form-control"/>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-3" for="jobtitle"><font color="gray">job title</font></label>
                <div class="col-sm-8 col-xs-12">
                    <input type="text" name="jobTitle" id="jobtitle" placeholder="job title" required="true"
                           class="form-control"/>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-3" for="contactname"><font color="gray">contact name</font></label>
                <div class="col-sm-8 col-xs-12">
                    <input type="text" name="contactName" id="contactname" placeholder="contact name" required="true"
                           class="form-control"/>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-3" for="contactphone"><font color="gray">contact phone</font></label>
                <div class="col-sm-8 col-xs-12">
                    <input type="tel" name="contactPhone" id="contactphone" placeholder="contact phone" required="true"
                           class="form-control"/>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-3" for="email"><font color="gray">email</font></label>
                <div class="col-sm-8 col-xs-12">
                    <input type="email" name="contactEmail" id="email" placeholder="email" required="true"
                           class="form-control"/>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-3" for="jobdescript"><font color="gray">job
                    description</font></label>
                <div class="col-sm-8 col-xs-12">
                    <input type="text" name="jobDescription" id="jobdescript" placeholder="job description" required="true"
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
                <strong><font color="gray" size="2">Jobseeker with violent conviction history can apply.</font></strong>
                <input type="checkbox" name="crimetype" value="0" ><strong><font color="gray" size="2">Y</font></strong>
                <input type="checkbox" name="crimetype" value="1" ><strong><font color="gray" size="2">N</font></strong>
            </div>
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