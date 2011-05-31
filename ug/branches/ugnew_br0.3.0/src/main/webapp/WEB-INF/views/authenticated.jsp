<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Spring Social Facebook</title>
</head>
<body>
	<h1>Authenticated!</h1>
	<p>
		<img src="https://graph.facebook.com/${picture}/picture?type=large" alt="" width="200"/>
	</p>
	<p>
		Welcome ${userProfile.firstName} ${userProfile.lastName}
	</p>
</body>
</html>