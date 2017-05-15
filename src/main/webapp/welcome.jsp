<%@ page import="com.sun.org.apache.xpath.internal.operations.Bool" %>
<%@ page import="java.util.Locale" %>
<!--
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
-->
<html>
<head>
    <title>Login Page</title>
    <h1 style="text-align: center">WELCOME!</h1>
</head>
<body style="text-align: center">
<% Locale.setDefault(Locale.ENGLISH); %>
<c:choose>
<c:when test="${username==null}">
<table border="0" align="center">
    <tr><td>
        <p style="color: red;">${param.errorLogin}</p>
        <form name='f' action='/login' method='POST'>
            <table border="0" style="vertical-align: top">
                <tr><td style="text-align:left;vertical-align:top">
                    Login:
                    <br><br>Password:
                    <br><br><br>
                    <input name="submit" type="submit" value="Login"/>
                </td>
                    <td style="text-align:left;vertical-align:top">
                        <input type='text' name='username'/>
                        <br><br>
                        <input type='password' name='password'/>
                    </td></tr>
            </table>
        </form>
    </td></tr></table>
</c:when>
<c:otherwise>
<div style="position: fixed; top: 0%; right: 0;">
    <form action="${pageContext.request.contextPath}/logout" method="post">
        <input type="submit" value="Logout" />
    </form>
</div>
<c:choose>
<c:when test="${accountType=='ROLE_ADMIN'}">
<a href="${pageContext.request.contextPath}/forAdmins">only_for_admins</a>
</c:when>
<c:otherwise>
<a href="${pageContext.request.contextPath}/forUsers">only_for_user</a>
</c:otherwise>
</c:choose>
</c:otherwise>
</c:choose>
</html>