<%-- 
    Document   : Home
    Created on : 25-Jun-2013, 12:03:40
    Author     : Robert Forde
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile</title>
        <link href="<c:url value="/resources/css/default.css" />" rel="stylesheet">
        <link href="<c:url value="/resources/css/default2.css" />" rel="stylesheet">
        <script type="text/javascript">
            function formReset() {
                document.getElementById("profileForm").reset();
                document.focus(profileForm.Sid);
            }
        </script>
    </head>
    <body>
        <jsp:include page="adminStudentHeader.jsp">
            <jsp:param name="menu" value="adminprofile"/>
        </jsp:include>
        <div id="MainPanel">
            <div id="LeftPanel">
            </div>
            <div id="CenterPanel">
                </br>
                <div id="ProfileScroll">
                    <div id="Size14">
                        <form:form id="profileForm" action="goUpdateProfile.html" method="post" commandName="profile">
                            <table align="center">
                                <tr>
                                    <td>Student ID</td>
                                    <td><form:input path="sid" size="20" /></td>
                                </tr>
                                <tr>
                                    <td>Student Name</td>
                                    <td><form:input path="sname" size="20"/></td>
                                </tr>
                                <tr>    
                                    <td>Password</td>
                                    <td><form:input path="password" size="20" /></td>
                                </tr>
                                <tr>
                                    <td>Father Name</td>
                                    <td><form:input path="father_name" size="20" /></td>
                                </tr>
                                <tr>
                                    <td>Date of Birth</td>
                                    <td><form:input path="dob"/></td>
                                </tr>
                                <tr>
                                    <td>Nationality</td>
                                    <td><form:input path="nationality" size="20"/></td>
                                </tr>
                                <tr>
                                    <td>Address</td>
                                    <td><form:input path="address" size="50"/></td>
                                </tr>
                                <tr>
                                    <td>City</td>
                                    <td><form:input path="City" size="20" /></td>
                                </tr>
                                <tr>
                                    <td>Country</td>
                                    <td><form:input path="Country" size="20" /></td>
                                </tr>
                                <tr>
                                    <td>Phone</td>
                                    <td><form:input path="Phone" size="20" /></td>
                                </tr>
                                <tr>
                                    <td>Mobile</td>
                                    <td><form:input path="Mobile" size="20" /></td>
                                </tr>
                                <tr>
                                    <td>Email</td>
                                    <td><form:input path="Email" size="20"/></td>
                                </tr>   
                                <tr>
                                    <td style="text-align: right"><input type="submit" value="Save"/></td>
                                    <td><input type="button" onclick="formReset();" value="Reset"/></td>
                                </tr>
                            </table>
                        </form:form>
                    </div>
                </div>
            </div>
            <div id="RightPanel">
            </div>
        </div>
        <div id="footer">
            All Rights Reserved
        </div>
    </body>
</html>
