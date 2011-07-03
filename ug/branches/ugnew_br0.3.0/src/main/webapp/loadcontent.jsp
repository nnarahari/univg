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
//LoadFirstTimeData.loadRoles(getServletContext().getRealPath("")+"/WEB-INF/classes/roles.xml");
//out.println("Loading Roles:Complete");
LoadFirstTimeData.loadCountry(getServletContext().getRealPath("")+"/WEB-INF/classes/country.xml");
out.println("Loading Country:Complete");
LoadFirstTimeData.loadSates(getServletContext().getRealPath("")+"/WEB-INF/classes/univ.xml");
out.println("Loading States:Complete");
LoadFirstTimeData.loadUniversities(getServletContext().getRealPath("")+"/WEB-INF/classes/univ.xml");
out.println("Loading Universities:Complete");
LoadFirstTimeData.loadDepartment(getServletContext().getRealPath("")+"/WEB-INF/classes/department.xml");
out.println("Loading Department:Complete");
LoadFirstTimeData.loadProgramStrudy(getServletContext().getRealPath("")+"/WEB-INF/classes/studyprogram.xml");
out.println("Loading ProgramStrudy:Complete");
LoadFirstTimeData.loadLoanNeeds(getServletContext().getRealPath("")+"/WEB-INF/classes/grantrequest.xml");
out.println("Loading GrantNeeds:Complete");
LoadFirstTimeData.loadGender(getServletContext().getRealPath("")+"/WEB-INF/classes/gender.xml");
out.println("Loading Gender Details:Complete");
LoadFirstTimeData.loadLoanstatus(getServletContext().getRealPath("")+"/WEB-INF/classes/loanstatus.xml");
out.println("Loading Loanstatus Details:Complete");

%>
</body>
</html>