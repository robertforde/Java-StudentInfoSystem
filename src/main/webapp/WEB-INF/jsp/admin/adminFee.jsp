<%-- 
    Document   : Home
    Created on : 25-Jun-2013, 12:03:40
    Author     : Robert Forde
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Fees</title>
        <link href="<c:url value="/resources/css/default.css" />" rel="stylesheet">
        <link href="<c:url value="/resources/css/default2.css" />" rel="stylesheet">
    </head>
    <body>
        <jsp:include page="adminStudentHeader.jsp">
            <jsp:param name="menu" value="adminfee"/>
        </jsp:include>
        <div id="MainPanel">
            <div id="LeftPanel">
            </div>
            <div id="CenterPanel">
                <br>
                <br>
                <br>
                <div id="Size14Bold">Fees for ${profile.sname}</div>
                <div id="TimeTableTable">
                    <div id="Size14">
                        <form action="adminUpFee.html">
                            <table border="1">
                                <tr>
                                    <th width="10px">ID</th>
                                    <th width="10px">YEAR</th>
                                    <th width="90px">SEMESTER</th>
                                    <th width="130px">TOTAL FEE</th>
                                    <th width="130px">ANNUAL CHARGE</th>
                                    <th width="30px">DELETE</th>
                                </tr>
                                <c:forEach items="${fee}" var="f" varStatus="counter">
                                    <tr>
                                        <td><input type="text" name="id${counter.count}" size="4" value="${f.id}" readonly="true"/></td>
                                        <td><input type="text" name="year${counter.count}" size="4" value="${f.year}"/></td>
                                        <td><input type="text" name="semester${counter.count}" size="5" value="${f.semester}"/></td>
                                        <td><input type="text" name="fees${counter.count}" size="13" value="${f.fees}"/></td>
                                        <td><input type="text" name="charge${counter.count}" size="13" value="${f.charge}"/></td>
                                        <td><input type="checkbox" name="delete${counter.count}" value="yes"/></td>
                                    </tr>
                                </c:forEach>
                                <tr>
                                    <td colspan="6" style="text-align: center">
                                        <c:if test="${totalfee !=0}">
                                            <input type="submit" name="action" value="Save Changes"/>
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <input type="submit" name="action" value="Delete Selected"/>
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        </c:if>    
                                        <input type="submit" name="action" value="Insert Record"/>
                                    </td>
                                </tr>
                            </table>
                        </form>
                    </div>
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
