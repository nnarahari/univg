<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<div>
	<h3>Share your experience. Write a testimonial for UnivGiggle</h3><br />
	<form name="genTestimonial">
		<textarea rows="5" cols="50"></textarea><br />
		<input type="submit" value="submit"><input type="reset" value="Clear">
	</form>
</div>

<div>
	<h3>Write testimonial for current Mentors</h3><br />
	<form name="mentorTestimonial">
		Select Mentor : <select></select><br />
		<textarea rows="5" cols="50"></textarea><br />
		<input type="submit" value="submit"><input type="reset" value="Clear">
	</form>
</div>

<div>
	<table border="1">
		<tr>
			<th> Testimonials Received</th>
			<th> Testimonials Written </th>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>		
		
		
	</table>
</div>