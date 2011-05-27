<%@page import="com.ug.util.LoadFirstTimeData"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
LoadFirstTimeData.loadSates("C:/ug/xml/univ.xml");
out.println("Loading States:Complete");
LoadFirstTimeData.loadUniversities("C:/ug/xml/univ.xml");
out.println("Loading Universities:Complete");
LoadFirstTimeData.loadDepartment("C:/ug/xml/department.xml");
out.println("Loading Department:Complete");
LoadFirstTimeData.loadProgramStrudy("C:/ug/xml/studyprogram.xml");
out.println("Loading ProgramStrudy:Complete");
LoadFirstTimeData.loadLoanNeeds("C:/ug/xml/grantrequest.xml");
out.println("Loading GrantNeeds:Complete");
LoadFirstTimeData.loadGender("C:/ug/xml/gender.xml");
out.println("Loading Gender Details:Complete");
LoadFirstTimeData.loadLoanstatus("C:/ug/xml/loanstatus.xml");
out.println("Loading Loanstatus Details:Complete");

%>
</body>
</html>