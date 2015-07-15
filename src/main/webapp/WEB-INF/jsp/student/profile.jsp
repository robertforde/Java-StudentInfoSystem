<%-- 
    Document   : Home
    Created on : 25-Jun-2013, 12:03:40
    Author     : Robert Forde
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
        <jsp:include page="header.jsp">
            <jsp:param name="menu" value="profile"/>
        </jsp:include>
        <div id="MainPanel">
            <div id="LeftPanel">
                Exam News
                <br><br>
                All exam results will be displayed on the noticeboard at the 
                entry to the library. All recent exams results are, as always, 
                also available on our main website.
                <br><br><br>
                General News
                <br><br>
                The cafeteria will be closed all day on the 17th of July for 
                refurbishment.
            </div>
            <div id="CenterPanel">
                <br>
                <div id="ProfileScroll">
                    <div id="Size14">
                        <form:form id="profileForm" action="doProfile.html" method="post" commandName="profile">
                            <table align="center">
                                <tr>
                                    <td>Student ID</td>
                                    <td><form:input size="20" readonly="true" path="sid"/></td>
                                </tr>
                                <tr>
                                    <td>Student Name</td>
                                    <td><form:input size="20" path="sname"/></td>
                                </tr>
                                <tr>
                                    <td>Password</td>
                                    <td><form:input size="20" path="password"/></td>
                                </tr>
                                <tr>
                                    <td>Father Name</td>
                                    <td><form:input size="20" path="father_name"/></td>
                                </tr>
                                <tr>
                                    <td>Date of Birth</td>
                                    <td><form:input path="dob"/></td>
                                </tr>
                                <tr>
                                    <td>Nationality</td>
                                    <td><form:input size="20" path="nationality"/></td>
                                </tr>
                                <tr>
                                    <td>Address</td>
                                    <td><form:input size="50" path="address"/></td>
                                </tr>
                                <tr>
                                    <td>City</td>
                                    <td><form:input size="20" path="city"/></td>
                                </tr>
                                <tr>
                                    <td>Country</td>
                                    <td><form:input size="20" path="country"/></td>
                                </tr>
                                <tr>
                                    <td>Phone</td>
                                    <td><form:input size="20" path="phone"/></td>
                                </tr>
                                <tr>
                                    <td>Mobile</td>
                                    <td><form:input size="20" path="mobile"/></td>
                                </tr>
                                <tr>
                                    <td>Email</td>
                                    <td><form:input size="20" path="email"/></td>
                                </tr>
                                <tr>
                                    <td style="text-align: right"><input type="submit" value="Submit"/></td>
                                    <td><input type="button" onclick="formReset();" value="Reset"/></td>
                                </tr>
                            </table>
                        </form:form>
                    </div>
                </div>
            </div>
            <div id="RightPanel">
                General News
                </br></br>
                The Taoisheach will be making an announcement to the entire 
                college in the sports hall on Monday 22nd of July and all 
                students must attend. 
                </br></br></br>
                Sports News
                </br></br>
                The college soccer team have reached the final of the McCarthy 
                Cup and the game will be on next Friday at 6:00pm.             
            </div>
        </div>
        <div id="footer">
            All Rights Reserved
        </div>
    </body>
</html>
