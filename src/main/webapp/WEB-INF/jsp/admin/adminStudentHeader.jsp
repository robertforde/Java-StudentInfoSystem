<%-- 
    Document   : Header
    Created on : 25-Jun-2013, 19:59:08
    Author     : Robert Forde
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<div id="MainHead">
    Student Information System
    <hr>
</div>
<div id="MenuHeadRow">
    <c:choose>
        <c:when test="${param.menu=='adminprofile'}">
            <div id="MenuHead" style="background-image: url('../resources/images/AdminProfile.bmp');background-repeat: no-repeat;">
        </c:when>
        <c:when test="${param.menu=='adminattendance'}">
            <div id="MenuHead" style="background-image: url('../resources/images/AdminAttendance.bmp');background-repeat: no-repeat;">
        </c:when>
        <c:when test="${param.menu=='adminattsemester'}">
            <div id="MenuHead" style="background-image: url('../resources/images/AdminAttSemester.bmp');background-repeat: no-repeat;">
        </c:when>
        <c:when test="${param.menu=='adminfee'}">
            <div id="MenuHead" style="background-image: url('../resources/images/AdminFee.bmp');background-repeat: no-repeat;">
        </c:when>
        <c:when test="${param.menu=='adminlibrary'}">
            <div id="MenuHead" style="background-image: url('../resources/images/AdminLibrary.bmp');background-repeat: no-repeat;">
        </c:when>
        <c:when test="${param.menu=='adminresult'}">
            <div id="MenuHead" style="background-image: url('../resources/images/AdminResult.bmp');background-repeat: no-repeat;">
        </c:when>
        <c:when test="${param.menu=='admintimetable'}">
            <div id="MenuHead" style="background-image: url('../resources/images/AdminTimeTable.bmp');background-repeat: no-repeat;">
        </c:when>
        <c:when test="${param.menu=='adminback'}">
            <div id="MenuHead" style="background-image: url('../resources/images/AdminBack.bmp');background-repeat: no-repeat;">
        </c:when>
    </c:choose>
    <pre style="">   <a href="goAdminProfile.html">Profile</a>    <a href="goAdminAttendSub.html">Attendance</a>    <a href="goAdminAttendSum.html">Attend S.</a>      <a href="goAdminFee.html">Fee</a>         <a href="goAdminLibrary.html">Library</a>      <a href="goAdminResults.html">Results</a>     <a href="goAdminTimeTable.html">TimeTable</a>      <a href="goAdminBack.html">Back</a></pre>
    		</div>
</div>

<div id="MenuWelcome">
    Welcome Administrator
</div>
