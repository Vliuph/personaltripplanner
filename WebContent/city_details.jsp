<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="com.mie.model.City" %>
<%
	City city = null;
	String city_name = null;
	String city_id = request.getParameter("city_id");
	if (city_id != null) {
		city = City.getByID(Integer.parseInt(city_id));
		if (city != null) {
			city_name = city.getName();
		}
	}
	pageContext.setAttribute("city", city);
	pageContext.setAttribute("city_name", city_name);
%>

<html lang="en">
<head>
    <title>Personal Trip Planner - <%=city_name%></title>
	<%@ include file="shared_header.jsp"%>
</head>
<body>
	<jsp:include page="navigation.jsp" flush="true">
	    <jsp:param name="page_name" value="city_details"/>
	</jsp:include>
    <h1 align="center"><%=city_name%></h1>
    <div class="row">
        <div class="column" style="background-color:#aaa;">
        	<img width="90%" src="img/<c:out value="${city.getMapPath()}"/>"/>
        	<c:forEach items="${city.getImagePaths()}" var="path">
            	<img width="90%" src="img/<c:out value="${path}"/>"/>
            </c:forEach>
        </div>
        <div class="column" style="background-color:#bbb;">
            <h3>Description</h3>
            <p><c:out value="${city.getDescription()}"/></p>
            <h3>Map Link</h3>
			<td><a href="<c:out value="${city.getMapLink()}"/>"><c:out value="${city.getMapLink()}"/></a></td>
            <h3>Attractions</h3>
            <c:forEach items="${city.getAttractions()}" var="attraction">
	            <h4><a href="attraction_details.jsp?attraction_id=<c:out value="${attraction.getID()}"/>"><c:out value="${attraction.getName()}"/></a></h4>
	            <img width="90%" src="img/<c:out value="${attraction.getImagePaths().get(0)}"/>"/>
            </c:forEach>
        </div>
    </div>
</body>
</html>
