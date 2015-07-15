<%-- 
    Document   : Home
    Created on : 25-Jun-2013, 12:03:40
    Author     : Robert Forde
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Attendance by Subject for ${adminstudent.sname}</title>
        <link href="<c:url value="/resources/css/default.css" />" rel="stylesheet">
        <link href="<c:url value="/resources/css/default2.css" />" rel="stylesheet">
    </head>
    <body>
        <jsp:include page="adminStudentHeader.jsp">
            <jsp:param name="menu" value="adminattendance"/>
        </jsp:include>
        <div id="MainPanel">
            <div id="LeftPanel">
            </div>
            <div id="CenterPanel">
                </br>
                </br>
                </br>
                <div id="Size14Bold">Attendance by Subject for ${profile.sname}</div>
                <div id="Size14">
                    <div id="AdminAttSubBox">
                        <table border="1">
                            <tr>
                                <th width="10px" >ID</th>
                                <th width="250px">SUBJECT</th>
                                <th width="95px" >PRESENT</th>
                                <th width="95px" >ABSENT</th>
                            </tr>
                            <c:forEach items="${attendsub}" var="as">
                                <tr>
                                    <td>${as.id}</td>
                                    <td>${as.subject}</td>
                                    <td>${as.present}</td>
                                    <td>${as.absent}</td>
                                </tr>
                            </c:forEach>
                            <form:form action="adminInsAttendSubSave.html" commandName="insAttendSub">
                                <tr>
                                    <td></td>
                                    <td><form:input path="subject" size="20"/></td>
                                    <td><form:input path="present" size="3"/></td>
                                    <td><form:input path="absent" size="3"/></td>
                                </tr>
                                <tr>
                                    <td colspan="4" style="text-align: center">
                                        <input type="submit" name="action" value="Save"/>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <input type="submit" name="action" value="Cancel"/>
                                    </td>
                                </tr>    
                            </form:form>
                        </table>
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
