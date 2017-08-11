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
    <title>User Registration</title>

</head>
<body>
<%--<a href="registerjob">register job</a>--%>

<form name="registerUser" action="/insertUser" onsubmit="return validateForm()" method="post">
    <table>
        <tr>
            <td>First Name:</td>
            <td><input type="text" name="firstName"></td>
            <td><span class="invalid"></span></td>
        </tr>
        <tr>
            <td>Middle Name:</td>
            <td><input type="text" name="middleName"></td>
            <td><span class="invalid"></span></td>
        </tr>
        <tr>
            <td>Last Name:</td>
            <td><input type="text" name="lastName"></td>
            <td><span class="invalid"></span></td>
        </tr>
        <tr>
            <td>Date of Birth:</td>
            <td><input type="date" name="birthday"></td>
            <td><span class="invalid"></span></td>
        </tr>
        <tr>
            <td>Address:</td>
            <td><input type="text" name="address"></td>
            <td><span class="invalid"></span></td>
        </tr>
        <tr>
            <td>Zip Code:</td>
            <td><input type="text" name="zip"></td>
            <td><span class="invalid"></span></td>
        </tr>
        <tr>
            <td>Phone Number:</td>
            <td><input type="tel" name="phoneNumber"></td>
            <td><span class="invalid"></span></td>
        </tr>
        <tr>
            <td>Email:</td>
            <td><input type="email" name="email"></td>
            <td>${invalid}<span class="invalid"></span></td>
        </tr>
        <tr>
            <td>Password:</td>
            <td><input type="password" name="password"></td>
            <td><span class="invalid"></span></td>
        </tr>
        <tr>
            <td>Confirm Password:</td>
            <td><input type="password" name="cfPassword"></td>
            <td><span class="invalid"></span></td>
        </tr>
        <tr>
            <td>Skill-set:</td>
            <td>
                <select name="skillSet">
                    <option value="trades">Trade Worker</option>
                    <option value="administration">Administration</option>
                    <option value="technology">Technology</option>
                    <option value="business">Business</option>
                    <option value="sales">Sales</option>
                    <option value="publicService">Public Service</option>
                    <option value="other">Other</option>
                </select>
            </td>
        </tr>
        <tr>
            <td><button name="submit" value="Submit">Register</button></td>
        </tr>
    </table>
</form>

<script src="/resource/registervalidation.js"></script>

</body>
</html>
