<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
// TODO read city id from request and build city object
// TODO put city object into pageContext
	String city_name = "CITY NAME";
// TODO this page should have 2 modes
//		1, when city id is present, show city info
//		2, when id not present, show list of all cities
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
	<!-- TODO load data from city object -->
	<!-- wherever needed, use c:forEach -->
    <div class="row">
        <div class="column" style="background-color:#aaa;">
            <img width="90%" src="img/Red-Map-Barcelona-Image_1024x1024.png"/>
            <img width="90%" src="img/1464_Millennium_Park.original.jpg"/>
            <img width="90%" src="img/180315-most-expensive-city-world-feature.jpg"/>

        </div>
        <div class="column" style="background-color:#bbb;">
            <h3>Description</h3>
            <p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo. Quisque sit amet est et sapien ullamcorper pharetra. Vestibulum erat wisi, condimentum sed, commodo vitae, ornare sit amet, wisi. Aenean fermentum, elit eget tincidunt condimentum, eros ipsum rutrum orci, sagittis tempus lacus enim ac dui. Donec non enim in turpis pulvinar facilisis. Ut felis. Praesent dapibus, neque id cursus faucibus, tortor neque egestas augue, eu vulputate magna eros eu erat. Aliquam erat volutpat. Nam dui mi, tincidunt quis, accumsan porttitor, facilisis luctus, metus<</p>
            <h3>Features</h3>
            <dl>
                <dt>FEATURE A</dt>
                <dd>FEATURE A DETAILS</dd>
                <dt>FEATURE A</dt>
                <dd>FEATURE A DETAILS</dd>
                <dt>FEATURE A</dt>
                <dd>FEATURE A DETAILS</dd>
            </dl>
            <h3>Attractions</h3>
            <h4><a href="attraction_details.jsp">ATTRACTION NAME A</a></h4>
            <img width="90%" src="img/Miami_Wheel_JoraVision.jpg"/>
            <h4><a href="attraction_details.jsp">ATTRACTION NAME B</a></h4>
            <img width="90%" src="img/penguins-sealife-aquarium-melbourne.jpg"/>
            <h4><a href="attraction_details.jsp">ATTRACTION NAME C</a></h4>
            <img width="90%" src="img/bangkok-attractions.jpg"/>
        </div>
    </div>
</body>
</html>
