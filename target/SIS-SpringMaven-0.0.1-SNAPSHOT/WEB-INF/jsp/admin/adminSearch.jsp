<%-- 
    Document   : Home
    Created on : 25-Jun-2013, 12:03:40
    Author     : Robert Forde
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search</title>
        <link href="<c:url value="/resources/css/default.css" />" rel="stylesheet">
        <link href="<c:url value="/resources/css/default2.css" />" rel="stylesheet">
        <script type="text/javascript">
            function formReset() {
                document.getElementById("searchForm").reset();
                document.focus(searchForm.Sid);
            }
        </script>
    </head>
    <body>
        <jsp:include page="adminHeader.jsp">
            <jsp:param name="menu" value="search"/>
        </jsp:include>
        <div id="MainPanel">
            <div id="LeftPanel">
            </div>
            <div id="CenterPanel">
                <div id="Search">
                    </br>
                    <form:form id="searchForm" action="goAdminSearchResults.html" method="post" commandName="srchForm">
                        <table align="center">
                            <tr></tr>
                            <tr>
                                <td>Name</td>
                                <td><form:input path="name" size="20"/></td>
                            </tr>
                            <tr>
                                <td>Surname</td>
                                <td><form:input path="surname" size="20"/></td>
                            </tr>
                            <tr>
                                <td>Nationality</td>
                                <td><form:input path="nation" size="20"/></td>
                            </tr>
                            <tr>
                                <td>Department</td>
                                <td>
									<form:select path="deptID" items="${departments}" />
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: center" colspan="2"><input type="submit" value="Enter"/>
                                <input type="button" onclick="formReset();" value="Reset"/></td>
                            </tr>
                        </table>
                    </form:form>
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
