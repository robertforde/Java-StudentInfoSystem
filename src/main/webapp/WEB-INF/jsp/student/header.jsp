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
        <c:when test="${param.menu=='home'}">
            <div id="MenuHead" style="background-image: url('../resources/images/HomeTab.bmp');background-repeat: no-repeat;">
        </c:when>
        <c:when test="${param.menu=='attendance'}">
            <div id="MenuHead" style="background-image: url('../resources/images/AttendanceTab.bmp');background-repeat: no-repeat;">
        </c:when>
        <c:when test="${param.menu=='profile'}">
            <div id="MenuHead" style="background-image: url('../resources/images/ProfileTab.bmp');background-repeat: no-repeat;">
        </c:when>
        <c:when test="${param.menu=='results'}">
            <div id="MenuHead" style="background-image: url('../resources/images/ResultsTab.bmp');background-repeat: no-repeat;">
        </c:when>
        <c:when test="${param.menu=='timetable'}">
            <div id="MenuHead" style="background-image: url('../resources/images/TimeTableTab.bmp');background-repeat: no-repeat;">
        </c:when>
        <c:when test="${param.menu=='fee'}">
            <div id="MenuHead" style="background-image: url('../resources/images/FeeTab.bmp');background-repeat: no-repeat;">
        </c:when>
        <c:when test="${param.menu=='library'}">
            <div id="MenuHead" style="background-image: url('../resources/images/LibraryTab.bmp');background-repeat: no-repeat;">
        </c:when>
    </c:choose>
 	<pre style="">    <a href="goHome.html">Home</a>      <a href="goAttendance.html">Attendance</a>    <a href="goProfile.html">Profile</a>     <a href="goResults.html">Results</a>    <a href="goTimetable.html">Time Table</a>      <a href="goFee.html">Fee</a>        <a href="goLibrary.html">Library</a>                  <a href="goStudentMessage.html">Inbox</a>   <a href="goCreateMessage.html">Compose Message</a>  <a href="../doLogout.html">Logout</a></pre>
</div>
</div>
<div id="MenuWelcome">
    Welcome ${userObj.sname} to the Student Information System
</div>
