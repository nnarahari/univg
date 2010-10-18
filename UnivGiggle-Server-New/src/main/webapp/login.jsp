<%@ page language="java" contentType="text/html; charset=iso-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="menu_style.css">
<script type="text/javascript" src="userreg.js"></script>
<link rel="stylesheet" type="text/css" href="messages.css" />

<title>Welcome to Univgiggle Login Page</title></head>
<body>
<div class="header"></div>
<ul id="menu">
  <li></li>
    <li><a href="" target="_self" title="">HOME</a></li>
	<li><a href="" target="_self" title="">ABOUT</a></li>
	<li><a href="" target="_self" title="">STUDENTS</a></li>
	<li><a href="" target="_self" title="">P2P LENDERS</a></li>
	<li><a href="" target="_self" title="">CORPORATE LENDERS</a></li>
	<li><a href="" target="_self" title="">MENTOR PROGRAM</a></li>
	<li><a href="" target="_self" title="">UNIVERSITY CLASSIFIFD</a></li>
	<li><a href="" target="_self" title="">CONTACT US</a>      <br>
</li>
</ul>
<form name="form" id="form" class="form" action="success.html" onSubmit="return validate(this)" method="post">
  <table width="300px" align="center" style="border:1px solid #000000;background-color:#efefef;">
<tr><td colspan=2></td></tr>
<tr>
  <td colspan=2 align="center" style="font-weight:bold;font-size:20pt;">Univgiggle Login !!</td>
</tr>
  <tr>
    <td><b>Email Address</b></td>
    <td><input type="text" name="email" id="email" /></td>
  </tr>
  <tr>
    <td><b>Password</b></td>
    <td><input type="password" name="password" id="password" /></td>
  </tr>
  
  <tr>
    <td></td>
    <td><input type="submit" name="Submit" value="Submit"></td>
  </tr>
  <tr><td colspan=2>&nbsp;</td></tr>
</table>
</form>
</body>
</html>