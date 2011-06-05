<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="EN" lang="EN" dir="ltr">
<head profile="http://gmpg.org/xfn/11">
<link rel="shortcut icon" href="images/demo/univ_giggle_logo_v6.gif" />
<title>UnivGiggle - Connect World Together.</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<meta http-equiv="imagetoolbar" content="no" />
<link rel="stylesheet" href="styles/layout_template.css" type="text/css" />
<link rel="stylesheet" href="styles/tables_template.css" type="text/css" />
<link rel="stylesheet" href="styles/navi_template.css" type="text/css" />
<link rel="stylesheet" href="styles/forms_template.css" type="text/css" />
<link rel="stylesheet" href="styles/featured_slide_template.css" type="text/css" />
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

<script type="text/javascript" src="scripts/jquery-1.4.1.min.js"></script>
<script type="text/javascript" src="scripts/jquery.jcarousel.pack.js"></script>
<script type="text/javascript" src="scripts/jquery.jcarousel.setup.js"></script>
<script type="text/javascript" src="scripts/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="scripts/jquery.hoverIntent.js"></script>
<script type="text/javascript" src="scripts/jquery.hslides.1.0.js"></script>
<script type="text/javascript" src="scripts/jquery.hslides.setup.js"></script>
<script type="text/javascript" src="scripts/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="scripts/jquery.hoverIntent.js"></script>
<script type="text/javascript" src="scripts/jquery.hslides.1.0.js"></script>
<script type="text/javascript" src="scripts/jquery.hslides.setup.js"></script>
</head>
<body id="top">
<div id="header">
  <div class="wrapper">
    <div class="fl_left">
      <h1><a href="#"><img src="images/demo/final_logo1.jpg" alt="" width="137" /></a></h1>
    </div>
    <div class="fl_right"> 
	<div id="">
	  <form id="form1" name="form1" method="post" action="<%=request.getContextPath()%>/resources/j_spring_security_check"><label>Username:</label>
	    <label for="username"></label>
	    <input name="j_username" type="text" id="j_username" size="20" maxlength="256" />
<label>Password:<input name="j_password" id="j_password"  type="password" size="20" maxlength="20" /></label>
<input type="submit" value="Login" class="groovybutton" /> 
      </form>
      <br/>
<div class="fl_left">
    <script src="http://connect.facebook.net/en_US/all.js"></script>
        <script>
         FB.init({ 
            appId:'203642089654188', cookie:true, 
            status:true, xfbml:true 
         });
       </script>
      <fb:login-button>Login with Facebook</fb:login-button>
      <a href="<%=request.getContextPath()%>/forgotpassword/index">Forgot Password??</a>| <a href="<%=request.getContextPath()%>/signup?form"> New User Sign Up</a>
<div class="fl_right"><script src="http://connect.facebook.net/en_US/all.js#xfbml=1"></script>
    </div>
            
      <!--      <input type="button" value="Sign Up" class="btn"  onClick="location.href='/ugbeta\src\main\webapp\WEB-INF\views\signup\index.jspx'" onmouseover="this.className='btn btnhov'" onmouseout="this.className='btn'"/> --> 	  
        
        
        </div>
  </div>
	<!--	<script src="http://connect.facebook.net/en_US/all.js"></script>
        <script>
         FB.init({ 
            appId:'203642089654188', cookie:true, 
            status:true, xfbml:true 
         });
       </script>
      <fb:login-button>Login with Facebook</fb:login-button></div>
	  <div class="fl_right"><script src="http://connect.facebook.net/en_US/all.js#xfbml=1"></script><fb:like href="www.SUDESH.com" show_faces="true" width="200" action="recommend" font=""></fb:like>--></div>
	<br class="clear" />
  </div>
</div>
<!-- 
####################################################################################################### -->
<div id="topbar">
  <div class="wrapper">
    <div id="topnav">
      <ul>
        <li class="active"><a href="index.html">Home</a></li>
        <li><a href="style-demo.html">STUDENT</a></li>
        <li><a href="full-width.html">CORPORATES</a></li>
		<li><a href="full-width.html">P2P</a></li>
		<li><a href="full-width.html">MENTORSHIP</a></li>
		<li><a href="full-width.html">CONTACT US</a></li>
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
<div class="wrapper col2">
  <div id="featured_slide">
    <div id="featured_content">
      <ul>
        <li><img src="images/demo/Student Advantages.jpg" alt="" height="259" />
          <div class="floater">
            <h2>Advantages to a Student User</h2>
            <p>Grants for immediate college needs &hellip;</p>
            <p>Student loans at fixed and lowest rates possible &hellip;</p>
            <p>Career opportunities in college and with graduation &hellip;</p>
            <p>Platform to develop relationship with industry personnel in the field of interest &hellip;</p>
          </div>
        </li>
        <li><img src="images/demo/Corporate Advantages.jpg" alt="" />
          <div class="floater">
            <h2>Corporate Partner Benefits</h2>
            <p>Benefits for the HR, University Relations, Sales & Marketing departments &hellip;</p>
            <p>Negligible cost associated with hiring Graduates/Interns/Co-Ops &hellip;</p>
            <p>Free advertisement on UnivG portal and through word of mouth in different campuses &hellip;</p>
            <p>Giving Back to Society &hellip;</p>
           
          </div>
        </li>
        <li><img src="images/demo/UnivG-Solution.jpg" alt="" />
          <div class="floater">
            <h2>UnivGiggle Solution</h2>
            <p>Unique patented process flow &hellip;</p>
            <p>Optimization of corporate spending and university needs &hellip;</p>
            <p>Platform for students to meet their university needs and for corporations to access raw talent &hellip;</p>
            <p>Feel good factor and overall investment in the community and society</p>
            
          </div>
        </li>
      </ul>
    </div>
    <a href="javascript:void(0);" id="featured-item-prev"><img src="images/prev.png" alt="" width="49" height="27" /></a> <a href="javascript:void(0);" id="featured-item-next"><img src="images/next.png" alt="" width="53" height="31" /></a> </div>
