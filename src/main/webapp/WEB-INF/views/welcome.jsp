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


</style>
</head>
<body>

<section id="cover">
    <div id="cover-caption">
        <div class="container">
            <div class="col-sm-10 col-sm-offset-1">
                <h1 class="display-3">Welcome to 180</h1>
                <p>Just like the old 180, but better. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Optio
                    quibusdam quis, repudiandae reprehenderit doloremque fugiat molestias, corporis voluptas.</p>
                <a href="#" data-toggle="modal" data-target="#login-modal"><h1><strong>Login</strong></h1></a>
                <div class="modal fade" id="login-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                     aria-hidden="true" style="display: none;">
                    <div class="modal-dialog">
                        <div class="loginmodal-container">
                            <h1>Login to Your Account</h1><br>
                            <form action="/loginUser" method="post">
                                ${invalid}
                                <input type="text" name="user" placeholder="Username">
                                <input type="password" name="pass" placeholder="Password">
                                <input type="submit" name="login" class="login loginmodal-submit" value="Login">
                            </form>

                            <div class="login-help">
                                <a href="/registerUser">Register</a> - <a href="/registerJob">Register Job</a>
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


<nav class="navbar navbar-dark bg-inverse navbar-full" id="nav-main">
    <a class="navbar-brand" href="#">180</a>
    <ul class="nav navbar-nav">
        <li class="nav-item active">
            <a class="nav-link" href="#what-we-do">Employers <span class="sr-only">(current)</span></a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="#what-we-do">Users</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="#news">Jobs</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="#about">About</a>
        </li>
    </ul>
    <form class="form-inline pull-xs-right">
        <input class="form-control" type="text" placeholder="Search">
        <button class="btn btn-success-outline" type="submit">Search</button>
    </form>
</nav>


<section id="carousel">
    <div id="carousel-home" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
            <li data-target="#carousel-home" data-slide-to="0" class="active"></li>
            <li data-target="#carousel-home" data-slide-to="1"></li>
            <li data-target="#carousel-home" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner" role="listbox">
            <div class="carousel-item active">
                <img src="${pageContext.request.contextPath}../resource/theme/img/woman-camera.JPG"/>
                <div class="carousel-caption">
                    <h3>Site layout</h3>
                    <p>Steve at the whiteboard</p>
                </div>
            </div>
            <div class="carousel-item">
                <img src="${pageContext.request.contextPath}../resource/theme/mg/spiderweb.JPG"/>
                <div class="carousel-caption">
                    <h3>Walkthrough</h3>
                    <p>Checking the flow</p>
                </div>
            </div>
            <div class="carousel-item">
                <img src="${pageContext.request.contextPath}../resource/theme/img/hearthand.JPG"/>
                <div class="carousel-caption">
                    <h3>Feedback Loop</h3>
                    <p>Eric notices that...</p>
                </div>
            </div>
        </div>
        <a class="left carousel-control" href="#carousel-home" role="button" data-slide="prev">
            <span class="icon-prev" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#carousel-home" role="button" data-slide="next">
            <span class="icon-next" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
</section>


<section id="what-we-do">
    <div class="section-content">
        <div class="container">
            <h2>What we do</h2>
            <p class="lead">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Qui accusantium commodi non quod
                mollitia animi, totam quia labore ex est ut delectus consectetur explicabo eveniet maiores, cumque aut
                repudiandae. Natus!</p>

            <div class="row">
                <div class="col-sm-12">
                    <div class="card-group">
                        <div class="card">
                            <div class="card-block">
                                <h4 class="card-title">Employers</h4>
                                <h6 class="card-subtitle">Post your JOBS</h6>
                            </div>
                            <img src="${pageContext.request.contextPath}../resource/theme/img/programming.jpg"/>
                            <div class="card-block">
                                <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
                                <button type="button" class="btn btn-success-outline" data-toggle="modal"
                                        data-target="#myModal">Add Job
                                </button>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-block">
                                <h4 class="card-title">JOB SEARCH</h4>
                                <h6 class="card-subtitle">Find work today</h6>
                            </div>
                            <img src="${pageContext.request.contextPath}../resource/theme/img/working.jpg"/>
                            <div class="card-block">
                                <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sequi
                                    debitis fugit molestias dignissimos, id hic officiis quam possimus tenetur minima
                                    voluptatibus accusantium, numquam voluptates velit, dicta maiores dolor quo
                                    expedita.</p>
                                <button type="button" class="btn btn-success-outline" data-toggle="modal"
                                        data-target="#myModal">Search for work
                                </button>
                            </div>
                        </div>

                        <div class="card">
                            <div class="card-block">
                                <h4 class="card-title">Training &amp; Support</h4>
                                <h6 class="card-subtitle">Help is here</h6>
                            </div>
                            <img src="${pageContext.request.contextPath}../resource/theme/img/chalkboard.jpg"/>
                            <div class="card-block">
                                <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sequi
                                    debitis fugit molestias dignissimos, id hic officiis quam possimus tenetur minima
                                    voluptatibus accusantium.</p>
                                <button type="button" class="btn btn-success-outline" data-toggle="modal"
                                        data-target="#myModal">Get Help
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>


<section id="about">
    <div class="section-content">
        <div class="container">
            <div class="col-md-6">
                <div class="about-text">
                    <h3>About Us</h3>
                    <p class="lead">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Minima culpa nostrum
                        voluptates praesentium quia, quae, dolor aperiam possimus architecto, tempore unde! Quasi fugit
                        voluptate, maiores adipisci commodi nemo rem cumque.</p>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Error eum mollitia sit dolorem autem
                        qui possimus ex voluptate, voluptatibus iste unde numquam illum, molestiae reprehenderit,
                        eligendi. Illum quod esse voluptatibus.</p>
                    <h5>Follow me on the web</h5>
                    <a href="" class="btn btn-sm btn-secondary-outline">twitter</a>
                    <a href="" class="btn btn-sm btn-secondary-outline">facebook</a>
                    <a href="" class="btn btn-sm btn-secondary-outline">youtube</a>
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
                            <img src="${pageContext.request.contextPath}../resource/theme/img/chalkboard.jpg"/>
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
                            <img src="${pageContext.request.contextPath}../resource/theme/img/computer.jpg"/>

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
                <p>uncopyright 2017. do what you want.</p>
                <p>stolen by kurt from <a href="http://bradhussey.ca/">brad</a></p>
            </div>
            <div class="col-sm-3">
                <ul class="list-unstyled">
                    <li><a href="#cover">home</a></li>
                    <li><a href="#what-we-do">what we do</a></li>
                    <li><a href="#about">about</a></li>
                    <li><a href="#news">latest</a></li>
                </ul>
            </div>
            <div class="col-sm-3">
                <ul class="list-unstyled">
                    <li><a href="">facebook</a></li>
                    <li><a href="">twitter</a></li>
                    <li><a href="">youtube</a></li>
                    <li><a href="">linkedin</a></li>
                </ul>
            </div>
            <div class="col-sm-3">
                <h6>a tiny header</h6>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Numquam expedita fugit saepe, eum ad, quam!
                    Eum magnam suscipit nulla ullam aliquam consectetur provident, nihil consequuntur porro labore
                    asperiores corrupti esse?</p>
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
