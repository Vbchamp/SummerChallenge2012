<%-- 
    Document   : loginView
    Created on : Jul 21, 2012, 4:08:29 PM
    Author     : Vaibhav
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <style>
        table{
            border-style: groove;
            border-width: 5px;
            border-color: greenyellow;
            background-color: bisque;
        }
        td{
            text-align: center;
        }
    </style>
    <body>
        <h4>
            ${Message}
        </h4>
    <center>
        <spring:nestedPath path="name">
            <form action="" method="post">

                <table>
                    <tr>
                        <td>User ID:</td>
                        <td>
                            <spring:bind path="id">
                                <input type="text" name="${status.expression}" value="${status.value}">
                            </spring:bind>
                        </td>
                    </tr>
                    <tr>
                        <td>Password:</td>
                        <td>
                            <spring:bind path="pwd">
                                <input type="text" name="${status.expression}" value="${status.value}">
                            </spring:bind>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <input type="submit" value="Submit">
                            <input type="reset" value="Reset">
                        </td>
                    </tr>
                </table>
            </form>
        </spring:nestedPath>
    </center>
</body>
</html>
