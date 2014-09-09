<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html><head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Users list</title>
   	<link rel="stylesheet" media="screen" href="css/main.css">
    <link rel="shortcut icon" type="image/png" href="images/favicon.png">
    <script src="js/jquery-1.7.1.min.js" type="text/javascript" charset=""></script>
    <script src="js/jquery.validate.min.js" type="text/javascript" charset=""></script>
    <script src="js/artistmagnet.js" type="text/javascript" charset=""></script>
</head>
<body>
<div id="page-frame">
    <div id="page-header">
        <img class="root-buttons" src="images/button-artists.jpg" alt="artists">
        <img class="root-buttons" src="images/button-productions.jpg" alt="productions">
        <img class="root-buttons" src="images/button-venues.jpg" alt="venues">
        <span id="logged-in" style="vertical-align: top; line-height: 33px; font-size: 0.8em;"><c:out value="${user.email}" escapeXml="true" /> | <a href="j_spring_security_logout" style="vertical-align: top;">Logout</a></span>
    </div>

    <div id="page-content" >
        <table class="all_users" cellpadding="0" cellspacing="0" style="border-collapse: collapse;">
            <tbody><tr>
                <td>Name</td>
                <td>Email</td>
                <td>Account Type</td>
                <td>BirthDay/Founded Year</td>
                <td>Facebook ID</td>
                <td>Joined Date</td>
            </tr>
            <c:forEach items="${users}" var="user" varStatus="status">
				<tr style="<c:if test="${status.count % 2 == 0}">background: #DBE0E4;</c:if>">
					<td>${user.accountName}</td>
					<td>${user.email}</td>
					<td>${user.accountType.name}</td>
					<td>${user.birthday}</td>
					<td>${user.facebookId}</td>
					<td>${user.joinedDate}</td>
				</tr>
			</c:forEach>
        </tbody></table>
        <div class="navigator">
        	<c:if test="${page == pages}">
        		 <img class="pageNavigator" src="images/previous.jpg" alt="Previous page">
        	</c:if>
        	<c:if test="${page < pages}">
	        <a href="admin.html?page=${page+1}" title="Previous page">
        	    <img class="pageNavigator" src="images/previous.jpg" alt="Previous page">
    	    </a>
            </c:if>
        	<c:if test="${page == 1}">
        		<img class="pageNavigator" src="images/previousnext.jpg" alt="Next page">
        		
        	</c:if>
        	<c:if test="${page > 1}">
	            <a href="admin.html?page=${page-1}" title="Next page">
	            	<img class="pageNavigator" src="images/previousnext.jpg" alt="Next page">
    	         </a>
            </c:if>
        </div>
    </div>
</div>

<div id="page-frame-baseline"></div>
<div id="navigation-background"></div>
<div id="navigation-ribbon">
   <a href="http://artistmagnet.com/" alt="Artist Magnet home"><img id="logo" src="images/logo.png" alt="Artist Magnet"></a>
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
</body></html>