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
        <jsp:include page="header.jsp">
            <jsp:param name="menu" value="results"/>
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
                <div id="Size14Bold">Your Results </div>
                <div id="TimeTableTable">
                    <div id="Size14">
                        <table border="1">
                            <tr>
                                <th width="200px">YEAR</th>
                                <th width="200px">SUBJECT</th>
                                <th width="100px" >OBTAINED</th>
                                <th width="100px" >GPA</th>
                            </tr>
                            <c:set var="totalgpa" value="0.00"/>
                            <c:forEach items="${results}" var="r">
                                <tr>
                                    <td>${r.year}</td>
                                    <td>${r.subject}</td>
                                    <td>${r.obtained}</td>
                                    <td>${r.gpa}</td>
                                </tr>
                                <c:set var="totalgpa" value="${totalgpa+r.gpa}"/>
                            </c:forEach>
                            <tr>
                                <td></td>
                                <td colspan="2" style="font-weight: bold">OVERALL GPA</td>
                                <td><f:formatNumber value="${totalgpa/totalresults}" minFractionDigits="1" maxFractionDigits="2"/> </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
            <div id="RightPanel">
                General News
                </br></br>
                The Taoisheach will be making an announcement to the entire 
                college in the sports hall on Monday 22nd of July and all 
                students must attend. 
                </br></br></br>
                Sports News
                </br></br>
                The college soccer team have reached the final of the McCarthy 
                Cup and the game will be on next Friday at 6:00pm.             
            </div>
        </div>
        <div id="footer">
            All Rights Reserved
        </div>
    </body>
</html>
