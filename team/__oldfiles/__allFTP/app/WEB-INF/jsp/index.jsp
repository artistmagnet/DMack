<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html xmlns:fb="http://ogp.me/ns/fb#"	xmlns:og="http://ogp.me/ns#">
<head>
    <title></title>
    <meta http-equiv="Content-type" content="text/html; charset=utf-8">
    <link rel="stylesheet" media="screen" href="css/main.css">
    <link rel="shortcut icon" type="image/png" href="images/favicon.png">
    <script src="js/jquery-1.7.1.min.js" type="text/javascript" charset=""></script>
    <meta property="og:title" content="Artist Magnet - the theatre revolution"/>
    <meta property="og:site_name" content="Magnet"/>
    <meta property="og:description"
          content="Connecting artists through productions and venues everywhere."/>
    <meta property="og:image" content="images/logo.pngg"/>
</head>
<body>
<div id="page-frame">
    <div id="page-header">
        <img class="root-buttons" src="images/button-artists.jpg" alt="artists"/>
        <img class="root-buttons" src="images/button-productions.jpg" alt="productions"/>
        <img class="root-buttons" src="images/button-venues.jpg" alt="venues"/>
    </div>
    <div id="page-content">
        <script type="text/javascript" charset="utf-8">
            $(function() {
                $("form input").keypress(function (e) {
                    if ((e.which && e.which == 13) || (e.keyCode && e.keyCode == 13)) {
                        $('input[type=submit].default').click();
                        return false;
                    } else {
                        return true;
                    }
                });
            });
        </script>
        <div style="width: 191px; float: left; margin-right: 18px;">
            <form action="j_spring_security_check" method="POST" accept-charset="utf-8"
                  enctype="application/x-www-form-urlencoded"
                  id="signin" class="small">
                <p>
                    <label for="email">email</label>
                    <input type="text" name="j_username" value=""/>
                    <span class="error"></span>
                </p>
                <p>
                    <label for="password">password</label>
                    <input type="password" name="j_password"/>

                    <span class="error"></span>
                </p>
                <table>
                    <tr>
                        <td style="text-align: left;">
                            <input type="button" class="signup_button" onclick="location.href='signup.html';"
                                   id="signup_button" value="sign up"/>
                        </td>
                        <td style="text-align: right;"><input type="submit" name="signin"  class="default"
                                                              value="sign in"/></td>
                    </tr>
                </table>
		        <p style="text-align: left;">
                	<a href="<%="http://www.facebook.com/dialog/oauth?client_id=102540469215&redirect_uri=" + URLEncoder.encode("http://artistmagnet.com/app/fb_signin.html") + "&scope=email"%>" 
                		alt="Facebook sigin"><img src="images/sign-in-with-facebook.png"/></a>
            	</p>
            	<p style="text-align: left;">
                	<a href="forgotpass.html">Forgot Your password?</a>
            	</p>
            </form>			
        </div>
        <div style="width: 600px; float: left;">
            <img src="images/banner-pub-company.jpg" alt="Pub Theater Company" height="150" width="600"/>

            <img src="images/banner-artist-place.jpg" alt="Artist Place - The market place for all things theater"
                 height="150" width="600"/>

            <img src="images/banner-sound-eqipment.jpg" alt="SLD Lighting - Sound equipment" height="150" width="600"/>
        </div>

        <div style="clear: both;"></div>
    </div>
</div>
<div id="page-frame-baseline"></div>
<div id="navigation-background"></div>
<div id="navigation-ribbon">
    <a href="/" ><img id="logo" src="images/logo.png" alt="Homepage"/></a>
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
