<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link href="<c:url value="/resources/css/default.css" />" rel="stylesheet">
        <link href="<c:url value="/resources/css/default2.css" />" rel="stylesheet">
        <script type="text/javascript">
            function formReset() {
                document.getElementById("loginForm").reset();
                document.loginForm.user.focus();
            }
        </script>
    </head>
    <body>
        <div id="LoginHead">
            Student Information System
        </div>
        <div id="LoginBox">
            <div id="LoginBoxHead">
                Login
            </div>
            <form:form id ="loginForm" action="doLogin.html" method="post" commandName="user">
                <table style="margin: 20px 0 0 50px;">
                    <tr>
                        <td>
                            User ID
                        </td>
                        <td>
                            <form:input size="20" path="sid"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Password
                        </td>
                        <td>
                            <form:input type="password" size="20" path="password"/>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <input type="submit" value="Submit"/>
                            <input type="button" value="Reset" onclick="formReset();"/>
                        </td>
                    </tr>
                </table>
            </form:form>
        </div>
    </body>
</html>
