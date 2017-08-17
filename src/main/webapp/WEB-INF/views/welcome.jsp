<%--
  Created by IntelliJ IDEA.
  User: joyapuryear
  Date: 7/21/17
  Time: 11:04 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
    <title>180</title>
    <meta charset="utf-8">

    <!-- IMPORTANT: this sets the  -->
    <meta name="viewport" content="width=device-width, initial-scale=1,shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <%--${message}<a href = "/registerJob">Register Job</a>--%>
    <%--<br>--%>
    <%--<a href = "/registerUser">Register User</a>--%>

    <!-- Bootstrap CSS -->
    <spring:url value="/resource/theme/bower_components/bootstrap/dist/css/bootstrap.min.css" var="bootstrapCss"/>
    <!-- Custom CSS -->
    <spring:url value="/resource/theme/styles.css" var="stylesCss"/>
    <spring:url value="/resource/theme/bower_components/bootstrap/jquery/dist/jquery.js" var="jqueryJs"/>
    <spring:url value="/resource/theme/bower_components/bootstrap/dist/js/bootstrap.js/bootstrap.min.js" var="bootJs"/>
    <spring:url value="/resource/js/main.js" var="mainJs"/>


    <link href="${bootstrapCss}" rel="stylesheet"/>
    <link href="${stylesCss}" rel="stylesheet"/>
    <script src="${jqueryJs}"></script>
    <script src="${bootJsJs}"></script>


    <!-- Latest compiled and minified JavaScript -->
    <%--<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"--%>
    <%--integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"--%>
    <%--crossorigin="anonymous"></script>--%>


    <%--<!-- Latest compiled and minified CSS -->--%>
    <%--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"--%>
    <%--integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">--%>


    <style>
        h1 {
            text-shadow: 2px 2px rgba(107, 105, 106, 0.98);
        }


    </style>
</head>
<body>
<nav class="navbar navbar-dark bg-inverse navbar-fixed-top navbar-full" id="nav-main">
    <a class="navbar-brand" href="#"><img src="${pageContext.request.contextPath}../resource/theme/img/logo.png"/></a>
    <ul class="nav navbar-nav">
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
            <a class="nav-link" href="#about">About</a>
        </li>

    </ul>
    <div class="nav-item" align="right">
        <span style="float:right">
            <ul class="nav navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="/login">${profile}</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/logout">Log Out</a>
                </li>
            </ul>
        </span>
    </div>
</nav>


<section id="cover">
    <br>
    <div id="cover-caption">
        <div class="container">
            <div class="col-sm-10 col-sm-offset-1">
                <br>
                <br>
                <h1 class="display-3">Welcome to 180</h1>
                <p>180 provides a digital space find work, offer work and connect with groups and organizations that
                    foster
                    life skills. Seeking to improve the lives of people affected by a felony conviction.</p>
                <a href="#" data-toggle="modal" data-target="#login-modal"><h3><strong>Login</strong></h3></a>
                <div class="modal fade" id="login-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                     aria-hidden="true" style="display: none;">
                    <div class="modal-dialog">
                        <div class="loginmodal-container">
                            <h1>Login to Your Account</h1><br><br>
                            <form action="/loginUser" method="post">
                                <font color="gray"><input type="text" name="user" placeholder="User Email"></font>
                                <font color="gray"><input type="password" name="pass" placeholder="Password"></font>
                                <input type="submit" name="login" class="login loginmodal-submit" value="Login">
                            </form>

                            <div class="login-help">
                                <a href="/registerUser"><font color="white">Register</font></a> - - <a
                                    href="/registerEmployer"><font color="white">Employer Registration</font></a>
                            </div>
                        </div>
                    </div>
                </div>

                <br>

                <a href="#nav-main" class="btn btn-secondary-outline btn-sm" role="button">&darr;</a>
            </div>
        </div>
    </div>
</section>


