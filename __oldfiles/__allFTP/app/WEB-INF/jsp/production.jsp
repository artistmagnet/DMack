<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Production</title>
<link rel="stylesheet" media="screen"
	href="css/smoothness/jquery-ui-1.8.18.custom.css">
<link rel="stylesheet" media="screen" href="css/main.css">
<link rel="shortcut icon" type="image/png" href="images/favicon.png">
<script src="js/jquery-1.7.1.min.js" type="text/javascript" charset=""></script>
<script src="js/jquery-ui-1.8.18.custom.min.js" type="text/javascript"></script>
</head>
<body>
	<div id="page-frame">
		<div id="page-header">
			<img class="root-buttons" src="images/button-artists.jpg"
				alt="artists"> <img class="root-buttons"
				src="images/button-productions.jpg" alt="productions"> <img
				class="root-buttons" src="images/button-venues.jpg" alt="venues">
			<span id="logged-in"
				style="vertical-align: top; line-height: 33px; font-size: 0.8em;"><c:out
					value="${user.email}" escapeXml="true" /> | <a
				href="j_spring_security_logout" style="vertical-align: top;">Logout</a></span>
		</div>
		<div id="page-content">
			<div class="venue">
				<form action="production.html" method="post">
					<div style="float: rigth"></div>
					<table>
						<tr>
							<td><span class="title">Production Name</span></td>
							<td>Photo</td>
						</tr>
						<tr>
							<td><input type="text" name="venue_name" style="width:350px" maxlength="100"></td>
							<td><input type="file" name="photo"></td>
						</tr>
						<tr>
							<td><span>URL:</span> <a href="#">External Production URL</a></td>
							<td rowspan="7" style="text-align: center;"><img src="img/big.jpg" alt="Big pic"/></td>
						</tr>
						<tr>
							<td><span>Venue:</span> <span class="blue">Venue Name</span>
						</tr>
						<tr>
							<td><span>Address:</span> <a href="#">View Map</a></td>
						</tr>
						<tr>
							<td><span>Phone:</span></td>
						</tr>
						<tr>
							<td><span>Description:</span></td>
						</tr>
					</table>

					<table>				
						<tr>
							<td>
								<a href="#" >Get Tickets</a>
							</td>
							<td style="text-align: right;">
								<a href="#">Calendar of Shows</a>
							</td>
						</tr>
					</table>

					<table>
						<tr>
							<td colspan="2" style="width: 50%; text-align: center;">
								<span class="blue" style="font-weight: bold;">CAST</span>
							</td>
							<td colspan="2" style="width: 50%; text-align: center;">
								<span class="blue" style="font-weight: bold;">PRODUCTION/MANAGEMENT</span>
							</td>
						</tr>
						<tr>
							<td style="width: 25%;">
								<span>Mother Earth</span>
							</td>
							<td style="width: 25%;">
								<a href="#" >Tiffany Love</a>
							</td>
							<td style="width: 25%;">
								<span>Director</span>
							</td>
							<td style="width: 25%;">
								<a href="#">Tatiana Wright</a>
							</td>
						</tr>
						<tr>
							<td style="width: 25%;">
								<span>Jonathan</span>
							</td>
							<td style="width: 25%;">
								<a href="#" >Remi Connely</a>
							</td>
							<td style="width: 25%;">
								<span>Producer</span>
							</td>
							<td style="width: 25%;">
								<a href="#">Andre Palmer</a>
							</td>
						</tr>
						<tr>
							<td style="width: 25%;">
							</td>
							<td style="width: 25%;">
							</td>
							<td style="width: 25%;">
								<span>Stage Manager</span>
							</td>
							<td style="width: 25%;">
								<a href="#">Alexis Richardson</a>
							</td>
						</tr>
					</table>
					<div style="height: 20px;">&nbsp;</div>
					<div class="box">
						<button type="button" onclick="window.history.go(-1);">Back</button>
						<button type="button" onclick="window.location.href='welcome.html';">Go to Artist Space</button>
						<button type="button">Edit Production</button>
						<button type="button" class="big">Production/Management</button>
					</div>
				</form>
			</div>

		</div>
	</div>
	<div id="page-frame-baseline"></div>
	<div id="navigation-background"></div>
	<div id="navigation-ribbon">
		<a href="http://artistmagnet.com/"><img id="logo"
			src="images/logo.png" alt="Artist Magnet home"></a>
	</div>
	<div class="footer">
		<p id="ptitle10">
			<a href="aboutus.htm" id="ptitle10">About Us</a> | <a
				href="terms.htm" id="ptitle10">Terms and Conditions</a> | <a
				href="privancy.htm" id="ptitle10">Privacy</a> | <a href="help.htm"
				id="ptitle10">Help</a> | <a href="donate.htm" id="ptitle10">Donate</a>
		</p>
		<p id="ptitle10">Copyright &#169; Artist Magnet, LLC.</p>
	</div>
	<c:if test="${!empty param.msg}">
		<script type="text/javascript">
			setTimeout(function() {
				alert("${param.msg}");
				window.location.href = 'revenue.html';
			}, 200);
		</script>
	</c:if>
	<script type="text/javascript">
		var _gaq = _gaq || [];
		_gaq.push([ '_setAccount', 'UA-5042633-9' ]);
		_gaq.push([ '_trackPageview' ]);

		(function() {
			var ga = document.createElement('script');
			ga.type = 'text/javascript';
			ga.async = true;
			ga.src = ('https:' == document.location.protocol ? 'https://ssl'
					: 'http://www')
					+ '.google-analytics.com/ga.js';
			var s = document.getElementsByTagName('script')[0];
			s.parentNode.insertBefore(ga, s);
		})();
	</script>
	<!-- Quantcast Tag -->
	<script type="text/javascript">
		var _qevents = _qevents || [];

		(function() {
			var elem = document.createElement('script');

			elem.src = (document.location.protocol == "https:" ? "https://secure"
					: "http://edge")
					+ ".quantserve.com/quant.js";
			elem.async = true;
			elem.type = "text/javascript";
			var scpt = document.getElementsByTagName('script')[0];
			scpt.parentNode.insertBefore(elem, scpt);
		})();
	</script>
	<script type="text/javascript">
		_qevents.push({
			qacct : "p-55nqYccj3gd9I"
		});
	</script>
	<noscript>
		<div style="display: none;">
			<img src="//pixel.quantserve.com/pixel/p-55nqYccj3gd9I.gif"
				border="0" height="1" width="1" alt="Quantcast" />
		</div>
	</noscript>
	<!-- End Quantcast tag -->
</body>
</html>