<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
// TODO read current trip id from session and create trip summary object
// TODO put trip summary object into pageContext
// TODO read current search criteria from request and create list of attraction object
// TODO put list of attraction objects into pageContext
%>

<html lang="en">
<head>
    <title>Personal Trip Planner - Create Trip</title>
	<%@ include file="shared_header.jsp"%>
</head>
<body>
	<jsp:include page="navigation.jsp" flush="true">
	    <jsp:param name="page_name" value="create_trip"/>
	</jsp:include>
    <div class="row">
		<!-- TODO left column is to be rendered based on trip summary object -->
        <div class="summary_column" style="background-color:#aaa;">
            <h2>Trip Summary</h2>
            <dl>
                <dt><a href="attraction_details.html">ATTRACTION NAME A</a></dt>
                <dd><a href="city_details.html">CITY NAME A</a></dd>
                <dd><a href="placeholder_remove.html">remove</a></dd>
                <dt><a href="attraction_details.html">ATTRACTION NAME B</a></dt>
                <dd><a href="city_details.html">CITY NAME A</a></dd>
                <dd><a href="placeholder_remove.html">remove</a></dd>
                <dt><a href="attraction_details.html">ATTRACTION NAME C</a></dt>
                <dd><a href="city_details.html">CITY NAME B</a></dd>
                <dd><a href="placeholder_remove.html">remove</a></dd>
                <dt><a href="attraction_details.html">ATTRACTION NAME D</a></dt>
                <dd><a href="city_details.html">CITY NAME C</a></dd>
                <dd><a href="placeholder_remove.html">remove</a></dd>
                <dt><a href="attraction_details.html">ATTRACTION NAME E</a></dt>
                <dd><a href="city_details.html">CITY NAME A</a></dd>
                <dd><a href="placeholder_remove.html">remove</a></dd>
            </dl>
            <form action="trip_details.html">
            	<label for="start_time">Daily Start Time</label>
		        <select id="start_time" name="start_time">
		            <option value="9">9</option>
		            <option value="10">10</option>
		            <option value="11">11</option>
		            <option value="12">12</option>
		            <option value="13">13</option>
		        </select>
            	<label for="end_time">Daily End Time</label>
		        <select id="end_time" name="end_time">
		            <option value="19">19</option>
		            <option value="20">20</option>
		            <option value="21">21</option>
		            <option value="22">22</option>
		            <option value="23">23</option>
		        </select>
            	<label for="transportation">Preferred Mode of Inter-City Transportation</label>
		        <select id="transportation" name="transportation">
		            <option value="any">Any</option>
		            <option value="air">Air</option>
		            <option value="land">Land</option>
		        </select>
                <input type="submit" value="Create Trip">
            </form>
        </div>
        <!-- TODO right column search form should contain current search criteria -->
        <!-- TODO right column search results should be rendered based on list of attraction objects -->
        <div class="search_column" style="background-color:#bbb;">
            <form>
                <label for="city_pattern">City</label>
                <input type="text" id="city_pattern" name="city_pattern" placeholder="pattern in city name..."/>
                <label for="attraction_pattern">Attraction</label>
                <input type="text" id="attraction_pattern" name="attraction_pattern" placeholder="pattern in attaction name..."/>
                <label for="cost_low">Cost Range</label>
		        <select id="cost_low" name="cost_low">
		            <option value="1">1</option>
		            <option value="2">2</option>
		            <option value="3">3</option>
		            <option value="4">4</option>
		            <option value="5">5</option>
		        </select>
		        <select id="cost_high" name="cost_high">
		            <option value="1">1</option>
		            <option value="2">2</option>
		            <option value="3">3</option>
		            <option value="4">4</option>
		            <option value="5">5</option>
		        </select>
		        <label for="attraction_type">Type of Attraction</label>
		        <select id="attraction_type" name="attraction_type" multiple>
		            <option selected value="all">All</option>
		            <option value="nature">Nature</option>
		            <option value="religion">Religion</option>
		            <option value="neighbourhood">Neighbourhood</option>
		            <option value="museum">Museum</option>
		            <option value="entertainment">Entertainment</option>
		        </select>
                <input type="submit" name="search" id="search" value="Search"/>
            </form>
            <form>
                <table>
                    <thead>
                        <tr>
                            <th>Attraction</th>
                            <th>City</th>
                            <th>Average Rating</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><a href="attraction_details.html">ATTRACTION NAME A</a></td>
                            <td><a href="city_details.html">CITY NAME A</a></td>
                            <td>SCORE A</td>
                            <td><input formaction="" type="submit" value="Add"></td>
                        </tr>
                        <tr>
                            <td><a href="attraction_details.html">ATTRACTION NAME B</a></td>
                            <td><a href="city_details.html">CITY NAME B</a></td>
                            <td>SCORE B</td>
                            <td><input formaction="" type="submit" value="Add"></td>
                        </tr>
                        <tr>
                            <td><a href="attraction_details.html">ATTRACTION NAME C</a></td>
                            <td><a href="city_details.html">CITY NAME C</a></td>
                            <td>SCORE C</td>
                            <td><input formaction="" type="submit" value="Add"></td>
                        </tr>
                        <tr>
                            <td><a href="attraction_details.html">ATTRACTION NAME D</a></td>
                            <td><a href="city_details.html">CITY NAME D</a></td>
                            <td>SCORE D</td>
                            <td><input formaction="" type="submit" value="Add"></td>
                        </tr>
                    </tbody>
                </table>
            </form>
        </div>
    </div>
</body>
</html>
