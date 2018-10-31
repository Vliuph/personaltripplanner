<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="com.mie.model.Attraction" %>
<%
	Attraction attraction = null;
	String attraction_name = null;
	String attraction_id = request.getParameter("attraction_id");
	if (attraction_id != null) {
		attraction = Attraction.getByID(Integer.parseInt(attraction_id));
		if (attraction != null) {
			attraction_name = attraction.getName();
		}
	}
	pageContext.setAttribute("attraction", attraction);
	pageContext.setAttribute("attraction_name", attraction_name);
%>

<html lang="en">
<head>
    <title>Personal Trip Planner - <%=attraction_name%></title>
	<%@ include file="shared_header.jsp"%>
</head>
<body>
	<jsp:include page="navigation.jsp" flush="true">
	    <jsp:param name="page_name" value="home"/>
	</jsp:include>
	<h1 align="center"><%=attraction_name%></h1>
	<div class="row">
        <div class="column" style="background-color:#aaa;">
            <img width="90%" src="img/<c:out value="${attraction.getMapPath()}"/>"/>
            <c:forEach items="${attraction.getImagePaths()}" var="path">
            	<img width="90%" src="img/<c:out value="${path}"/>"/>
            </c:forEach>
        </div>
        <div class="column" style="background-color:#bbb;">
            <h3>Description</h3>
            <p><c:out value="${attraction.getDescription()}"/></p>
            <h3>Overall Rating: <c:out value="${attraction.getOverallRating()}"/></h3>
            <h3>Reviews</h3>
            <form action="publish_review.jsp">
            	<input type="hidden" id="attraction_id" name="attraction_id" value="<c:out value="${attraction.getID()}"/>">
                <input type="submit" value="Write Review">
            </form>
            <c:forEach items="${attraction.getReviews()}" var="review">
            	<h4><c:out value="${review.getSubmittedDatetime()}"/> by <c:out value="${review.getUsername()}"/></h4>
            	<h5>Rating: <c:out value="${review.getRating()}"/></h5>
            	<p><c:out value="${review.getText()}"/></p>
            </c:forEach>
        </div>
    </div>
</body>
</html>
