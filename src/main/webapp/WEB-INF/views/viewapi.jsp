<%--
  Created by IntelliJ IDEA.
  User: Steve
  Date: 8/10/2017
  Time: 14:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>View API</title>
</head>
<body>
<div>
    <p>This is where the API info will go</p>
</div>
<div>
    <form action="/crimetype" method="post">
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
                    <select name="skillSet" value="${userProfile.skillset}">
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
                <td>Crime Type:</td>
                <td>
                    <input type="checkbox" name="crimetype" value="0" >V<br>
                    <input type="checkbox" name="crimetype" value="1" >NV<br>
                    <input type="submit" value="Submit">
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
