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
                    <div id="Size10">
                        <form action="adminUpLibrary.html">
                            <table border="1">
                                <tr>
                                    <th width="10px">ID</th>
                                    <th width="100px">BOOK NAME</th>
                                    <th width="50px" >I.DATE</th>
                                    <th width="50px" >R.DATE</th>
                                    <th width="30px" >FINES</th>
                                    <th width="30px" >PAID</th>
                                    <th width="40px" >BALANCE</th>
                                    <th width="30px">DELETE</th>
                                </tr>
                                <c:forEach items="${library}" var="l" varStatus="counter">
                                    <tr>
                                        <td><input type="text" name="id${counter.count}" size="2" value="${l.id}" readonly="true"/></td>
                                        <td><input type="text" name="bookName${counter.count}" size="21" value="${l.bookName}"/></td>
                                        <td><input type="text" name="bookIssued${counter.count}" size="8" value="${l.bookIssued}"/></td>
                                        <td><input type="text" name="bookReturn${counter.count}" size="8" value="${l.bookReturn}"/></td>
                                        <td><input type="text" name="fines${counter.count}" size="4" value="${l.fines}"/></td>
                                        <td><input type="text" name="paid${counter.count}" size="4" value="${l.paid}"/></td>
                                        <td><input type="text" name="balance${counter.count}" size="3" value="${l.balance}"/></td>
                                        <td><input type="checkbox" name="delete${counter.count}" value="yes"/></td>
                                    </tr>
                                </c:forEach>
                                <tr>
                                    <td colspan="8" style="text-align: center">
                                    <c:if test="${totallibrary !=0}">
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
