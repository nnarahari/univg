<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page import="com.ug.domain.User,com.ug.domain.UserRole,com.ug.util.UgUtil;" %>
  <jsp:directive.page contentType="text/html;charset=UTF-8" />
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="EN" lang="EN" dir="ltr">
<head profile="http://gmpg.org/xfn/11">
<link rel="shortcut icon" href="<%=request.getContextPath() %>/images/demo/univ_giggle_logo_v6.gif" />
<title>UnivGiggle - Connect World Together.</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<meta http-equiv="imagetoolbar" content="no" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/styles/layout.css" type="text/css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/ugbeta1/scripts/jquery-1.4.1.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/scripts/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/scripts/jquery.hoverIntent.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/scripts/jquery.hslides.1.0.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/scripts/jquery.hslides.setup.js"></script>
</head>
<body id="top">

         
<!-- 
####################################################################################################### -->
<body id="top">
<div id="header">
  <div class="wrapper">
  
    <div class="fl_left">
      <h1><a href="#"><img src="<%=request.getContextPath() %>/images/demo/final_logo1.jpg" alt="" width="137" /></a></h1>
    </div>
    <div class="fl_right"> 
	
	<strong>Welcome </strong> </a>|<a href="<%=request.getContextPath() %>/resources/j_spring_security_logout">SIGN OUT</a>
  </div>
</div>
</div>

<div id="topbar">
  <div class="wrapper">
    <div id="topnav">
   
      <ul>
        <li class="active"><a href="main.jsp">Home</a></li>
        <li><a href="<%=request.getContextPath() %>/login/success">STUDENT</a></li>
        <li><a href="<%=request.getContextPath() %>/login/success">CORPORATES</a></li>
		<li><a href="#">P2P</a></li>
		<li><a href="#">MENTORSHIP</a></li>
		<li><a href="#">CONTACT US</a></li>
<!-- 		<li><a href="<%=request.getContextPath() %>/resources/j_spring_security_logout">SIGN OUT</a></li> -->
      </ul>
    </div>
   
  </div>
</div>