<%-- 
    Document   : Home
    Created on : 25-Jun-2013, 12:03:40
    Author     : Robert Forde
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit</title>
        <link href="<c:url value="/resources/css/default.css" />" rel="stylesheet">
        <link href="<c:url value="/resources/css/default2.css" />" rel="stylesheet">
        <script type="text/javascript">
            function formReset() {
                document.getElementById("editForm").reset();
                document.focus(editForm.Sid);
            }
        </script>
    </head>
    <body>
        <jsp:include page="adminHeader.jsp">
            <jsp:param name="menu" value="edit"/>
        </jsp:include>
        <div id="MainPanel">
            <div id="LeftPanel">
            </div>
            <div id="CenterPanel">

                <div id="StudentID">
                    </br>
                    <form id="editForm" action="goAdminEditDetails.html" method="post">
                        <table align="center">
                            <tr></tr><tr>
                                <td>Student ID</td>
                                <td><input type="text" name="editSid" size="20"/></td>
                            </tr><tr></tr><tr></tr><tr></tr>
                            <tr>
                                <td style="text-align: center" colspan="2"><input type="submit" value="Enter"/>
                                <input type="button" onclick="formReset();" value="Reset"/></td>
                            </tr>
                        </table>
                    </form>
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
