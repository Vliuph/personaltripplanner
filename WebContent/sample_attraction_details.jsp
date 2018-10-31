<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
// TODO read attraction id from request and build attraction object
// TODO put attraction object into pageContext
	String attraction_name = "ATTRACTION NAME";
	String city_name = "CITY NAME";
// TODO this page should have 2 modes
//		1, when attraction id is present, show attraction info
//		2, when id not present, show search
%>

<html lang="en">
<head>
    <title>Personal Trip Planner - <%=attraction_name%>, <%=city_name%></title>
	<%@ include file="shared_header.jsp"%>
</head>
<body>
	<jsp:include page="navigation.jsp" flush="true">
	    <jsp:param name="page_name" value="attraction_details"/>
	</jsp:include>
	<h1 align="center"><%=attraction_name%>, <%=city_name%></h1>
	<!-- TODO load data from attraction object -->
	<!-- wherever needed, use c:forEach -->
    <div class="row">
        <div class="column" style="background-color:#aaa;">
            <img width="90%" src="img/20c815b8-6ada-45a2-91a6-0f62598d9923.png"/>
            <img width="90%" src="img/Miami_Wheel_JoraVision.jpg"/>
            <img width="90%" src="img/penguins-sealife-aquarium-melbourne.jpg"/>
            <img width="90%" src="img/bangkok-attractions.jpg"/>
        </div>
        <div class="column" style="background-color:#bbb;">
            <h3>Description</h3>
            <p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo. Quisque sit amet est et sapien ullamcorper pharetra. Vestibulum erat wisi, condimentum sed, commodo vitae, ornare sit amet, wisi. Aenean fermentum, elit eget tincidunt condimentum, eros ipsum rutrum orci, sagittis tempus lacus enim ac dui. Donec non enim in turpis pulvinar facilisis. Ut felis. Praesent dapibus, neque id cursus faucibus, tortor neque egestas augue, eu vulputate magna eros eu erat. Aliquam erat volutpat. Nam dui mi, tincidunt quis, accumsan porttitor, facilisis luctus, metus<</p>
            <h3>Overall Rating: SCORE</h3>
            <h3>Features</h3>
            <dl>
                <dt>FEATURE A</dt>
                <dd>FEATURE A DETAILS</dd>
                <dt>FEATURE A</dt>
                <dd>FEATURE A DETAILS</dd>
                <dt>FEATURE A</dt>
                <dd>FEATURE A DETAILS</dd>
            </dl>
            <h3>Reviews</h3>
            <form action="review.jsp">
                <input type="submit" value="Write Review">
            </form>
            <h4>DATE AND TIME BY USER NAME A</h4>
            <h5>Rating: SCORE A</h5>
            <p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo. Quisque sit amet est et sapien ullamcorper pharetra. Vestibulum erat wisi, condimentum sed, commodo vitae, ornare sit amet, wisi. Aenean fermentum, elit eget tincidunt condimentum, eros ipsum rutrum orci, sagittis tempus lacus enim ac dui. Donec non enim in turpis pulvinar facilisis. Ut felis. Praesent dapibus, neque id cursus faucibus, tortor neque egestas augue, eu vulputate magna eros eu erat. Aliquam erat volutpat. Nam dui mi, tincidunt quis, accumsan porttitor, facilisis luctus, metus<</p>
            <h4>DATE AND TIME BY USER NAME B</h4>
            <h5>Rating: SCORE B</h5>
            <p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo. Quisque sit amet est et sapien ullamcorper pharetra. Vestibulum erat wisi, condimentum sed, commodo vitae, ornare sit amet, wisi. Aenean fermentum, elit eget tincidunt condimentum, eros ipsum rutrum orci, sagittis tempus lacus enim ac dui. Donec non enim in turpis pulvinar facilisis. Ut felis. Praesent dapibus, neque id cursus faucibus, tortor neque egestas augue, eu vulputate magna eros eu erat. Aliquam erat volutpat. Nam dui mi, tincidunt quis, accumsan porttitor, facilisis luctus, metus<</p>
            <h4>DATE AND TIME BY USER NAME C</h4>
            <h5>Rating: SCORE C</h5>
            <p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo. Quisque sit amet est et sapien ullamcorper pharetra. Vestibulum erat wisi, condimentum sed, commodo vitae, ornare sit amet, wisi. Aenean fermentum, elit eget tincidunt condimentum, eros ipsum rutrum orci, sagittis tempus lacus enim ac dui. Donec non enim in turpis pulvinar facilisis. Ut felis. Praesent dapibus, neque id cursus faucibus, tortor neque egestas augue, eu vulputate magna eros eu erat. Aliquam erat volutpat. Nam dui mi, tincidunt quis, accumsan porttitor, facilisis luctus, metus<</p>
        </div>
    </div>
</body>
</html>
