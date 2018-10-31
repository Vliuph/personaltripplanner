<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	String duplicate_user = request.getParameter("duplicate_user");
	pageContext.setAttribute("duplicate_user", duplicate_user != null && duplicate_user.equals("true"));
	String password_mismatch = request.getParameter("password_mismatch");
	pageContext.setAttribute("password_mismatch", password_mismatch != null && password_mismatch.equals("true"));
%>

<html lang="en">
<head>
    <title>Personal Trip Planner - Register New User</title>
	<%@ include file="shared_header.jsp"%>
</head>
<body>
	<jsp:include page="navigation.jsp" flush="true">
	    <jsp:param name="page_name" value="register"/>
	</jsp:include>
	<h1 align="center">Register Name User</h1>
	<c:if test="${duplicate_user.equals(true)}">
		<p>duplicate username used!</p>
	</c:if>
	<c:if test="${password_mismatch.equals(true)}">
		<p>passwords did not agree!</p>
	</c:if>
    <form action="RegisterController">
        <label for="username">Username</label>
        <input type="text" id="username" name="username" placeholder="username...">
        <label for="password">Password</label>
        <input type="password" id="password" name="password" placeholder="password...">
        <label for="confirm_password">Confirm Password</label>
        <input type="password" id="confirm_password" name="confirm_password" placeholder="confirm password...">
        <input type="submit" value="Register">
    </form>
</body>
</html>
