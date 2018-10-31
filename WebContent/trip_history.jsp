<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
// TODO get current user and get history of trips from database
// TODO put list of history objects into pageContext
	String username = "USER NAME";
// TODO consider merging trip_details...
%>

<html lang="en">
<head>
    <title>Personal Trip Planner - <%=username%>'s Trip History</title>
	<%@ include file="shared_header.jsp"%>
</head>
<body>
	<jsp:include page="navigation.jsp" flush="true">
	    <jsp:param name="page_name" value="trip_history"/>
	</jsp:include>
	<table>
        <thead>
            <tr>
                <th>Date</th>
                <th>Attractions</th>
                <th></th>
            </tr>
        </thead>
        <tbody>
        <!-- TODO use c:forEach and read from list of history objects -->
        <!-- TODO details link should use url parameter to pass trip id -->
            <tr>
                <td>DATE AND TIME A</td>
                <td>Attraction A, Attraction B, Attraction C</td>
                <td><a href="trip_details.html">Details</a></td>
            </tr>
            <tr>
                <td>DATE AND TIME B</td>
                <td>Attraction A, Attraction B, Attraction C</td>
                <td><a href="trip_details.html">Details</a></td>
            </tr>
            <tr>
                <td>DATE AND TIME C</td>
                <td>Attraction A, Attraction B, Attraction C</td>
                <td><a href="trip_details.html">Details</a></td>
            </tr>
        </tbody>
    </table>
</body>
</html>