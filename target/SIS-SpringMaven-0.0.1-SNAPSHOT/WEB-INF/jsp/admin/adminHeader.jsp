<%-- 
    Document   : Header
    Created on : 25-Jun-2013, 19:59:08
    Author     : Robert Forde
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="MainHead">
    Student Information System
    <hr>
</div>
<div id="MenuHeadRow">
    <c:choose>
        <c:when test="${param.menu=='home'}">
            <div id="MenuHead" style="background-image: url('../resources/images/AdminHomeTab.bmp');background-repeat: no-repeat;">
        </c:when>
        <c:when test="${param.menu=='insert'}">
            <div id="MenuHead" style="background-image: url('../resources/images/AdminInsertTab.bmp');background-repeat: no-repeat;">
        </c:when>
        <c:when test="${param.menu=='edit'}">
            <div id="MenuHead" style="background-image: url('../resources/images/AdminEditTab.bmp');background-repeat: no-repeat;">
        </c:when>
        <c:when test="${param.menu=='delete'}">
            <div id="MenuHead" style="background-image: url('../resources/images/AdminDeleteTab.bmp');background-repeat: no-repeat;">
        </c:when>
        <c:when test="${param.menu=='search'}">
            <div id="MenuHead" style="background-image: url('../resources/images/AdminSearchTab.bmp');background-repeat: no-repeat;">
        </c:when>
    </c:choose>
                <pre style="">    <a href="goAdminHome.html">Home</a>        <a href="goInsertProfile.html">Insert</a>        <a href="goAdminEdit.html">Edit</a>        <a href="goAdminDelete.html">Delete</a>       <a href="goAdminSearch.html">Search</a>       <a href="../doLogout.html">Logout</a></pre>
            </div>
</div>
<div id="MenuWelcome">
    Welcome Administrator
</div>