<%--<section id="carousel">--%>
<%--<div id="carousel-home" class="carousel slide" data-ride="carousel">--%>
<%--<ol class="carousel-indicators">--%>
<%--<li data-target="#carousel-home" data-slide-to="0" class="active"></li>--%>
<%--<li data-target="#carousel-home" data-slide-to="1"></li>--%>
<%--<li data-target="#carousel-home" data-slide-to="2"></li>--%>
<%--</ol>--%>
<%--<div class="carousel-inner" role="listbox">--%>
<%--<div class="carousel-item active">--%>
<%--<img src="${pageContext.request.contextPath}../resource/theme/img/woman-camera.JPG"/>--%>
<%--<div class="carousel-caption">--%>
<%--</div>--%>
<%--</div>--%>
<%--<div class="carousel-item">--%>
<%--<img src="${pageContext.request.contextPath}../resource/theme/mg/spiderweb.JPG"/>--%>
<%--<div class="carousel-caption">--%>
<%--<h3>Walkthrough</h3>--%>
<%--<p>Checking the flow</p>--%>
<%--</div>--%>
<%--</div>--%>
<%--<div class="carousel-item">--%>
<%--<img src="${pageContext.request.contextPath}../resource/theme/img/hearthand.JPG"/>--%>
<%--<div class="carousel-caption">--%>
<%--<h3>Feedback Loop</h3>--%>
<%--<p>Eric notices that...</p>--%>
<%--</div>--%>
<%--</div>--%>
<%--</div>--%>
<%--<a class="left carousel-control" href="#carousel-home" role="button" data-slide="prev">--%>
<%--<span class="icon-prev" aria-hidden="true"></span>--%>
<%--<span class="sr-only">Previous</span>--%>
<%--</a>--%>
<%--<a class="right carousel-control" href="#carousel-home" role="button" data-slide="next">--%>
<%--<span class="icon-next" aria-hidden="true"></span>--%>
<%--<span class="sr-only">Next</span>--%>
<%--</a>--%>
<%--</div>--%>
<%--</section>--%>
<section id="about">
    <div class="section-content">
        <div class="container">
            <div class="col-md-6">
                <div class="about-text">
                    <h3>About Us</h3>
                    <p class="lead">Our team at OneEighty is comprised of dedicated individuals that work to connect
                        parolees and re-entry citizens with companies and business who are looking for dedicated
                        workers.</p>
                    <p>Our name stems from the idea that you can turn your life around -- do a complete 180 -- and
                        it all starts here. We are dedicated to help you find the right job, and provide you with the
                        right support.</p>
                    <h5>Meet the Team</h5>
                    <a href="https://www.linkedin.com/in/stevensuzio" class="btn btn-sm btn-secondary-outline">Steve
                        Suzio</a>
                    <a href="https://www.linkedin.com/in/EricMMackey" class="btn btn-sm btn-secondary-outline">Eric
                        Mackey</a>
                    <a href="https://www.linkedin.com/in/k-c-wunderlich" class="btn btn-sm btn-secondary-outline">Kurt
                        Wunderlich</a>
                    <a href="https://www.linkedin.com/in/joyapuryear" class="btn btn-sm btn-secondary-outline">Joya
                        Puryear</a>
                </div>
            </div>
        </div>
    </div>
</section>

<section id="what-we-do">
    <div class="section-content">
        <div class="container">
            <h2>What we do</h2>
            <p class="lead">180 provides a network in partnership with Companies, Foundations, and Out Reach Programs to
                create lasting change in the lives of once convicted parolees.</p>
            <div class="row">
                <div class="col-sm-12">
                    <div class="card-group">
                        <div class="card">
                            <div class="card-block">
                                <h4 class="card-title">Employers</h4>
                                <h6 class="card-subtitle">Post a Job</h6>
                            </div>
                            <img src="${pageContext.request.contextPath}../resource/theme/img/programming.jpeg"/>
                            <div class="card-block">
                                <p class="card-text">Have a position you would like to fill?
                                    Click the button below to register and immediately post your job!</p>
                                <a href="/registerEmployer">
                                    <button type="button" class="btn btn-success-outline" data-toggle="modal"
                                            data-target="#myModal">Add Job
                                    </button>
                                </a>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-block">
                                <h4 class="card-title">Job Seekers</h4>
                                <h6 class="card-subtitle">Find work today</h6>
                            </div>
                            <img src="${pageContext.request.contextPath}../resource/theme/img/working.jpeg"/>
                            <div class="card-block">
                                <p class="card-text">Looking for work but can't find it? Register with us to find
                                    employers
                                    that are looking for potential candidates like you!</p>
                                <a href="/viewJobBoard">
                                    <button type="button" class="btn btn-success-outline">View Jobs</button>
                                </a>
                            </div>
                        </div>

                        <div class="card">
                            <div class="card-block">
                                <h4 class="card-title">Training &amp; Support</h4>
                                <h6 class="card-subtitle">Help is here</h6>
                            </div>
                            <img src="${pageContext.request.contextPath}../resource/theme/img/chalkboard.jpeg"/>
                            <div class="card-block">
                                <p class="card-text">Our team at 180 works with several partners in the area to help our
                                    candidates
                                    be as career ready as possible. If you are looking to further develop your skills,
                                    or to simply seek out
                                    additional help we have the resources to connect you today.</p>
                                <a href="/supportpage">
                                    <button type="button" class="btn btn-success-outline" data-toggle="modal"
                                            data-target="#myModal">Get Support
                                    </button>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>


