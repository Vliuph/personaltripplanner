<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
<head>
    <title>Travel Planner - Welcome, USER NAME</title>
	<%@ include file="shared_header.jsp"%>
</head>
<body>
	<jsp:include page="navigation.jsp" flush="true">
	    <jsp:param name="page_name" value="administrator"/>
	</jsp:include>
    <h1 align="center">Administrator Page</h1>
    <dl>
        <dt>this page will contain the following functionalities</dt>
        <dd>view database tables</dd>
        <dd>edit city and attraction data</dd>
        <dd>view user and review information</dd>
        <dt>priority: low</dt>
    </dl>
</body>
</html>