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
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Admin Page</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <!-- BOOTSTRAP STYLES-->
    <link href="resource/theme/bs-admin/assets/css/bootstrap.css" rel="stylesheet" />
    <!-- FONTAWESOME STYLES-->
    <link href="resource/theme/bs-admin/assets/css/custom.css" rel="stylesheet" />
    <!-- CUSTOM STYLES-->
    <link href="resource/theme/bs-admin/assets/css/font-awesome.css" rel="stylesheet" />
    <!-- GOOGLE FONTS-->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />

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
        <nav class="navbar navbar-light navbar-fixed-top  navbar-full"  style="background-color:black;">
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
    <%--<div class="navbar navbar-inverse navbar-fixed-top">--%>
        <%--<div class="adjust-nav">--%>
            <%--<div class="navbar-header">--%>
                <%--<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">--%>
                    <%--<span class="icon-bar"></span>--%>
                    <%--<span class="icon-bar"></span>--%>
                    <%--<span class="icon-bar"></span>--%>
                <%--</button>--%>
                <%--<a class="navbar-brand" href="#">--%>
                    <%--<img src="assets/img/logo.png" />--%>

                <%--</a>--%>

            <%--</div>--%>

            <%--<span class="logout-spn" >--%>
                  <%--<a href="/logout" style="color:white;">Logout</a>--%>

                <%--</span>--%>
        <%--</div>--%>
    <%--</div>--%>
    <%--<!-- /. NAV TOP  -->--%>
    <%--<nav class="navbar-default navbar-side" role="navigation">--%>
    <%--<div class="sidebar-collapse">--%>
    <%--<ul class="nav" id="main-menu">--%>



    <%--<li class="active-link">--%>
    <%--<a href="index.html" ><i class="fa fa-desktop "></i>Dashboard <span class="badge">Included</span></a>--%>
    <%--</li>--%>


    <%--<li>--%>
    <%--<a href="ui.html"><i class="fa fa-table "></i>UI Elements  <span class="badge">Included</span></a>--%>
    <%--</li>--%>
    <%--<li>--%>
    <%--<a href="blank.html"><i class="fa fa-edit "></i>Blank Page  <span class="badge">Included</span></a>--%>
    <%--</li>--%>


    <%--<li>--%>
    <%--<a href="#"><i class="fa fa-qrcode "></i>My Link One</a>--%>
    <%--</li>--%>
    <%--<li>--%>
    <%--<a href="#"><i class="fa fa-bar-chart-o"></i>My Link Two</a>--%>
    <%--</li>--%>

    <%--<li>--%>
    <%--<a href="#"><i class="fa fa-edit "></i>My Link Three </a>--%>
    <%--</li>--%>
    <%--<li>--%>
    <%--<a href="#"><i class="fa fa-table "></i>My Link Four</a>--%>
    <%--</li>--%>
    <%--<li>--%>
    <%--<a href="#"><i class="fa fa-edit "></i>My Link Five </a>--%>
    <%--</li>--%>

    <%--</ul>--%>
    <%--</div>--%>

    <%--</nav>--%>
    <!-- /. NAV SIDE  -->
    <div id="page-wrapper" >
        <div id="page-inner">
            <div class="row">
                <div class="col-lg-12">
                    <h2>ADMIN DASHBOARD</h2>
                </div>
            </div>
            <!-- /. ROW  -->
            <hr />
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
                        <a href="/" >
                            <i class="fa fa-circle-o-notch fa-5x"></i>
                            <h4>Home Page</h4>
                        </a>
                    </div>


                </div>

                <div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">
                    <div class="div-square">
                        <a href="/listusers" >
                            <i class="fa fa-users fa-5x"></i>
                            <h4>View Users</h4>
                        </a>
                    </div>


                </div>
                <div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">
                    <div class="div-square">
                        <a href="/listjobs" >
                            <i class="fa fa-lightbulb-o fa-5x"></i>
                            <h4>View Jobs</h4>
                        </a>
                    </div>


                </div>
                <div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">
                    <div class="div-square">
                        <a href="/viewcriminalresults" >
                            <i class="fa fa-user fa-5x"></i>
                            <h4>Background Search</h4>
                        </a>
                    </div>


                    </div>
                    <div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">
                    <div class="div-square">
                    <a href="/goToRegisterAdmin" >
                    <i class="fa fa-key fa-5x"></i>
                    <h4>Create New Administrator</h4>
                    </a>
                    </div>


                    <%--</div>--%>
                    <%--<div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">--%>
                    <%--<div class="div-square">--%>
                    <%--<a href="blank.html" >--%>
                    <%--<i class="fa fa-comments-o fa-5x"></i>--%>
                    <%--<h4>Support</h4>--%>
                    <%--</a>--%>
                    <%--</div>--%>


                    <%--</div>--%>
                    <%--</div>--%>
                    <%--<!-- /. ROW  -->--%>
                    <%--<div class="row text-center pad-top">--%>

                    <%--<div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">--%>
                    <%--<div class="div-square">--%>
                    <%--<a href="blank.html" >--%>
                    <%--<i class="fa fa-clipboard fa-5x"></i>--%>
                    <%--<h4>All Docs</h4>--%>
                    <%--</a>--%>
                    <%--</div>--%>


                    <%--</div>--%>
                    <%--<div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">--%>
                    <%--<div class="div-square">--%>
                    <%--<a href="blank.html" >--%>
                    <%--<i class="fa fa-gear fa-5x"></i>--%>
                    <%--<h4>Settings</h4>--%>
                    <%--</a>--%>
                    <%--</div>--%>


                    <%--</div>--%>
                    <%--<div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">--%>
                    <%--<div class="div-square">--%>
                    <%--<a href="blank.html" >--%>
                    <%--<i class="fa fa-wechat fa-5x"></i>--%>
                    <%--<h4>Live Talk</h4>--%>
                    <%--</a>--%>
                    <%--</div>--%>


                    <%--</div>--%>
                    <%--<div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">--%>
                    <%--<div class="div-square">--%>
                    <%--<a href="blank.html" >--%>
                    <%--<i class="fa fa-bell-o fa-5x"></i>--%>
                    <%--<h4>Notifications </h4>--%>
                    <%--</a>--%>
                    <%--</div>--%>


                    <%--</div>--%>
                    <%--<div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">--%>
                    <%--<div class="div-square">--%>
                    <%--<a href="blank.html" >--%>
                    <%--<i class="fa fa-rocket fa-5x"></i>--%>
                    <%--<h4>Launch</h4>--%>
                    <%--</a>--%>
                    <%--</div>--%>


                    <%--</div>--%>
                    <%--<div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">--%>
                    <%--<div class="div-square">--%>
                    <%--<a href="blank.html" >--%>
                    <%--<i class="fa fa-user fa-5x"></i>--%>
                    <%--<h4>Register User</h4>--%>
                    <%--</a>--%>
                    <%--</div>--%>


                    <%--</div>--%>
                    <%--</div>--%>
                    <%--<!-- /. ROW  -->--%>
                    <%--<div class="row text-center pad-top">--%>


                    <%--<div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">--%>
                    <%--<div class="div-square">--%>
                    <%--<a href="blank.html" >--%>
                    <%--<i class="fa fa-envelope-o fa-5x"></i>--%>
                    <%--<h4>Mail Box</h4>--%>
                    <%--</a>--%>
                    <%--</div>--%>


                    <%--</div>--%>
                    <%--<div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">--%>
                    <%--<div class="div-square">--%>
                    <%--<a href="blank.html" >--%>
                    <%--<i class="fa fa-lightbulb-o fa-5x"></i>--%>
                    <%--<h4>New Issues</h4>--%>
                    <%--</a>--%>
                    <%--</div>--%>


                    <%--</div>--%>
                    <%--<div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">--%>
                    <%--<div class="div-square">--%>
                    <%--<a href="blank.html" >--%>
                    <%--<i class="fa fa-users fa-5x"></i>--%>
                    <%--<h4>See Users</h4>--%>
                    <%--</a>--%>
                    <%--</div>--%>


                    <%--</div>--%>
                    <%--<div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">--%>
                    <%--<div class="div-square">--%>
                    <%--<a href="blank.html" >--%>
                    <%--<i class="fa fa-key fa-5x"></i>--%>
                    <%--<h4>Admin </h4>--%>
                    <%--</a>--%>
                    <%--</div>--%>


                    <%--</div>--%>
                    <%--<div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">--%>
                    <%--<div class="div-square">--%>
                    <%--<a href="#" >--%>
                    <%--<i class="fa fa-comments-o fa-5x"></i>--%>
                    <%--<h4>Support</h4>--%>
                    <%--</a>--%>
                    <%--</div>--%>


                    <%--</div>--%>
                    <%--<div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">--%>
                    <%--<div class="div-square">--%>
                    <%--<a href="blank.html" >--%>
                    <%--<i class="fa fa-circle-o-notch fa-5x"></i>--%>
                    <%--<h4>Check Data</h4>--%>
                    <%--</a>--%>
                    <%--</div>--%>


                    <%--</div>--%>
                    <%--</div>--%>
                    <%--<!-- /. ROW  -->--%>
                    <%--<div class="row text-center pad-top">--%>
                    <%--<div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">--%>
                    <%--<div class="div-square">--%>
                    <%--<a href="blank.html" >--%>
                    <%--<i class="fa fa-rocket fa-5x"></i>--%>
                    <%--<h4>Launch</h4>--%>
                    <%--</a>--%>
                    <%--</div>--%>


                    <%--</div>--%>
                    <%--<div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">--%>
                    <%--<div class="div-square">--%>
                    <%--<a href="blank.html" >--%>
                    <%--<i class="fa fa-clipboard fa-5x"></i>--%>
                    <%--<h4>All Docs</h4>--%>
                    <%--</a>--%>
                    <%--</div>--%>


                    <%--</div>--%>
                    <%--<div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">--%>
                    <%--<div class="div-square">--%>
                    <%--<a href="blank.html" >--%>
                    <%--<i class="fa fa-gear fa-5x"></i>--%>
                    <%--<h4>Settings</h4>--%>
                    <%--</a>--%>
                    <%--</div>--%>


                    <%--</div>--%>
                    <%--<div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">--%>
                    <%--<div class="div-square">--%>
                    <%--<a href="blank.html" >--%>
                    <%--<i class="fa fa-wechat fa-5x"></i>--%>
                    <%--<h4>Live Talk</h4>--%>
                    <%--</a>--%>
                    <%--</div>--%>


                    <%--</div>--%>
                    <%--<div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">--%>
                    <%--<div class="div-square">--%>
                    <%--<a href="blank.html" >--%>
                    <%--<i class="fa fa-bell-o fa-5x"></i>--%>
                    <%--<h4>Notifications </h4>--%>
                    <%--</a>--%>
                    <%--</div>--%>


                    <%--</div>--%>

                    <%--<div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">--%>
                    <%--<div class="div-square">--%>
                    <%--<a href="blank.html" >--%>
                    <%--<i class="fa fa-user fa-5x"></i>--%>
                    <%--<h4>Register User</h4>--%>
                    <%--</a>--%>
                    <%--</div>--%>


                    <%--</div>--%>
                    <%--</div>--%>
                    <%--<!-- /. ROW  -->--%>
                    <%--<div class="row text-center pad-top">--%>



                    <%--<div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">--%>
                    <%--<div class="div-square">--%>
                    <%--<a href="blank.html" >--%>
                    <%--<i class="fa fa-lightbulb-o fa-5x"></i>--%>
                    <%--<h4>New Issues</h4>--%>
                    <%--</a>--%>
                    <%--</div>--%>


                    <%--</div>--%>
                    <%--<div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">--%>
                    <%--<div class="div-square">--%>
                    <%--<a href="blank.html" >--%>
                    <%--<i class="fa fa-users fa-5x"></i>--%>
                    <%--<h4>See Users</h4>--%>
                    <%--</a>--%>
                    <%--</div>--%>


                    <%--</div>--%>
                    <%--<div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">--%>
                    <%--<div class="div-square">--%>
                    <%--<a href="blank.html" >--%>
                    <%--<i class="fa fa-key fa-5x"></i>--%>
                    <%--<h4>Admin </h4>--%>
                    <%--</a>--%>
                    <%--</div>--%>


                    <%--</div>--%>
                    <%--<div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">--%>
                    <%--<div class="div-square">--%>
                    <%--<a href="blank.html" >--%>
                    <%--<i class="fa fa-comments-o fa-5x"></i>--%>
                    <%--<h4>Support</h4>--%>
                    <%--</a>--%>
                    <%--</div>--%>


                    <%--</div>--%>
                    <%--<div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">--%>
                    <%--<div class="div-square">--%>
                    <%--<a href="blank.html" >--%>
                    <%--<i class="fa fa-circle-o-notch fa-5x"></i>--%>
                    <%--<h4>Check Data</h4>--%>
                    <%--</a>--%>
                    <%--</div>--%>


                    <%--</div>--%>
                    <%--<div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">--%>
                    <%--<div class="div-square">--%>
                    <%--<a href="blank.html" >--%>
                    <%--<i class="fa fa-envelope-o fa-5x"></i>--%>
                    <%--<h4>Mail Box</h4>--%>
                    <%--</a>--%>
                    <%--</div>--%>


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
        <div class="col-lg-12" >
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