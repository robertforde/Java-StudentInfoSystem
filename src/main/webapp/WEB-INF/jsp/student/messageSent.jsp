<%-- 
    Document   : index
    Created on : 24-Jun-2013, 11:46:23
    Author     : Robert Forde
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Message Sent</title>
        <link href="<c:url value="/resources/css/default.css" />" rel="stylesheet">
        <link href="<c:url value="/resources/css/default2.css" />" rel="stylesheet">
    </head>
    <body>
        <div id="LoginHead">
            Student Information System
        </div>
        <div id="LoginBox">
            <div id="LoginBoxHead">
                Message Sent
            </div>
            <br>
            <pre>              Your message has been sent.</pre>
            <pre>     Press the link below to return to the Home Screen.</pre>
            <pre>                       <a href="goHome.html">Click here!</a></pre>
        </div>
    </body>
</html>
