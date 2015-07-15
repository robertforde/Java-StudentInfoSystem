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
        <title>Search Results</title>
        <link href="<c:url value="/resources/css/default.css" />" rel="stylesheet">
        <link href="<c:url value="/resources/css/default2.css" />" rel="stylesheet">
    </head>
    <body>
        <jsp:include page="adminHeader.jsp">
            <jsp:param name="menu" value="search"/>
        </jsp:include>
        <div id="MainPanel">
            <div id="LeftPanel">
            </div>
            <div id="CenterPanel">
                <br>
                <br>
                <br>

                <div id="Size14Bold">${searched}</div>
                <div id="SearchTable">
                    <table border="1">
                            <tr>
                                <th width="10%">SID</th>
                                <th width="17%">NAME</th>
                                <th width="17%">SURNAME</th>
                                <th width="17%">NATION</th>
                                <th width="39%">DEPARTMENT</th>
                            </tr>
                            <c:forEach items="${srchresults}" var="sr">
                                <tr>
                                    <td>${sr.sid}</td>
                                    <td>${sr.sname}</td>
                                    <td>${sr.father_name}</td>
                                    <td>${sr.nationality}</td>
                                    <td>${sr.department.name}</td>
                                </tr>
                            </c:forEach>
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
