<%-- 
    Document   : Home
    Created on : 25-Jun-2013, 12:03:40
    Author     : Robert Forde
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Attendance by Subject</title>
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
                    <div id="TimeTableTable">
                        <form action="adminUpAttSub.html">
                            <table border="1">
                                <tr>
                                    <th width="10px" >ID</th>
                                    <th width="250px">SUBJECTS</th>
                                    <th width="80px" >PRESENT</th>
                                    <th width="80px" >ABSENT</th>
                                    <th width="30px" >DELETE</th>
                                </tr>
                                <c:forEach items="${attendsub}" var="as" varStatus="counter">
                                    <tr>
                                        <td><input type="text" name="id${counter.count}" size="3" value="${as.id}" readonly="true"/></td>
                                        <td><input type="text" name="subject${counter.count}" size="25" value="${as.subject}"/></td>
                                        <td><input type="text" name="present${counter.count}" size="6" value="${as.present}"/></td>
                                        <td><input type="text" name="absent${counter.count}" size="6" value="${as.absent}"/></td>
                                        <td><input type="checkbox" name="delete${counter.count}" value="yes"/></td>
                                    </tr>
                                </c:forEach>
                                <tr>
                                    <td colspan="4" style="text-align: center">
                                        <c:if test="${totalattendsub !=0}">
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
