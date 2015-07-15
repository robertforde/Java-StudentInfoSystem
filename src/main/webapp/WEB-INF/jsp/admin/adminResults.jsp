<%-- 
    Document   : Home
    Created on : 25-Jun-2013, 12:03:40
    Author     : Robert Forde
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Results</title>
        <link href="<c:url value="/resources/css/default.css" />" rel="stylesheet">
        <link href="<c:url value="/resources/css/default2.css" />" rel="stylesheet">
    </head>
    <body>
        <jsp:include page="adminStudentHeader.jsp">
            <jsp:param name="menu" value="adminresult"/>
        </jsp:include>
        <div id="MainPanel">
            <div id="LeftPanel">
            </div>
            <div id="CenterPanel">
                <br>
                <br>
                <br>
                <div id="Size14Bold">Results for ${profile.sname}</div>
                <div id="TimeTableTable">
                    <div id="Size14">
                        <form action="adminUpResults.html">
                            <table border="1">
                                <tr>
                                    <th width="10px">ID</th>
                                    <th width="160px" border="1">YEAR</th>
                                    <th width="200px" border="1">SUBJECT</th>
                                    <th width="50px" >OBTAINED</th>
                                    <th width="50px" >GPA</th>
                                    <th width="30px">DELETE</th>
                                </tr>
                                <c:set var="totalgpa" value="0.00"/>
                                <c:forEach items="${results}" var="r" varStatus="counter">
                                    <tr>
                                        <td><input type="text" name="id${counter.count}" size="4" value="${r.id}" readonly="true"/></td>
                                        <td><input type="text" name="year${counter.count}" size="4" value="${r.year}"/></td>
                                        <td><input type="text" name="subject${counter.count}" size="20" value="${r.subject}"/></td>
                                        <td><input type="text" name="obtained${counter.count}" size="3" value="${r.obtained}"/></td>
                                        <td><input type="text" name="gpa${counter.count}" size="4" value="${r.gpa}"/></td>
                                        <td><input type="checkbox" name="delete${counter.count}" value="yes"/></td>
                                    </tr>
                                    <c:set var="totalgpa" value="${totalgpa+r.gpa}"/>
                                </c:forEach>
                                <c:if test="${totalresults !=0}">
                                    <tr>
                                        <td></td>
                                        <td colspan="2" style="font-weight: bold">OVERALL GPA</td>
                                        <td colspan="2" style="font-weight: bold"><f:formatNumber value="${totalgpa/totalresults}" minFractionDigits="1" maxFractionDigits="2"/> </td>
                                        <td></td>
                                    </tr>
                                </c:if>
                                <tr>
                                    <td colspan="6" style="text-align: center">
                                        <c:if test="${totalresults !=0}">
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