</div>
<!-- ####################################################################################################### -->
<div id="homecontent">
  <div class="wrapper">
    <ul>
      <li>
        <h2 class="title"><img src="images/Corporate.jpg" alt="" />Our Corporate Partners</h2>
     <!--    <p>Students of verious University such as Standford University, UC, SJSU brings to build the network between Corporates and Students.</p> -->
     <p><img src="images/Corporate-box-home-page.jpg" alt="" /></p>
        <p class="readmore"><a href="#">Continue Reading &raquo;</a></p>
      </li>
      <li>
        <h2 class="title"><img src="images/Student.jpg" alt="" />Students</h2>
       <!--  <p>Students of verious University such as Standford University, UC, SJSU brings to build the network between Corporates and Students.</p> -->
        <p><img src="images/Student-box-home-page.jpg" alt="" /></p>
        <p class="readmore"><a href="#">Continue Reading &raquo;</a></p>
      </li>
      <li class="last">
        <h2 class="title"><img src="images/P2P.jpg" alt="" />P2P Lenders</h2>
        <p>Students of verious University such as Standford University, UC, SJSU brings to build the network between Corporates and Students.</p>
        <p>Through P2P lending people from belonging to different aspects of the society with different backgrounds, group together to work as peers and help invest in the future of society through education</p>
        <p class="readmore"><a href="#">Continue Reading &raquo;</a></p>
      </li>
    </ul>
    <br class="clear" />
  </div>
</div>
<!-- ####################################################################################################### -->
<div id="container">
  <div class="wrapper">
    <div id="content">
      <h2>About UnivGiggle</h2>
      <p></a>Univgiggle is a portal for student to meet day to day,immediate financical needs related to education.An example of such a need can be travel expenses for attending a conference or for that matter fees for credit hours in a perticular semesters.</p>
      <p>It is important that we invest in our socity's future by catering to needs of student community in a efficient way so that they can grow and are prepared to make positive contribution to the socity once they graduate.Further,in the current situation of global economic crises,this is an attempt to optimize a portion of corporate advertising to meet twofold requirement.</p>
      <p>UnivGiggle is a virgin idea to meet these requirements in an efficient way.In economic terms,the borrowers would be the current students and the lenders can be fellow students,
        alumini's,and other individual contributor or for that matter the corporate world.In caseof the fellow students and other individual contributors it works as a &quot;University
        Microfinance System hunt for new talents with the economic requirements of the budding university talents.</p>
      <p>UnivGiggle would provide a platform to enable these transactions.</p>
      <p>Finally,UnivGiggle rises high and above this to meet the other requirements of the campus by providing campus related classifieds laid out in University architecture and Mentor
        Program through which students from any cornor of the world would be able to pick a mentor residing in any part of the world who they admire and would to like to learn from 
        them.Ultimately we aim to become the one stop portal for the students answering all their needs with no-nonsense applications.</p>
    </div>
    <div id="column">
      <div class="holder">
        <h2>Press Release and News </h2>
        <ul id="latestnews">
          <li>
            <p><strong><a href="#">Press Releases !!</a></strong></p>
            <p>UniveGiggle Released online, Video released in techcrunch.</p>
          </li>
          <li>
            <p><strong><a href="#">News !!</a></strong></p>
            <p>UniveGiggle Released online, Video released in techcrunch.</p>
          </li>
          <li>
            <p><strong>
            <fb:like href="www.SUDESH.com" show_faces="true" width="200" action="recommend" font=""></fb:like></p>
          </li>
        </ul>
      </div>
    </div>
    <br class="clear" />
  </div>
</div>
<!-- ####################################################################################################### -->
<div id="footer">
  <div class="wrapper">
    <div id="newsletter">
      <h2>About US.</h2>
      <ul>
        <li><a href="#">UnivGiggle Blog</a></li>
        <li><a href="#">UnivGiggle Press</a></li>
      </ul>
    </div>
    <div class="footbox">
      <h2>Follow US !!</h2>
      <ul><li>
        <p><a href="http://www.facebook.com/sudesh.gadewar" target="_TOP" title="Sudesh Gadewar"><img src="images/demo/facebook_findus.gif"/></a><!-- Facebook Badge END --></a></p>
      </li>
        <li></li>
        <li>
          <a href="http://twitter.com/sudeshgadewar"><img src="images/demo/FollowUsOnFacebook_Button.jpg"/></a><br /><a href="http://www.twitterbuttons.com"></a>
        </li>
      </ul>
    </div>
    <div class="footbox">
      <h2>Legal</h2>
      <ul>
        <li><a href="#">Privacy Policy</a></li>
        <li><a href="#">Terms of Services</a></li>
        <li><a href="#">Security and Reliablity</a></li>
      </ul>
    </div>
    <div class="footbox">
      <h2>UnivGiggle</h2>
      <ul>
        <li><a href="#">About UnivGiggle</a></li>
        <li><a href="#">Business Solutions</a></li>
        <li class="last"><a href="#">User Solutions</a></li>
      </ul>
    </div>
    <br class="clear" />
  </div>
</div>
<!-- ####################################################################################################### -->
<div id="copyright">
  <div class="wrapper">
    <p class="fl_left">Copyright &copy; 2011 - All Rights Reserved</p>
    <p class="fl_right">www.univgiggle.com<a href="http://www.os-templates.com/" title="Open Source Templates"></a></p>
    <br class="clear" />
  </div>
</div>
</body>
</html>
