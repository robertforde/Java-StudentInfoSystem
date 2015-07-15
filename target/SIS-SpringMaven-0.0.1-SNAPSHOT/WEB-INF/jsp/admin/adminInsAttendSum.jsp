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
        <title>Attendance Summary</title>
        <link href="<c:url value="/resources/css/default.css" />" rel="stylesheet">
        <link href="<c:url value="/resources/css/default2.css" />" rel="stylesheet">
    </head>
    <body>
        <jsp:include page="adminStudentHeader.jsp">
            <jsp:param name="menu" value="adminattsemester"/>
        </jsp:include>
        <div id="MainPanel">
            <div id="LeftPanel">
            </div>
            <div id="CenterPanel">
                </br>
                </br>
                </br>
                <div id="Size14Bold">Attendance Summary for ${profile.sname}</div>
                    <div id="TimeTableTable">
                        <div id="Size14">
                            <table border="1">
                            <tr>
                                <th width="25px" >ID</th>
                                <th width="30px" >YEAR</th>
                                <th width="90px" >SEMESTER1</th>
                                <th width="90px" >SEMESTER2</th>
                                <th width="90px" >SEMESTER3</th>
                                <th width="90px" >SEMESTER4</th>
                            </tr>
                            <c:forEach items="${attendsum}" var="as">
                                <tr>
                                    <td>${as.id}</td>
                                    <td>${as.year}</td>
                                    <td>${as.semester1}</td>
                                    <td>${as.semester2}</td>
                                    <td>${as.semester3}</td>
                                    <td>${as.semester4}</td>
                                </tr>
                            </c:forEach>
                            <form:form action="adminInsAttendSumSave.html" commandName="insAttendSum">
                                <tr>
                                    <td></td>
                                    <td><form:input path="year" size="4"/></td>
                                    <td><form:input path="semester1" size="3"/></td>
                                    <td><form:input path="semester2" size="3"/></td>
                                    <td><form:input path="semester3" size="3"/></td>
                                    <td><form:input path="semester4" size="3"/></td>
                                </tr>
                                <tr>
                                    <td colspan="6" style="text-align: center">
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
