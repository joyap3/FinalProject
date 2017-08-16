<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: kuwu
  Date: 2017/08/14
  Time: 16:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Criminal Results</title>
</head>
<body>
<div>
    <nav>
        <a class="nav-link" href="/">Home</a> |
        <a class="nav-link" href="/admin">Dashboard</a> |
        <a class="nav-link" href="/listusers">View Users</a> |
        <a class="nav-link" href="/listjobs">View Jobs</a> |
        <a class="nav-link" href="/logout">Log Out</a>
    </nav>
</div>
<br>
${index}
${fName}
${lName}
${dob}
${sex}
${race}
${desc}
${caseNum}
${jurisd}
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

</body>
</html>
