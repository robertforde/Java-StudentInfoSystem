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
        <title>Home</title>
        <link href="<c:url value="/resources/css/default.css" />" rel="stylesheet">
        <link href="<c:url value="/resources/css/default2.css" />" rel="stylesheet">
    </head>
    <body>
        <jsp:include page="header.jsp">
            <jsp:param name="menu" value="home"/>
        </jsp:include>
        <div id="MainPanel">
            <div id="LeftPanel">
                
            </div>
            <div id="CenterPanel">
                <div id="HomeCenter">
                    </br>
                    You have ${userObj.numMessages} messages in your Inbox.
                    </br>
                    </br>
                    <img src="<c:url value="/resources/images/inbox.png"/>" />
                    </br>
                    </br>
                    </br>
                    <a href="goStudentMessage.html">Click here to read your messages.</a>
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
