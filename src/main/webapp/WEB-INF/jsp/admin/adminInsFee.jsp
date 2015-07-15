<%-- 
    Document   : Home
    Created on : 25-Jun-2013, 12:03:40
    Author     : Robert Forde
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Fees</title>
        <link href="<c:url value="/resources/css/default.css" />" rel="stylesheet">
        <link href="<c:url value="/resources/css/default2.css" />" rel="stylesheet">
    </head>
    <body>
        <jsp:include page="adminStudentHeader.jsp">
            <jsp:param name="menu" value="adminfee"/>
        </jsp:include>
        <div id="MainPanel">
            <div id="LeftPanel">
            </div>
            <div id="CenterPanel">
                <br>
                <br>
                <br>
                <div id="Size14Bold">Fees for ${profile.sname}</div>
                <div id="TimeTableTable">
                    <div id="Size14">
                        <table border="1">
                            <tr>
                                <th width="10px">ID</th>
                                <th width="10px">YEAR</th>
                                <th width="120px">SEMESTER</th>
                                <th width="130px">TOTAL FEE</th>
                                <th width="130px">ANNUAL CHARGE</th>
                            </tr>
                            <c:forEach items="${fee}" var="f">
                                <tr>
                                    <td>${f.id}</td>
                                    <td>${f.year}</td>
                                    <td>${f.semester}</td>
                                    <td>${f.fees}</td>
                                    <td>${f.charge}</td>
                                </tr>
                            </c:forEach>
                            <form:form action="adminInsFeeSave.html" commandName="insFee">
                                <tr>
                                    <td></td>
                                    <td><form:input path="year" size="4"/></td>
                                    <td><form:input path="semester" size="5"/></td>
                                    <td><form:input path="fees" size="14"/></td>
                                    <td><form:input path="charge" size="14"/></td>
                                </tr>
                                <tr>
                                    <td colspan="7" style="text-align: center">
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
