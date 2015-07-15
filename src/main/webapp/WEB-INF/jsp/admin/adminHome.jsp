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
        <title>Admin Home</title>
        <link href="<c:url value="/resources/css/default.css" />" rel="stylesheet">
        <link href="<c:url value="/resources/css/default2.css" />" rel="stylesheet">
    </head>
    <body>
        <jsp:include page="adminHeader.jsp">
            <jsp:param name="menu" value="home"/>
        </jsp:include>
        <div id="MainPanel">
            <div id="LeftPanel">
                
            </div>
            <div id="CenterPanel">
                <div id="HomeCenter">
                    <br>
                    You have ${userObj.numMessages} messages to check.
                    <br>
                    <br>
                    <img src="<c:url value="/resources/images/inbox.png"/>" />
                    <br>
                    <br>
                    <br>
                    <a href="goAdminMessage.html">Click here to check messages.</a>
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
