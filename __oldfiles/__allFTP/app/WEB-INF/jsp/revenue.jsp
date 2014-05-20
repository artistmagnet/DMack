<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Revenue view</title>
	<link rel="stylesheet" media="screen" href="css/smoothness/jquery-ui-1.8.18.custom.css">
	<link rel="stylesheet" media="screen" href="css/main.css">
	<link rel="shortcut icon" type="image/png" href="images/favicon.png">
    <script src="js/jquery-1.7.1.min.js" type="text/javascript" charset=""></script>
	<script src="js/jquery-ui-1.8.18.custom.min.js" type="text/javascript"></script>
	<script type="text/javascript">
	$(document).ready(function () {
		$('button#print').click(function () {
			var val = $(this).val();
			$('#printDialog').dialog({
				modal: true,
				buttons: {
					Cancel: function() {
						$(this).dialog("close");
					},
					Continue: function() {
						$(this).dialog("close");
						window.location.href='resume/print.html?id='+val;
					}
				}
			});
		});
		$('button#send').click(function () {
			var val = $(this).val();
			//Set id from row
			$('#sendResum input').val(val);
			$('#sendDialog').dialog({
				modal: true,
				height:350,
				width:400,
				buttons: {
					Cancel: function() {
						$(this).dialog("close");
					},
					Send: function() {
						var emails = $("#emailAddresses").val();
						var note = $("#emailNote").val();
						if ($.trim(emails) == "") {
							alert ("Please enter at least one email address to send an invitation.");
						} else if (validEmails(emails, note)) {
							$(this).dialog("close");
							$('#sendResum').submit();
						} else {
							alert ("Please enter email addresses in a valid format.");
						}
						/* window.location.href='resume/send.html?id='+val
							+"&emails="+encodeURIComponent(emails).val()); */
					}
				}
			});
		});
		$('button#save').click(function () {
			window.location.href='resume/save.html?id='+$(this).val();
		});
		$('button#edit').click(function () {
			window.location.href='resume/edit.html?id='+$(this).val();
		});
		$('input.field').change(function () {
			$.ajax({url: "resume/resumeName.html?id="+$(this).attr('name')
					+"&name="+ encodeURIComponent($(this).val()), type: "POST"
			}); 
		});
		$('button#goWelcome').click(function () {
			window.location.href='welcome.html';
		});
	});
	
	function validEmails(emails, note) {
		var elems = emails.split(',');
		if (elems) {
			for ( var i = 0; i < elems.length; i++) {
				elems[i] = $.trim(elems[i]);
				if (!/^[\w\.]+@[\w\.]+\.[a-z]{2,3}$/.test(elems[i])) return false;
			}
		}
		return true;	
	}
	
	</script>
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
	        <div id="left-content"></div>
	        <div id="center-content">
	            <h1>Manage Resumes</h1>
	            <div class="revenue-view">
		            <table>
			            <tr><th>Type</th>
			            	<th>Link</th>
			            	<th style="width:300px;">Name</th>
			            </tr>
			      	   <c:forEach items="${resumes}" var="resume" varStatus="stat">
				           <tr><td>
								<c:choose>
									<c:when test="${resume.type == 8}">${resume.otherType}</c:when>
									<c:otherwise>${resumeTypes[resume.type]}</c:otherwise>
								</c:choose>
				           		</td>
				            	<td><a href="resume/view.html?id=${resume.id}">View resume</a></td>
				            	<td><input type="text" name="${resume.id}" 
				            		class="field" maxlength="50" style="width:300px;"
				            		value="<c:out value="${resume.name}" />"></td>
				            </tr>
				            <tr><td colspan="3">
			            		<button id="print" value="${resume.id}" type="button">Print Resume</button>
								<button id="save" value="${resume.id}" type="button">Save Resume</button>
								<button id="send" value="${resume.id}" type="button">Send Resume</button>
								<button id="edit" value="${resume.id}" type="button">Edit Resume</button>
			            	</td></tr>
			           </c:forEach>
		            </table>
		            <div style="height: 20px;">&nbsp;</div>
					<div class="box">
						<button type="button" id="goWelcome" style="width:142px">Go to Artist Space</button>
					</div>
		            <div id="printDialog" title="Print resume" class="ui-helper-hidden" style="font-size: 70%;">
						 <p>Note: Your resume will only print 1 page (8x10 for Actors and 8.5x11 for all others) 
						 so some of your rows and columns may not appear. To print your Actor resume in the 
						 8x10 format, on your printer options please select 
						 "Choose paper source by PDF page size.</p>	  
					</div>
					<div id="sendDialog" title="Send resume" class="ui-helper-hidden" style="font-size: 70%;">
						<form id="sendResum" method="post" action="resume/send.html">
							<input type="text" name="id" value="" class="hide" />
							<p>Send To:</p>
							<textarea id="emailAddresses" name="emails" cols="50" rows="3" style="border: 1px solid #D4D4D4; font-size: 14px; padding: 2px; resize: none;"></textarea>
							<p>*Separate multiple addresses with commas</p>
							<br/>
							<p>Your Message (Optional):</p>
							<textarea id="emailNote" name="note" cols="50" rows="3" style="border: 1px solid #D4D4D4; font-size: 14px; padding: 2px; resize: none;"></textarea>
						</form>
					</div>
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
<c:if test="${!empty param.msg}">
<script type="text/javascript">
	setTimeout(function () {alert ("${param.msg}");window.location.href='revenue.html';}, 200);	
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