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
        <title>Fees</title>
        <link href="<c:url value="/resources/css/default.css" />" rel="stylesheet">
        <link href="<c:url value="/resources/css/default2.css" />" rel="stylesheet">
    </head>
    <body>
        <jsp:include page="header.jsp">
            <jsp:param name="menu" value="fee"/>
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
                <br>
                <br>
                <br>
                <div id="Size14Bold">Fee </div>
                <div id="Size14">
                    <table border="1">
                        <tr>
                            <th width="100px" >YEAR</th>
                            <th width="175px" >SEMESTER</th>
                            <th width="100px" >TOTAL FEE</th>
                            <th width="125px" >ANNUAL CHARGE</th>
                        </tr>
                        <c:set var="line" value="white" scope="page"/>
                        <c:forEach items="${fee}" var="f">
                            <c:choose>
                                <c:when test="${line=='white'}">
                                    <tr id="whiteLine">
                                        <td>${f.year}</td>
                                        <td>${f.semester}</td>
                                        <td>${f.fees}</td>
                                        <td>${f.charge}</td>
                                    </tr>
                                    <c:set var="line" value="clear" scope="page"/>
                                </c:when>
                                <c:otherwise>
                                        <tr id="clearLine">
                                        <td>${f.year}</td>
                                        <td>${f.semester}</td>
                                        <td>${f.fees}</td>
                                        <td>${f.charge}</td>
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
