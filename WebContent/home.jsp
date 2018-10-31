<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	String username = (String) session.getAttribute("username");
	pageContext.setAttribute("username", username);
	String login_failed = request.getParameter("login_failed");
	pageContext.setAttribute("login_failed", login_failed != null && login_failed.equals("true"));
	String logout = request.getParameter("logout");
	pageContext.setAttribute("logout", logout != null && logout.equals("true"));
%>

<html lang="en">
<head>
    <title>Personal Trip Planner - Welcome, <%=username%></title>
	<%@ include file="shared_header.jsp"%>
</head>
<body>
	<jsp:include page="navigation.jsp" flush="true">
	    <jsp:param name="page_name" value="home"/>
	</jsp:include>
	<c:out value="${username}"/>
	<c:if test="${username != null}">
    	<h1 align="center">Welcome, <%=username%></h1>
    	<p align="center"><a href="LogoutController">Logout</a></p>
    </c:if>
    <c:if test="${username == null}">
    	<c:if test="${login_failed.equals(true)}">
    	<p>invalid username or password</p>
    	</c:if>
	    <form action="LoginController">
	        <label for="username">Username</label>
	        <input type="text" id="username" name="username" placeholder="username...">
	        <label for="password">Password</label>
	        <input type="password" id="password" name="password" placeholder="password...">
	        <input type="submit" value="Login">
	        <input type="submit" value="Register" formaction="register.jsp">
	    </form>
    </c:if>
</body>
</html>
