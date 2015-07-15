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
        <title>Logged Out</title>
        <link href="<c:url value="/resources/css/default.css" />" rel="stylesheet">
        <link href="<c:url value="/resources/css/default2.css" />" rel="stylesheet">
    </head>
    <body>
        <div id="LoginHead">
            Student Information System
        </div>
        <div id="LoginBox">
            <div id="LoginBoxHead">
                Logged Out
            </div>
            </br>
            </br>
            <pre>          You have been successfully logged out.</pre>
            </br>
            <pre>                       <a href="startLogin.html">Login again</a></pre>
        </div>
    </body>
</html>
