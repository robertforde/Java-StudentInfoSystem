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
        <title>Read Messages</title>
        <link href="<c:url value="/resources/css/default.css" />" rel="stylesheet">
        <link href="<c:url value="/resources/css/default2.css" />" rel="stylesheet">
    </head>
    <body>
        <jsp:include page="header.jsp">
            <jsp:param name="menu" value="home"/>
        </jsp:include>
        <div id="MainPanel">
            <div id="LeftPanel">
                E-Mail
                </br>
                </br>
                Please do not use any abusive language in your messages. 
                Messages will be monitored and anybody disobeying the rules 
                will face disciplinary action which can mean suspension or 
                complete expulsion.
            </div>
            <div id="CenterPanel">
                <div id="HomeCenter">
                    <img src="<c:url value="/resources/images/readmessage.JPG"/>" height="50px" width="50px"/>
                </div>
                <div id="Messages">
                    <c:set var="number" value="0" scope="page"/>
                    <c:forEach items="${messages}" var="m">
                        </br>
                        </br>
                        <c:set var="number" value="${number+1}" scope="page"/>
                        <div id="MessageTitle">
                            Message No.${number}: From ${m.fromName}&nbsp;&nbsp;&nbsp;${m.fromId}
                            </br>
                            </br>
                        </div>
                        <div id="Message">
                            ${m.message}
                        </div>
                    </c:forEach>
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
