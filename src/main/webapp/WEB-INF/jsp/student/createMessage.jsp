<%-- 
    Document   : Home
    Created on : 25-Jun-2013, 12:03:40
    Author     : Robert Forde
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Message</title>
        <link href="<c:url value="/resources/css/default.css" />" rel="stylesheet">
        <link href="<c:url value="/resources/css/default2.css" />" rel="stylesheet">
        <script type="text/javascript">
            function resetForm() {
                document.getElementById("mailForm").reset();
                document.focus(mailForm.toName);
            }
        </script>
    </head>
    <body>
        <jsp:include page="header.jsp">
            <jsp:param name="menu" value="home"/>
        </jsp:include>
        <div id="MainPanel">
            <div id="LeftPanel">
                E-Mail
                <br>
                <br>
                Please do not use any abusive language in your messages. 
                Messages will be monitored and anybody disobeying the rules 
                will face disciplinary action which can mean suspension or 
                complete expulsion.
            </div>
            <div id="CenterPanel">
                <div id="HomeCenter">
                    <img height="50px" width="50px" src="<c:url value="/resources/images/sendmessage.JPG"/>" />
                </div>
                <br>
                <br>
                <div id="Size14">
                    <form:form id="mailForm" action="doCreateMessage.html" method="post" commandName="message">
                        <table>
                            <tr>
                                <td>From:</td>
                                <td><form:input readonly="true" path="fromId"/></td>
                            </tr>
                            <tr>
                                <td>Sender Name:</td>
                                <td><form:input readonly="true" path="fromName" /></td>
                            </tr>
                            <tr>
                                <td>To:</td>
                                <td><form:input path="toId" size="20"/></td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    Message (Maximum 250 character)
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <form:textarea rows="5" cols="50" path="message"/>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <input type="submit" value="Submit"/>
                                    &nbsp;&nbsp;
                                    <input type="button" value="Reset" onclick="resetForm();"/>
                                </td>
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
