<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Welcome</title>
    <link rel="stylesheet" media="screen" href="css/main.css">
    <link rel="shortcut icon" type="image/png" href="images/favicon.png">
    <script src="js/jquery-1.7.1.min.js" type="text/javascript" charset=""></script>
</head>
<body>
	<div id="page-frame">
	    <div id="page-header">
	        <img class="root-buttons" src="images/button-artists.jpg" alt="artists">
	        <img class="root-buttons" src="images/button-productions.jpg" alt="productions">
	        <img class="root-buttons" src="images/button-venues.jpg" alt="venues">
	     <span id="logged-in" style="vertical-align: top; line-height: 33px; font-size: 0.8em;"><c:out value="${user.email}" escapeXml="true" /> | <a href="j_spring_security_logout" style="vertical-align: top;">Logout</a></span>
	    </div>
	    <div id="page-content">
	        <div class="welcome_text">
	            Welcome, <c:out value="${user.firstName}" escapeXml="true" /> 
	        </div>
	        <div id="left-content">
	        </div>
	        <div id="center-content">
	                <h1><c:choose>
						<c:when test="${user.accountType.id == 4}">
							FanSpace
						</c:when>
						<c:when test="${user.accountType.id == 3}">
							Front Desk
						</c:when>
						<c:when test="${user.accountType.id == 5}">
							Main Lobby
						</c:when>
						<c:otherwise>Artist Space</c:otherwise>
					</c:choose></h1>
	            <div class="menu">
	            	<!-- only appear the first time the user signs-in and every time they log-in until they complete their first resume -->
		            <c:if test="${(user.accountType.id == 1 || user.accountType.id == 2) && empty resumes}">
		                    <div class="info_board">Welcome to ArtistSpace! Now <a href="resume/new.html">Build Your First
		                        Resume</a> to enter your profile information and connect with your artists, productions and
		                        venues!
		                    </div>
					</c:if>
					<c:if test="${user.accountType.id == 1 || user.accountType.id == 2}">
						<h4>Resumes</h4>
                    	<div style="padding-bottom: 2px;"><a href="resume/new.html">Build New Resume</a></div>
                    	<div style="padding-bottom: 2px;"><a href="revenue.html">Manage Resumes</a></div>
					</c:if>
		           	<h4><a href="artist_palce.htm">Artist Place</a></h4>
	               	<h4><a href="artist_search.htm">Artist Search</a></h4>
	               	<h4><a href="artist_settings.htm">Account Settings</a></h4>
	              	<c:choose>
						<c:when test="${user.accountType.id == 1 || user.accountType.id == 2 || user.accountType.id == 4}">
		                    <h4><a href="invite_friend.html">Invite Friends</a></h4>
						</c:when>
						<c:when test="${user.accountType.id == 3 || user.accountType.id == 5}">
                    		<h4><a href="invite_friend.html">Send Invitations</a></h4>
						</c:when>
					</c:choose>
	            </div>
	        </div>
	    </div>
	</div>
	<div id="page-frame-baseline"></div>
	<div id="navigation-background"></div>
	<div id="navigation-ribbon">
	    <a href="http://artistmagnet.com/"><img id="logo" src="images/logo.png" alt="Artist Magnet home"></a>
	</div>
	<div class="footer">
		<p id="ptitle10"><a href="aboutus.htm" id="ptitle10">About Us</a> 
		| <a href="terms.htm" id="ptitle10">Terms and Conditions</a> 
		| <a href="privancy.htm" id="ptitle10">Privacy</a> 
		| <a href="help.htm" id="ptitle10">Help</a> 
		| <a href="donate.htm" id="ptitle10">Donate</a></p>
		<p id="ptitle10">Copyright &#169; Artist Magnet, LLC.</p>
	</div>
	<script type="text/javascript">
  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-5042633-9']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();
</script>
<!-- Quantcast Tag --> 
<script type="text/javascript">
  var _qevents = _qevents || [];

  (function() {
   var elem = document.createElement('script');

   elem.src = (document.location.protocol == "https:" ? "https://secure" : "http://edge") + ".quantserve.com/quant.js";
   elem.async = true;
   elem.type = "text/javascript";
   var scpt = document.getElementsByTagName('script')[0];
   scpt.parentNode.insertBefore(elem, scpt);  
  })();
</script>
<script type="text/javascript"> 
_qevents.push({ qacct:"p-55nqYccj3gd9I" }); 
</script> 
<noscript> 
<div style="display:none;"> 
<img src="//pixel.quantserve.com/pixel/p-55nqYccj3gd9I.gif" border="0" height="1" width="1" alt="Quantcast"/>
</div> 
</noscript> 
<!-- End Quantcast tag -->
</body>
</html>