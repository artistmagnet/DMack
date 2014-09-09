<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>	
    <title>Forgot Password</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">   
    <link rel="stylesheet" media="screen" href="css/smoothness/jquery-ui-1.8.18.custom.css">
    <link rel="stylesheet" media="screen" href="css/main.css">
    <link rel="shortcut icon" type="image/png" href="images/favicon.png">
    <script src="js/jquery-1.7.1.min.js" type="text/javascript" charset=""></script>
     <script src="js/jquery-ui-1.8.18.custom.min.js" type="text/javascript" ></script>
</head>
<body>
	<div id="page-frame">
	    <div id="page-header">
	        <img class="root-buttons" src="images/button-artists.jpg" alt="artists">
	        <img class="root-buttons" src="images/button-productions.jpg" alt="productions">
	        <img class="root-buttons" src="images/button-venues.jpg" alt="venues">
	    </div>
	    <div id="page-content">
	       <div class="forgotpass">
	 		Forgot Your Password?<br><br>
	 		Enter your email address and click 'Reset Password'.
	 		<br> You will get an email with a link to reset your password.
	 		<br><br>
	 		<form action="forgotpass.html" method="post">
	 			<label>Email Address:</label><input type="text" name="email" style="width:420px;" maxlength="255">
	 			<br>
	 			<div class="box">
					<button class="big" type="button" onclick="window.location.href = 'index.html';">Back</button>
					<button class="big" type="submit" style="float:right;">Reset Password</button>			
				</div>
       	 	</form>
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
<c:if test="${!empty msg}">
	<script type="text/javascript">
		setTimeout(function () {alert ("${msg}"); window.location.href = '${target}';}, 200);		
	</script>
</c:if>
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