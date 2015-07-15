<%-- 
    Document   : Home
    Created on : 25-Jun-2013, 12:03:40
    Author     : Robert Forde
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Time Table</title>
        <link href="<c:url value="/resources/css/default.css" />" rel="stylesheet">
        <link href="<c:url value="/resources/css/default2.css" />" rel="stylesheet">
    </head>
    <body>
        <jsp:include page="adminStudentHeader.jsp">
            <jsp:param name="menu" value="admintimetable"/>
        </jsp:include>
        <div id="MainPanel">
            <div id="LeftPanel">
            </div>
            <div id="CenterPanel">
                <br>
                <br>
                <div id="TimeTableTableHead">Time Table - ${profile.sname}</div>
                <div id="TimeTableTable">
                    <div id="Size10">
                        <table border="1">
                            <tr>
                                <th width="12px">ID</th>
                                <th width="200px">SUBJECT</th>
                                <th width="145px">DAY</th>
                                <th width="50px" >ROOM</th>
                                <th width="155px" >TIME</th>
                            </tr>
                            <c:forEach items="${timetable}" var="t">
                                <tr>
                                    <td>${t.id}</td>
                                    <td>${t.subject}</td>
                                    <td>${t.day}</td>
                                    <td>${t.room}</td>
                                    <td>${t.time}</td>
                                </tr>
                            </c:forEach>
                            <form:form action="adminInsTimeTableSave.html" commandName="insTimeTable">
                                <tr>
                                    <td></td>
                                    <td><form:input path="subject" size="25"/></td>
                                    <td><form:input path="day" size="10"/></td>
                                    <td><form:input path="room" size="4"/></td>
                                    <td><form:input path="time" size="13"/></td>
                                </tr>
                                <tr>
                                    <td colspan="8" style="text-align: center">
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
