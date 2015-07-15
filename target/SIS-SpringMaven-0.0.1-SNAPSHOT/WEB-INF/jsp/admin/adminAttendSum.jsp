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
                <div id="Size14">
                    <div id="AdminAttSubBox">
                        <form action="adminUpAttSum.html">
                            <table border="1">
                                <tr>
                                    <th width="10px" >ID</th>
                                    <th width="20px" >YEAR</th>
                                    <th width="110px" >SEMESTER1</th>
                                    <th width="110px" >SEMESTER2</th>
                                    <th width="110px" >SEMESTER3</th>
                                    <th width="110px" >SEMESTER4</th>
                                    <th width="30px" >DELETE</th>
                                </tr>
                                <c:forEach items="${attendsum}" var="as" varStatus="counter">
                                    <tr>
                                        <td><input type="text" name="id${counter.count}" size="3" value="${as.id}" readonly="true"/></td>
                                        <td><input type="text" name="year${counter.count}" size="4" value="${as.year}"/></td>
                                        <td><input type="text" name="semester1${counter.count}" size="5" value="${as.semester1}"/></td>
                                        <td><input type="text" name="semester2${counter.count}" size="5" value="${as.semester2}"/></td>
                                        <td><input type="text" name="semester3${counter.count}" size="5" value="${as.semester3}"/></td>
                                        <td><input type="text" name="semester4${counter.count}" size="5" value="${as.semester4}"/></td>
                                        <td><input type="checkbox" name="delete${counter.count}" value="yes"/></td>
                                    </tr>
                                </c:forEach>
                                <tr>
                                    <td colspan="7" style="text-align: center">
                                        <c:if test="${totalattendsum !=0}">
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
