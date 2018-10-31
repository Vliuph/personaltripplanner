<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
// TODO get obtain current trip id from session and all trip steps
// TODO put list of trip step objects into pageContext
	String trip_name = "DATE AND TIME BY USER NAME";
%>

<html lang="en">
<head>
    <title>Personal Trip Planner - Trip Details - <%=trip_name%></title>
	<%@ include file="shared_header.jsp"%>
</head>
<body>
	<jsp:include page="navigation.jsp" flush="true">
	    <jsp:param name="page_name" value="home"/>
	</jsp:include>
	<h1>Trip Details - <%=trip_name%></h1>
	<!-- TODO use c:forEach and read from list of trip step objects -->
	<!-- TODO links to city and attraction details pages should pass city and attraction id as url parameter -->
	<table>
        <thead>
            <tr>
                <th>Start Day and Hour</th>
                <th>Duration</th>
                <th>Activity Type</th>
                <th>Location</th>
                <th>City</th>
                <th>Description</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>DAY AND HOUR A</td>
                <td>4 hours</td>
                <td>Attraction</td>
                <td><a href="attraction_details.jsp">Attraction A</a></td>
                <td><a href="city_details.jsp">City A</a></td>
                <td><p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.</p></td>
            </tr>
            <tr>
                <td>DAY AND HOUR B</td>
                <td>6 hours</td>
                <td>Free Activity</td>
                <td></td>
                <td><a href="city_details.jsp">City A</a></td>
                <td><p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.</p></td>
            </tr>
            <tr>
                <td>DAY AND HOUR C</td>
                <td>6 hours</td>
                <td>Attraction</td>
                <td><a href="attraction_details.jsp">Attraction B</a></td>
                <td><a href="city_details.jsp">City A</a></td>
                <td><p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.</p></td>
            </tr>
            <tr>
                <td>DAY AND HOUR D</td>
                <td>10 hours</td>
                <td>Transportation</td>
                <td></td>
                <td><a href="city_details.jsp">City B</a></td>
                <td><p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.</p></td>
            </tr>
        </tbody>
	</table>
</body>
</html>
