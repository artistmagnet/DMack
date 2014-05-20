<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html xmlns:fb="http://ogp.me/ns/fb#" 
	xmlns:og="http://ogp.me/ns#">
    <head>
        <title>Add friend</title>
        <meta charset="">
        <link rel="stylesheet" media="screen" href="css/main.css">
        <link rel="shortcut icon" type="image/png" href="images/favicon.png">
        <script src="js/jquery-1.7.1.min.js" type="text/javascript" charset=""></script>

        <link href='http://fonts.googleapis.com/css?family=Cuprum' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Copse' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Dancing+Script' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>

        <link rel="stylesheet" media="screen" href="signup_files/resume.css">
        <link href="signup_files/css_003.css" rel="stylesheet" type="text/css">
        <link href="signup_files/css_002.css" rel="stylesheet" type="text/css">
        <link href="signup_files/css_004.css" rel="stylesheet" type="text/css">
        <link href="signup_files/css.css" rel="stylesheet" type="text/css">
        <meta property="og:title" content="Artist Magnet - the theatre revolution"/>
   	 	<meta property="og:site_name" content="Magnet"/>
    	<meta property="og:description"
          content="Connecting artists through productions and venues everywhere."/>
        <meta property="og:image" content="images/logo.png"/>
    </head>
    <body>
        <div id="page-frame">

            <div id="page-header">
                <img class="root-buttons" src="signup_files/button-artists.jpg" alt="artists"/>
                <img class="root-buttons" src="signup_files/button-productions.jpg" alt="productions"/>
                <img class="root-buttons" src="signup_files/button-venues.jpg" alt="venues"/>
            </div>
            <div id="page-content">
                <div style="width: 191px; height: 500px; float: left; margin-right: 18px; background: #E2E7EB">
                    <center>Vertical Advertising Space</center>
                </div>

                <div style="width: 600px; float: left;">
                    <div class="register-form shadow">
                        <form:form id="inviteForm" commandName="form" class="register-form" action="invite_friend.html" method="POST">
			    				
                            <p id="ptitle15">Send Invitations to Artist Magnet. Enter email addresses manually or copy and paste into the box below. Separate multiple addresses with commas.</p>
                            <p>&nbsp;</p>
                            <p id="ptitle4">Send To</p>
                            <form:textarea path="emailAddresses" name="emailAddresses" cols="72" rows="2" id="emailAddresses"></form:textarea><br />
                            <p id="ptitle4">*Separate multiple addresses with commas</p>
                            <p>&nbsp;</p>
                            <p id="ptitle4">Your Message (Optional)</p>
                            <form:textarea path="message" name="message" cols="72" rows="6" id="inviteMessage"></form:textarea>
                            <br><br>
                            <input style="float: right;" value="Send Invitations" type="submit" id="sendInvite" name="sendInviteBtn">
                            <input name="signup" value="${signup}" style="display: none;" readonly="readonly" />
			   
                            <p>&nbsp;</p>
                            <p id="ptitle15">Invite your Facebook Friends to join Artist Magnet!</p>
                            <div id="fb-root"></div>
							<script>(function(d, s, id) {
							  var js, fjs = d.getElementsByTagName(s)[0];
							  if (d.getElementById(id)) return;
							  js = d.createElement(s); js.id = id;
							  js.src = "//connect.facebook.net/en_US/all.js#xfbml=1";
							  fjs.parentNode.insertBefore(js, fjs);
							}(document, 'script', 'facebook-jssdk'));</script>
                            <fb:send href="http://www.artistmagnet.com" font="tahoma"></fb:send>
                            <div style="height:20px;">&nbsp;</div>
                            <c:if test="${signup}">
								<input style="float: right;" value="Sign Up" type="submit" 
									id="signUp" name="signupBtn" />
							</c:if>
                        </form:form>
                    </div>
                    <div>&nbsp;</div>
                    <div style="width: 612px; height: 100px; margin-right: 18px; background: #E2E7EB;">
                        <center>Horizontal Advertising Space</center>
                    </div>
                </div>
                <div style="clear: both;"></div>
            </div>
        </div>
        <div id="page-frame-baseline"></div>
        <div id="navigation-background"></div>
        <div id="navigation-ribbon">
            <a href="/" alt="Artist Magnet home"><img id="logo" src="signup_files/logo.png" alt="Artist Magnet"/></a>
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
		setTimeout(function () {alert ("${msg}");
			<c:if test="${redirect}">
			window.location.href = "welcome.html";	
			</c:if>
		}, 200);
	</script>
</c:if>	
      <c:if test="${!empty param.msg}">
	<script type="text/javascript">
		setTimeout(function () {alert ("${param.msg}");	
		<c:if test="${param.redirect}">
		window.location.href = "welcome.html";	
		</c:if>
		}, 200);
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
