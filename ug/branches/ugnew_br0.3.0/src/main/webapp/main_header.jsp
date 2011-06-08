<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<%@ page import="com.ug.domain.User,com.ug.domain.UserRole,com.ug.util.UgUtil;" %>
<%@ taglib uri="http://www.springframework.org/spring-social/facebook/tags" prefix="facebook" %>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="EN" lang="EN" dir="ltr">
<head profile="http://gmpg.org/xfn/11">
<link rel="shortcut icon" href="images/demo/univ_giggle_logo_v6.gif" />
<title>UnivGiggle - Connect World Together.</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<meta http-equiv="imagetoolbar" content="no" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/styles/layout_template.css" type="text/css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/styles/tables_template.css" type="text/css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/styles/navi_template.css" type="text/css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/styles/forms_template.css" type="text/css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/styles/featured_slide_template.css" type="text/css" />
<style type="text/css">

input.groovybutton
{
	font-size:12px;
	font-weight:bold;
	color:#330000;
	background-color:#0099FF;
	border-style:outset;
	border-color:#0099FF;
}

</style>

</head>
<body id="top">
<div id="header">
  <div class="wrapper">
    <div class="fl_left">
      <h1><a href="#"><img src="<%=request.getContextPath()%>/images/demo/final_logo1.jpg" alt="" width="137" /></a></h1>
    </div>
    <div class="fl_right"> 
	<div id="">
	<%
	if (UgUtil.getLoggedInUser() !=null) {
	 User user = UgUtil.getLoggedInUser();%>
	 	<strong><%=(user.getFirstName()!=null) ? "Welcome  "+user.getFirstName():""%> <%=user.getLastName()!=null?user.getLastName():""%>  </strong>|<a href="<%=request.getContextPath()%>/resources/j_spring_security_logout">SIGN OUT</a>

	<%} %>
 
 <% if (UgUtil.getLoggedInUser() == null) { %>
   	  <form id="form1" name="form1" method="post" action="<%=request.getContextPath()%>/resources/j_spring_security_check"><label>Username:</label>
	    <label for="username"></label>
	    <input name="j_username" type="text" id="j_username" size="20" maxlength="256" />
		<label>Password:<input name="j_password" id="j_password"  type="password" size="20" maxlength="20" /></label>
		<input type="submit" value="Login" class="groovybutton" /> 
      </form> 
            <br/>
	<div class="fl_left">
        <form id="fb_signin" action="auth.do" method="post">
		    <div id="fb-root"></div>	
		    <p><fb:login-button onlogin="$('#fb_signin').submit();" v="2" length="long">Connect to Facebook</fb:login-button></p>
		</form>
		<facebook:init appId="120877611282582"/>
         <a href="<%=request.getContextPath()%>/forgotpassword/index">Forgot Password??</a>| <a href="/ugbeta/signup?form"> New User Sign Up</a>
		<script src="http://connect.facebook.net/en_US/all.js"></script>
        </div>
        <%} %>
       </div>
	</div>
	<br class="clear" />
  </div>
</div>
<!-- 
####################################################################################################### -->
<div id="topbar">
  <div class="wrapper">
    <div id="topnav">
      <ul>
        <li class="active"><a href="main.jsp">Home</a></li>
        <li><a href="studentBeforelogin">STUDENT</a></li>
        <li><a href="corporateBeforelogin">CORPORATES</a></li>
		<li><a href="#">P2P</a></li>
		<li><a href="#">MENTORSHIP</a></li>
		<li><a href="#">CONTACT US</a></li>
      </ul>
    </div>
    <div id="search">
      <form action="#" method="post">
        <fieldset>
        <legend>Site Search</legend>
        <input type="text" value="Search Our Website&hellip;"  onfocus="this.value=(this.value=='Search Our Website&hellip;')? '' : this.value ;" />
        <input type="submit" name="go" id="go" value="Search" />
        </fieldset>
      </form>
    </div>
    <br class="clear" />
  </div>
</div><!-- ####################################################################################################### -->
</body>
</html>
