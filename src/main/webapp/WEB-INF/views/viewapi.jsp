<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: Steve
  Date: 8/10/2017
  Time: 14:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>View API</title>
</head>
<body>
<div>
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
</div>
${dbresult}
<div>
    <form id="updateUser" action="/crimetype" method="post">
        <table>
            <tr>
                <td>First Name:</td>
                <td><input name="firstName" value="${userProfile.firstName}"></td>
            </tr>
            <tr>
                <td>Middle Name:</td>
                <td><input name="middleName" value="${userProfile.middleName}"></td>
            </tr>
            <tr>
                <td>Last Name:</td>
                <td><input name="lastName" value="${userProfile.lastName}"></td>
            </tr>
            <tr>
                <td>Birthday:</td>
                <td><input name="birthday" value="${userProfile.birthday}"></td>
            </tr>
            <tr>
                <td>Address:</td>
                <td><input name="address" value="${userProfile.address}"></td>
            </tr>
            <tr>
                <td>Zip:</td>
                <td><input name="zip" value="${userProfile.zip}"></td>
            </tr>
            <tr>
                <td>Phone Number:</td>
                <td><input name="phoneNumber" value="${userProfile.phoneNumber}"></td>
            </tr>
            <tr>
                <td>email:</td>
                <td><input name="email" value="${userProfile.email}"></td>
            </tr>
            <tr>
                <td>Skill-set:</td>
                <td>
                    <select form="updateUser" name="skillSet">
                        <option selected>${userProfile.skillset}</option>
                        <option value="Trade Worker">Trade Worker</option>
                        <option value="Administration">Administration</option>
                        <option value="Technology">Technology</option>
                        <option value="Business">Business</option>
                        <option value="Sales">Sales</option>
                        <option value="Public Service">Public Service</option>
                        <option value="Other">Other</option>

                    </select>
                </td>
            </tr>
            <tr>
                <td>Crime Type:</td>
                <td>
                    <select form="updateUser" name="crimetype">
                        <option selected>${userProfile.crimetype}</option>
                        <option value="Violent">Violent</option>
                        <option value="Non-Violent">Non-Violent</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>
                    <input type="submit" value="Submit">
                </td>
            </tr>
        </table>
    </form>
</div>


</body>
</html>
