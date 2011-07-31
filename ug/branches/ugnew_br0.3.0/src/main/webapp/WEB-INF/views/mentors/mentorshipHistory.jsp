<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<div> 
	<h3>Current & Past Mentors</h3>
</div>

<div>
	<c:forEach var="mentor" items="${mentorsList}" varStatus="status">
		<table>
			<tr>
				<td>Mentor ${status.index}:  </td>
				<td> <a href="">${mentor.id}</a></td>
			</tr>
			<tr>
				<td>Days :  </td>
				<td> {mentor.acceptedDate} to 
					<c:if test= "${empty mentor.deactivationDate}" >
						till Date.
					</c:if>
					<c:if test= "${not empty mentor.deactivationDate}" >
						${mentor.deactivationDate}
					</c:if>
				</td>
			</tr>
			<tr colspan="2">
				<td>Messages  </td>
			</tr>
		</table>
		<br />
	</c:forEach>
</div>