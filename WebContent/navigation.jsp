<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String page_name = request.getParameter("page_name");
	String home_active = "";
	String create_trip_active = "";
	String city_details_active = "";
	String browse_cities_active = "";
	String attraction_details_active = "";
	String publish_review_active = "";
	String trip_history_active = "";
	String administrator_active = "";
	String about_active = "";
	if (page_name.equals("home")) {
		home_active = "active";
	} else if (page_name.equals("create_trip")) {
		create_trip_active = "active";
//	} else if (page_name.equals("city_details")) {
//		city_details_active = "active";
	} else if (page_name.equals("browse_cities")) {
		browse_cities_active = "active";
//	} else if (page_name.equals("attraction_details")) {
//		attraction_details_active = "active";
	} else if (page_name.equals("publish_review")) {
		publish_review_active = "active";
	} else if (page_name.equals("trip_history")) {
		trip_history_active = "active";
	} else if (page_name.equals("administrator")) {
		administrator_active = "active";
	} else if (page_name.equals("about")) {
		about_active = "active";
	}
%>
<%=page_name%>
<div align="center">
    <ul>
        <li><a class="<%=home_active%>" href="home.jsp">Home</a></li>
        <li><a class="<%=create_trip_active%>" href="create_trip.jsp">Create Trip</a></li>
        <!-- <li><a class="<%=city_details_active%>" href="city_details.jsp">City Details</a></li> -->
        <li><a class="<%=browse_cities_active%>" href="browse_cities.jsp">Browse Cities</a></li>
        <!-- <li><a class="<%=attraction_details_active%>" href="attraction_details.jsp">Attraction Details</a></li> -->
        <li><a class="<%=publish_review_active%>" href="publish_review.jsp">Publish Review</a></li>
        <li><a class="<%=trip_history_active%>" href="trip_history.jsp">Trip History</a></li>
        <li><a class="<%=administrator_active%>" href="administrator.jsp">Administrator</a></li>
        <li style="float:right"><a class="<%=about_active%>" href="about.jsp">About</a></li>
    </ul>
</div>
<br/>
    