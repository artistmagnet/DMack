<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
	<title>Resume view</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link rel="stylesheet" media="screen" href="../css/main.css" />
	<link rel="shortcut icon" type="image/png" href="../images/favicon.png" />
	<script src="../js/jquery-1.7.1.min.js" type="text/javascript"></script>
	<script src="../js/jquery-ui-1.8.18.custom.min.js" type="text/javascript"></script>
	<script src="../js/resume.js" type="text/javascript"></script>
	<script type="text/javascript">$(document).ready(drawResumeView);</script>
</head>
<body>
	<div id="data" class="hide">${resume.data.sectionsData}</div>
	<div id="page-frame">
		<div id="page-header">
			<img class="root-buttons" src="../images/button-artists.jpg"
				alt="artists"> <img class="root-buttons"
					src="../images/button-productions.jpg" alt="productions"> <img
				class="root-buttons" src="../images/button-venues.jpg" alt="venues">
			<span id="logged-in"
				style="vertical-align: top; line-height: 33px; font-size: 0.8em;"><c:out
					value="${user.email}" escapeXml="true" /> | <a
				href="../j_spring_security_logout" style="vertical-align: top;">Logout</a></span>
		</div>
		<div id="page-content">
			<div class="resume-view shadow">
				<form class="resume-view" action="view.html" method="post" >
					<p class="rname1">
						<c:choose>
							<c:when test="${empty resume.data.stageName}">
								<c:out value="${resume.data.title}"></c:out>
								<c:out value="${resume.data.firstName}"></c:out>
								<c:out value="${resume.data.middleName}"></c:out>
								<c:out value="${resume.data.lastName}"></c:out>
								<c:out value="${resume.data.suffix}"></c:out>
							</c:when>
							<c:otherwise><c:out value="${resume.data.stageName}"></c:out></c:otherwise>
						</c:choose>
					</p>
					<p class="rname2">
					<b><c:choose>
						<c:when test="${resume.data.type == 8}"><c:out value="${resume.data.otherType}"></c:out></c:when>
						<c:otherwise>${resumeTypes[resume.data.type]}</c:otherwise>
					</c:choose></b>
					</p>
					<p class="rname1"><c:out value="${resume.data.union}"></c:out></p>
					<table>
						<tr>
							<td style="width: 250px" <c:if test="${resume.data.type != 0}">class='hide'</c:if>>
								<c:if test="${resume.data.type == 0}">
									<p class="resume">Age Range: <c:out value="${resume.data.age}" /> - <c:out value="${resume.data.age2}" /></p>
									<p class="resume">Height: <c:out value="${resume.data.height}" />'<c:out value="${resume.data.height2}" />''</p>
									<p class="resume">Weight lbs: <c:out value="${resume.data.weightlbs}" /></p>
									<p class="resume">Hair Color: <c:out value="${resume.data.haircolor}" /></p>
									<p class="resume">Hair Length: <c:out value="${resume.data.hairlength}" /></p>
									<p class="resume">Eye Color: <c:out value="${resume.data.eyecolor}" /></p>
									<p class="resume">Ethnicity: <c:out value="${resume.data.ethnicity}" /></p>
									<p class="resume">Vocal Range: <c:out value="${resume.data.vocalrange}" /></p>
								</c:if>
							</td>
							<td>
								<p class="resume">Email address: <a href="mailto:<c:out value="${resume.data.emailid}" />" class="resume"><c:out value="${resume.data.emailid}" /></a></p>
								<p class="resume">Website: <a href="<c:out value="${resume.data.website}" />" class="resume"><c:out value="${resume.data.website}" /></a></p>
								<p class="resume">Primary Phone Number: <c:out value="${resume.data.phone}" /></p>
								<p class="resume">Alternate Phone Number: <c:out value="${resume.data.alternatephone}" /></p>
								<p class="resume">Street Address: <c:out value="${resume.data.address1}" /></p>
								<p class="resume">Street Address 2: <c:out value="${resume.data.address2}" /></p>
								<p class="resume">City: <c:out value="${resume.data.city}" /></p>
								<p class="resume">State/Province: <c:out value="${resume.data.state}" /></p>
								<p class="resume">Zip Code: <c:out value="${resume.data.zipcode}" /></p>
								<p class="resume">Country: <c:out value="${resume.data.country}" /></p>
							</td>
							<td style="width: 150px">
								<c:choose>
									<c:when test="${photosNo == 0}">No photo</c:when>
									<c:otherwise>
										<img width="100px" src="photo.html" alt="Photo" />
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
					</table>
					<div id='inject'></div>
					<div style="height: 20px;">&nbsp;</div>
					<div class="box">
						<button type="submit" name="back1">Back to Step 1</button>
						<button type="submit" name="back2">Back to Step 2</button>
						<button type="submit" name="welcome">Artist Space</button>
						<button type="submit" name="viewer" style="float: right;">Manage Resume</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<div id="page-frame-baseline"></div>
	<div id="navigation-background"></div>
	<div id="navigation-ribbon">
		<a href="http://artistmagnet.com/"><img id="logo"
			src="../images/logo.png" alt="Artist Magnet home"></a>
	</div>
	<div class="footer">
		<p id="ptitle10"><a href="../aboutus.htm" id="ptitle10">About Us</a> 
		| <a href="../terms.htm" id="ptitle10">Terms and Conditions</a> 
		| <a href="../privancy.htm" id="ptitle10">Privacy</a> 
		| <a href="../help.htm" id="ptitle10">Help</a> 
		| <a href="../donate.htm" id="ptitle10">Donate</a></p>
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
