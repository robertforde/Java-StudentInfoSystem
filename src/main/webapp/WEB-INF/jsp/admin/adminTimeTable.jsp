<%-- 
    Document   : Home
    Created on : 25-Jun-2013, 12:03:40
    Author     : Robert Forde
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                        <form action="adminUpTimeTable.html">
                            <table border="1">
                                <tr>
                                    <th width="10px">ID</th>
                                    <th width="190px">SUBJECT</th>
                                    <th width="145px">DAY</th>
                                    <th width="50px" >ROOM</th>
                                    <th width="75px" >TIME</th>
                                    <th width="30px" >DELETE</th>
                                </tr>
                                <c:forEach items="${timetable}" var="t" varStatus="counter">
                                    <tr>
                                        <td><input type="text" name="id${counter.count}" size="4" value="${t.id}" readonly/></td>
                                        <td><input type="text" name="subject${counter.count}" size="25" value="${t.subject}"/></td>
                                        <td><input type="text" name="day${counter.count}" size="15" value="${t.day}"/></td>
                                        <td><input type="text" name="room${counter.count}" size="4" value="${t.room}"/></td>
                                        <td><input type="text" name="time${counter.count}" size="15" value="${t.time}"/></td>
                                        <td><input type="checkbox" name="delete${counter.count}" value="yes"/></td>
                                    </tr>
                                </c:forEach>
                                <tr>
                                    <td colspan="8" style="text-align: center">
                                        <c:if test="${totaltimetable !=0}">
                                            <input type="submit" name="action" value="Save Changes"/>
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <input type="submit" name="action" value="Delete Selected"/>
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        </c:if>    
                                        <input type="submit" name="action" value="Insert Record"/>
                                    </td>
                                </tr>
                            </table>
                        </form>
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
