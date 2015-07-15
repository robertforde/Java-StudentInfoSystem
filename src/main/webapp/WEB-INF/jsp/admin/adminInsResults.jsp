<%-- 
    Document   : Home
    Created on : 25-Jun-2013, 12:03:40
    Author     : Robert Forde
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
                        <table border="1">
                            <tr>
                                <th width="10px">ID</th>
                                <th width="160px">YEAR</th>
                                <th width="200px">SUBJECT</th>
                                <th width="50px" >OBTAINED</th>
                                <th width="50px" >GPA</th>
                            </tr>
                            <c:set var="totalgpa" value="0.00"/>
                            <c:forEach items="${results}" var="r" varStatus="counter">
                                <tr>
                                    <td>${r.id}</td>
                                    <td>${r.year}</td>
                                    <td>${r.subject}</td>
                                    <td>${r.obtained}</td>
                                    <td>${r.gpa}</td>
                                </tr>
                                <c:set var="totalgpa" value="${totalgpa+r.gpa}"/>
                            </c:forEach>
                            <c:if test="${totalresults !=0}">
                                <tr>
                                    <td></td>
                                    <td colspan="2" style="font-weight: bold">OVERALL GPA</td>
                                    <td colspan="2" style="font-weight: bold"><f:formatNumber value="${totalgpa/totalresults}" minFractionDigits="1" maxFractionDigits="2"/> </td>
                                </tr>
                            </c:if>
                            <form:form action="adminInsResultsSave.html" commandName="insResults">
                                <tr>
                                    <td></td>
                                    <td><form:input path="year" size="4"/></td>
                                    <td><form:input path="subject" size="20"/></td>
                                    <td><form:input path="obtained" size="3"/></td>
                                    <td><form:input path="gpa" size="4"/></td>
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
