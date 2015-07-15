<%-- 
    Document   : Home
    Created on : 25-Jun-2013, 12:03:40
    Author     : Robert Forde
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Attendance</title>
		<link href="<c:url value="/resources/css/default.css" />" rel="stylesheet">
        <link href="<c:url value="/resources/css/default2.css" />" rel="stylesheet">
    </head>
    <body>
        <jsp:include page="header.jsp">
            <jsp:param name="menu" value="attendance"/>
        </jsp:include>
        <div id="MainPanel">
            <div id="LeftPanel">
                </br>
                </br>
                <a href="subjectAttendance.html">Attendance By Subject</a>
                </br>
                </br>
                <a href="summaryAttendance.html">Attendance Summary</a>
            </div>
            <div id="CenterPanel">
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
