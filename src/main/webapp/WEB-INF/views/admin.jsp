<%--
  Created by IntelliJ IDEA.
  User: joyapuryear
  Date: 8/7/17
  Time: 10:48 PM
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Admin Page</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <!-- BOOTSTRAP STYLES-->
    <link href="resource/theme/bs-admin/assets/css/bootstrap.css" rel="stylesheet"/>
    <!-- FONTAWESOME STYLES-->
    <link href="resource/theme/bs-admin/assets/css/custom.css" rel="stylesheet"/>
    <!-- CUSTOM STYLES-->
    <link href="resource/theme/bs-admin/assets/css/font-awesome.css" rel="stylesheet"/>
    <!-- GOOGLE FONTS-->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'/>

    <style>

        body {
            padding-top: 50px;
            background-color: #b9b5b4;
        }


    </style>


</head>
<body>


<div id="wrapper">
    <div>
        <nav class="navbar navbar-light navbar-fixed-top  navbar-full" style="background-color:black;">
            <div align="left">
            <span style="float:left">
            <ul class="nav navbar-nav">
                <li class="nav-item">
                    <a class="navbar-brand" href="/"><img
                            src="${pageContext.request.contextPath}../resource/theme/img/logo.png"/></a>
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
                    <a class="nav-link" class="text-right" href="/login">${adminUser.firstName}</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/logout">Log Out</a>
                </li>
            </ul>
            </span>
            </div>
        </nav>
    </div>

    <div id="page-wrapper">
        <div id="page-inner">
            <div class="row">
                <div class="col-lg-12">
                    <h2>ADMIN DASHBOARD</h2>
                </div>
            </div>
            <!-- /. ROW  -->
            <hr/>
            <div class="row">
                <div class="col-lg-12 ">
                    <div class="alert alert-info">
                        <strong>Welcome ${adminUser.firstName}! </strong>
                    </div>
                </div>
            </div>
            <!-- /. ROW  -->
            <div class="row text-center pad-top">
                <div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">
                    <div class="div-square">
                        <a href="/">
                            <i class="fa fa-circle-o-notch fa-5x"></i>
                            <h4>Home Page</h4>
                        </a>
                    </div>
                </div>
                <div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">
                    <div class="div-square">
                        <a href="/listusers">
                            <i class="fa fa-users fa-5x"></i>
                            <h4>View Users</h4>
                        </a>
                    </div>
                </div>
                <div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">
                    <div class="div-square">
                        <a href="/listjobs">
                            <i class="fa fa-lightbulb-o fa-5x"></i>
                            <h4>View Jobs</h4>
                        </a>
                    </div>
                </div>
                <div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">
                    <div class="div-square">
                        <a href="/viewcriminalresults">
                            <i class="fa fa-user fa-5x"></i>
                            <h4>Background Search</h4>
                        </a>
                    </div>
                </div>
                    <div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">
                        <div class="div-square">
                            <a href="/goToRegisterAdmin">
                                <i class="fa fa-key fa-5x"></i>
                                <h4>Create New Administrator</h4>
                            </a>
                        </div>
                    </div>
                </div>

            </div>
            <!-- /. PAGE INNER  -->
        </div>
        <!-- /. PAGE WRAPPER  -->
    </div>
    <div class="footer" style="background-color:black;">

        <footer style="background-color:black;"></footer>
        <div class="row">
            <div class="col-lg-12">
            </div>
        </div>
    </div>


    <!-- /. WRAPPER  -->
    <!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
    <!-- JQUERY SCRIPTS -->
    <script src="assets/js/jquery-1.10.2.js"></script>
    <!-- BOOTSTRAP SCRIPTS -->
    <script src="assets/js/bootstrap.min.js"></script>
    <!-- CUSTOM SCRIPTS -->
    <script src="assets/js/custom.js"></script>


</body>
</html>