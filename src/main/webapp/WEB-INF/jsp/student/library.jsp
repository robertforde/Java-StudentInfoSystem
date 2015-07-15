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
        <jsp:include page="header.jsp">
            <jsp:param name="menu" value="library"/>
        </jsp:include>
        <div id="MainPanel">
            <div id="LeftPanel">
                Exam News
                <br><br>
                All exam results will be displayed on the noticeboard at the 
                entry to the library. All recent exams results are, as always, 
                also available on our main website.
                <br><br><br>
                General News
                <br><br>
                The cafeteria will be closed all day on the 17th of July for 
                refurbishment.
            </div>
            <div id="CenterPanel">
                <div id="TimeTableImage">
                    <img src="<c:url value="/resources/images/books.jpg"/>" width="30px" height="30px"/>
                </div>
                <div id="TimeTableTableHead">Library</div>
                <div id="TimeTableTable">
                    <table border="1">
                        <tr>
                            <th width="140px">BOOK NAME</th>
                            <th width="90px" >ISSUED DATE</th>
                            <th width="90px" >RETURN DATE</th>
                            <th width="90px" >FINES</th>
                            <th width="90px" >BALANCE</th>
                        </tr>
                        <c:set var="line" value="white" scope="page"/>
                        <c:forEach items="${library}" var="l">
                            <c:choose>
                                <c:when test="${line=='white'}">
                                    <tr id="whiteLine">
                                        <td>${l.bookName}</td>
                                        <td>${l.bookIssued}</td>
                                        <td>${l.bookReturn}</td>
                                        <td>${l.fines}</td>
                                        <td>${l.balance}</td>
                                    </tr>
                                    <c:set var="line" value="clear" scope="page"/>
                                </c:when>
                                <c:otherwise>
                                    <tr id="clearLine">
                                        <td>${l.bookName}</td>
                                        <td>${l.bookIssued}</td>
                                        <td>${l.bookReturn}</td>
                                        <td>${l.fines}</td>
                                        <td>${l.balance}</td>
                                    </tr>
                                    <c:set var="line" value="white" scope="page"/>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </table>
                </div>
            </div>
            <div id="RightPanel">
                General News
                <br><br>
                The Taoisheach will be making an announcement to the entire 
                college in the sports hall on Monday 22nd of July and all 
                students must attend. 
                <br><br><br>
                Sports News
                <br><br>
                The college soccer team have reached the final of the McCarthy 
                Cup and the game will be on next Friday at 6:00pm.             
            </div>
        </div>
        <div id="footer">
            All Rights Reserved
        </div>
    </body>
</html>
