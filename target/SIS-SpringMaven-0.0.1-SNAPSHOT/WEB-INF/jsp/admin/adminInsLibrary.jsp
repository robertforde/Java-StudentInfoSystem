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
        <title>Library</title>
        <link href="<c:url value="/resources/css/default.css" />" rel="stylesheet">
        <link href="<c:url value="/resources/css/default2.css" />" rel="stylesheet">
    </head>
    <body>
        <jsp:include page="adminStudentHeader.jsp">
            <jsp:param name="menu" value="adminlibrary"/>
        </jsp:include>
        <div id="MainPanel">
            <div id="LeftPanel">
            </div>
            <div id="CenterPanel">
                </br>
                </br>
                </br>
                <div id="Size14Bold">Library Books - ${profile.sname}</div>
                <div id="TimeTableTable">
                    <table border="1">
                        <tr>
                            <th width="30px">ID</th>
                            <th width="120px">BOOK NAME</th>
                            <th width="60px" >I.DATE</th>
                            <th width="60px" >R.DATE</th>
                            <th width="40px" >FINES</th>
                            <th width="40px" >PAID</th>
                            <th width="50px" >BALANCE</th>
                        </tr>
                        <c:forEach items="${library}" var="l">
                            <tr>
                                <td>${l.id}</td>
                                <td>${l.bookName}</td>
                                <td>${l.bookIssued}</td>
                                <td>${l.bookReturn}</td>
                                <td>${l.fines}</td>
                                <td>${l.paid}</td>
                                <td>${l.balance}</td>
                            </tr>
                        </c:forEach>
                        <form:form action="adminInsLibrarySave.html" commandName="insLibrary">
                            <tr>
                                <td></td>
                                <td><form:input path="bookName" size="27"/></td>
                                <td><form:input path="bookIssued" size="8"/></td>
                                <td><form:input path="bookReturn" size="8"/></td>
                                <td><form:input path="fines" size="4"/></td>
                                <td><form:input path="paid" size="4"/></td>
                                <td><form:input path="balance" size="3"/></td>
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
            <div id="RightPanel">
            </div>
        </div>
        <div id="footer">
            All Rights Reserved
        </div>
    </body>
</html>
