<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="com.mie.model.Attraction" %>
<%
	Attraction attraction = null;
	String attraction_name = null;
	String username = (String) session.getAttribute("username");
	pageContext.setAttribute("username", username);
	String attraction_id = request.getParameter("attraction_id");
	pageContext.setAttribute("attraction_id", attraction_id);
	if (attraction_id != null) {
		attraction = Attraction.getByID(Integer.parseInt(attraction_id));
		if (attraction != null) {
			attraction_name = attraction.getName();
		}
	}
	pageContext.setAttribute("attraction_name", attraction_name);
%>

<html lang="en">
<head>
    <title>Personal Trip Planner - Publish Review for <%=attraction_name%></title>
	<%@ include file="shared_header.jsp"%>
</head>
<body>
	<jsp:include page="navigation.jsp" flush="true">
	    <jsp:param name="page_name" value="publish_review"/>
	</jsp:include>
	<!-- TODO placeholder text for attraction name should use name set aside earlier -->
	<!-- TODO submit should to Review Controller -->
	<c:if test="${username == null}">
		<p>username is null</p>
	</c:if>
	<c:if test="${attraction_name == null}">
		<p>attraction_name is null</p>
	</c:if>
	<c:if test="${username != null && attraction_name != null}">
		<form action="PublishReviewController">
			<input type="hidden" id="attraction_id" name="attraction_id" value="<%=attraction_id%>"/>
			<input type="hidden" id="username" name="username" value="<%=username%>"/>
	        <label for="attraction">Attraction</label>
	        <input type="text" id="attraction" name="attraction" placeholder="<%=attraction_name%>" disabled/>
	        <textarea name="review_text" rows="30" placeholder="please write your review here..."></textarea>
	        <label for="rating">Overall Rating</label>
	        <select id="rating" name="rating">
	            <option value="1">1</option>
	            <option value="2">2</option>
	            <option value="3">3</option>
	            <option value="4">4</option>
	            <option value="5">5</option>
	        </select>
	        <input type="submit" value="Publish Review">
	    </form>
    </c:if>
</body>
</html>
