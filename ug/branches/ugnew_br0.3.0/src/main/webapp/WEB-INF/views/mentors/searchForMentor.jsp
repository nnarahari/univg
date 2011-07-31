<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<div>
	<center><h2>List of Mentors</h2></center>
	<c:forEach var="mentor" items="${mentorsList}" varStatus="status">
		<a href="">${mentor.id}</a><br />
	</c:forEach>
</div>
<br />
<div>
	<center><h2>UnivGiggle Suggested Mentors</h2></center>
</div>

<div>
	<center><h3>Use Filters below to look for specific mentors</h3></center>
</div>