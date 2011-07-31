<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<div>
	<pre>
	UnivGiggle Mentorship program aims to locate potential Mentors for students 
	who can help them in their career growth. 
	By registering as a student with UnivGiggle you get access to our Mentorship program. 
	Search for Mentors based on your career aspirations and establish working releationships.
	</pre>
</div>

<div>
<h3>Current Status</h3>
Use <a href="searchForMentor">search For Mentor</a> to search for New/Other Mentors <br />
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

<div>
	<h3>Open Requests</h3>
	<c:forEach var="mentor" items="${openRequests}" varStatus="status">
		<table>
			<tr>
				<td>
					Mentor ${status.index}: <a href="">{mentor.id}</a>
				</td>
				<td>
					<a href="cancelMentorReq=${mentor.id}" >Cancel this request</a>
				</td>			
			</tr>
		</table>
	</c:forEach>
</div>