<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="java.util.List" %>
<%@ page import="com.mie.model.City" %>
<%
	List<City> cities = City.getAllCities();
	pageContext.setAttribute("cities", cities);
%>

<html lang="en">
<head>
    <title>Personal Trip Planner - Browse Cities</title>
	<%@ include file="shared_header.jsp"%>
</head>
<body>
	<jsp:include page="navigation.jsp" flush="true">
	    <jsp:param name="page_name" value="browse_cities"/>
	</jsp:include>
	<h2>All Cities</h2>
	<table>
        <thead>
            <tr>
                <th>Name</th>
                <th>Map Link</th>
                <th># of Attractions</th>
            </tr>
        </thead>
        <tbody>
        	<c:forEach items="${cities}" var="city">
	        	<tr>
	        		<td><a href="city_details.jsp?city_id=<c:out value="${city.getID()}"/>"><c:out value="${city.getName()}"/></a></td>
	        		<td><a href="<c:out value="${city.getMapLink()}"/>">Link</a></td>
	        		<td><c:out value="${city.getAttractions().size()}"/></td>
	        	</tr>
        	</c:forEach>
        </tbody>
    </table>
</body>
</html>