<section id="news">
    <div class="section-content">
        <div class="container">

            <h3>Latest Jobs and News</h3>
            <p class="lead">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Vero placeat debitis ad vitae
                repudiandae architecto, ipsum tenetur odio animi nulla nihil deleniti voluptatibus et in incidunt
                consequuntur! Assumenda, suscipit, sunt!</p>
            <hr>
            <div class="row">
                <div class="col-sm-12">

                    <div class="card-columns">
                        <div class="card">
                            <img src="${pageContext.request.contextPath}../resource/theme/img/woman-camera.JPG"/>

                            <div class="card-block">
                                <h4 class="card-title">Card title that wraps to a new line</h4>
                                <p class="card-text">This is a longer card with supporting text below as a natural
                                    lead-in to additional content. This content is a little bit longer.</p>
                            </div>
                        </div>
                        <div class="card card-block">
                            <img src="${pageContext.request.contextPath}../resource/theme/img/chalkboard.jpeg"/>
                            <blockquote class="card-blockquote">
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a
                                    ante.</p>
                                <footer>
                                    <small class="text-muted">
                                        Someone famous in <cite title="Source Title">Source Title</cite>
                                    </small>
                                </footer>
                            </blockquote>
                        </div>
                        <div class="card">
                            <img src="${pageContext.request.contextPath}../resource/theme/img/stars.jpg"/>

                            <div class="card-block">
                                <h4 class="card-title">Card title</h4>
                                <p class="card-text">This card has supporting text below as a natural lead-in to
                                    additional content.</p>
                                <p class="card-text">
                                    <small class="text-muted">Last updated 3 mins ago</small>
                                </p>
                            </div>
                        </div>
                        <div class="card card-block card-inverse card-primary text-xs-center">
                            <blockquote class="card-blockquote">
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat.</p>
                                <footer>
                                    <small>
                                        Someone famous in <cite title="Source Title">Source Title</cite>
                                    </small>
                                </footer>
                            </blockquote>
                        </div>
                        <div class="card card-block text-xs-center">
                            <h4 class="card-title">Card title</h4>
                            <p class="card-text">This card has supporting text below as a natural lead-in to additional
                                content.</p>
                            <p class="card-text">
                                <small class="text-muted">Last updated 3 mins ago</small>
                            </p>
                        </div>
                        <div class="card">
                            <img src="${pageContext.request.contextPath}../resource/theme/img/programming.jpeg"/>

                        </div>
                        <div class="card card-block text-xs-right card-warning card-inverse">
                            <blockquote class="card-blockquote">
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a
                                    ante.</p>
                                <footer>
                                    <small class="text-muted">
                                        Someone famous in <cite title="Source Title">Source Title</cite>
                                    </small>
                                </footer>
                            </blockquote>
                        </div>
                        <div class="card card-block">
                            <h4 class="card-title">Card title</h4>
                            <p class="card-text">This is a wider card with supporting text below as a natural lead-in to
                                additional content. This card has even longer content than the first to show that equal
                                height action.</p>
                            <p class="card-text">
                                <small class="text-muted">Last updated 3 mins ago</small>
                            </p>
                        </div>
                    </div>
                    <hr>
                    <nav class="text-xs-center">
                        <ul class="pagination">
                            <li class="page-item">
                                <a class="page-link" href="#" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                    <span class="sr-only">Previous</span>
                                </a>
                            </li>
                            <li class="page-item"><a class="page-link" href="#">1</a></li>
                            <li class="page-item"><a class="page-link" href="#">2</a></li>
                            <li class="page-item"><a class="page-link" href="#">3</a></li>
                            <li class="page-item"><a class="page-link" href="#">4</a></li>
                            <li class="page-item"><a class="page-link" href="#">5</a></li>
                            <li class="page-item">
                                <a class="page-link" href="#" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                    <span class="sr-only">Next</span>
                                </a>
                            </li>
                        </ul>
                    </nav>

                </div>
            </div>

        </div>
    </div>
</section>


<footer id="footer-main">
    <div class="container">
        <div class="row">
            <div class="col-sm-3">
                <p>OneEighty Copyright 2017</p>
                <p>Bootstrap contents stolen from <a href="http://bradhussey.ca/">brad</a></p>
            </div>
            <div class="col-sm-3">
                <ul class="list-unstyled">
                    <li><a href="#cover">Home</a></li>
                    <li><a href="#what-we-do">What we do</a></li>
                    <li><a href="#about">About</a></li>
                    <li><a href="#news">Latest</a></li>
                </ul>
            </div>
            <div class="col-sm-3">
                <ul class="list-unstyled">
                    <li><a href="/login">Profile</a></li>
                    <li><a href="/registerEmployer">Register Job</a></li>
                    <li><a href="/viewJobBoard">View Jobs</a></li>
                    <li><a href="/admin">Admin</a></li>
                </ul>
            </div>
            <div class="col-sm-3">
                <h6>Team OneEighty</h6>
                <ul>
                    <li>Steve Suzio</li>
                    <li>Kurt Wunderlich</li>
                    <li>Joya Puryear</li>
                    <li>Eric Mackey</li>
                </ul>
            </div>
        </div>
    </div>
</footer>


<!-- jQuery first, then Bootstrap JS. -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>


<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<%--<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>--%>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
        integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
        crossorigin="anonymous"></script>
</body>
</html>
