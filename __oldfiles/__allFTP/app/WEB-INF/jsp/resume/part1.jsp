<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" buffer="128kb" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Edit Your Profile</title>
<link rel="stylesheet" media="screen" href="../css/main.css">
<link rel="shortcut icon" type="image/png" href="../images/favicon.png">
<script src="../js/jquery-1.7.1.min.js" type="text/javascript"></script>
<script src="../js/jquery-ui-1.8.18.custom.min.js"
	type="text/javascript"></script>
<script type="text/javascript">
	function makeChoice() {
		var val = $("input[name='data.type']:radio:checked").val();
		var otherType = $("input[name='data.otherType']");
		var table2 = $('#table2');
		if (val == '8') {
			otherType.removeAttr("disabled");
			otherType.focus();
		} else {
			otherType.attr("disabled", "disabled");
		}
		if (val == '0') {
			table2.removeClass('hide');
		} else {
			table2.addClass('hide');
		}
	}
	$(document).ready(function() {
		$("#table2 td:nth-child(even)").css("textAlign", "left");
		$("#table2 td:nth-child(odd)").css("textAlign", "right");
		$("#table3 td:nth-child(even)").css("textAlign", "left");
		$("#table3 td:nth-child(odd)").css("textAlign", "right");
		makeChoice();
		$('form.resume').submit (function (event) {
			var val = $("input[name='data.type']:radio:checked").val();
			var otherType = $("input[name='data.otherType']");
			var stageName = $("input[name='data.stageName']");
			var firstName = $("input[name='data.firstName']");
			var lastName = $("input[name='data.lastName']");
			if (val == '8' && otherType.val() == '') {
				alert ('Please enter other resume type name.');
				otherType.focus();
				return false;
			}
			if (stageName.val() == '' && (firstName.val() == '' || lastName.val() == '')) {
				alert ('Please enter stage name or first name and last name.');
				stageName.focus();
				return false;
			}
		});
	});
</script>
</head>
<body>
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
			<div class="resume shadow">
				<form:form method="post" commandName="resume" name="form1"
					action="part1.html" class="resume" enctype="multipart/form-data">
					<div class="box-header">Select Your Resume Type</div>
					<table id="table1">
						<tbody>
							<tr>
								<td style="text-align: left;"><form:radiobutton path="data.type"
										id="type1" value="0" onclick="makeChoice('table2')" /> <label
									for="type1"> Actor</label><br> <form:radiobutton
										path="data.type" id="type2" value="1"
										onclick="makeChoice('table2')" /> <label for="type2">
										Director</label><br> <form:radiobutton path="data.type" id="type3"
										value="2" onclick="makeChoice('table2')" /> <label
									for="type3"> Designer</label><br> <form:radiobutton
										path="data.type" id="type4" value="3"
										onclick="makeChoice('table2')" /> <label for="type4">
										Dramaturg</label><br> <form:radiobutton path="data.type" id="type5"
										value="4" onclick="makeChoice('table2')" /> <label
									for="type5"> Playwright</label><br> <form:radiobutton
										path="data.type" id="type6" value="5"
										onclick="makeChoice('table2')" /> <label for="type6">
										Producer</label><br> <form:radiobutton path="data.type" id="type7"
										value="6" onclick="makeChoice('table2')" /> <label
									for="type7"> Production Manager</label><br> <form:radiobutton
										path="data.type" id="type8" value="7"
										onclick="makeChoice('table2')" /> <label for="type8">
										Stage Manager</label><br> <form:radiobutton path="data.type"
										id="type9" value="8" onclick="makeChoice('table2')" /> <label
									for="type9"> Other</label> <form:input path="data.otherType"
										maxlength="30" /> <br> <br> <label
									style="font-weight: bold;">Union/Guild Affiliations</label> <form:input
										path="data.union" maxlength="100" /><br></td>
							</tr>
							<tr>
							</tr>
						</tbody>
					</table>
					<table id="table2">
						<tbody>
							<tr>
								<td colspan="4">
									<div class="box-header">Attributes</div>
								</td>
							</tr>
							<tr>
								<td style="width: 130px"><label>Gender:</label></td>
								<td><form:select path="data.gender" style="width: 130px;">
										<form:option value="Male">Male</form:option>
										<form:option value="Female">Female</form:option>
									</form:select></td>
								<td><label>Age Range:</label>
								<td style="text-align: left"><form:input path="data.age"
										style="width: 40px" maxlength="3" />-<form:input path="data.age2"
										style="width: 40px" maxlength="3" /></td>
							</tr>
							<tr>
								<td><label>Hair Color:</label></td>
								<td style="text-align: left"><form:input path="data.haircolor"
										style="width: 130px;" maxlength="30" /></td>
								<td><label>Height:</label></td>
								<td><form:input path="data.height" style="width: 40px"
										maxlength="3" />'<form:input path="data.height2"
										style="width: 40px" maxlength="3" />''</td>
							</tr>
							<tr>
								<td><label>Hair Length:</label></td>
								<td><form:select path="data.hairlength" style="width: 130px;">
										<form:option value=""></form:option>
										<form:option value="Bald">Bald</form:option>
										<form:option value="Chin Length">Chin Length</form:option>
										<form:option value="Long">Long</form:option>
										<form:option value="Shaved">Shaved</form:option>
										<form:option value="Short">Short</form:option>
										<form:option value="Shoulder Length">Shoulder Length</form:option>
									</form:select></td>
								<td><label>Weight&nbsp;lbs:</label></td>
								<td><form:input path="data.weightlbs" style="width: 40px;"
										maxlength="3" /></td>
							</tr>
							<tr>
								<td><label>Eye Color:</label>
								<td><form:select path="data.eyecolor" style="width: 130px;">
										<form:option value=""></form:option>
										<form:option value="Blue">Blue</form:option>
										<form:option value="Brown">Brown</form:option>
										<form:option value="Dark brown">Dark Brown</form:option>
										<form:option value="Gray">Gray</form:option>
										<form:option value="Green">Green</form:option>
										<form:option value="Hazel">Hazel</form:option>
									</form:select></td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td><label>Vocal Range:</label></td>
								<td><form:select path="data.vocalrange" style="width: 130px;">
										<form:option value=""></form:option>
										<form:option value="Alto">Alto</form:option>
										<form:option value="Baritone">Baritone</form:option>
										<form:option value="Bass">Bass</form:option>
										<form:option value="Soprano">Soprano</form:option>
										<form:option value="Tenor">Tenor</form:option>
									</form:select></td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td><label>Ethnicity:</label></td>
								<td style="text-align: left"><form:input path="data.ethnicity"
										style="width: 130px;" maxlength="30" /></td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
							</tr>
						</tbody>
					</table>
					<table id="table3">
						<tbody>
							<tr>
								<td colspan="2">
									<div class="box-header">Build Your Resume - Step 1</div>
								</td>
							</tr>
							<tr>
								<td><label>Stage Name*:</label></td>
								<td><form:input path="data.stageName" maxlength="100"
										style="width: 200px" />
									<form:input path="data.name" maxlength="50"
										class="hide" readonly="readonly" /></td>
							</tr>
							<tr>
								<td><label>Title (Mr., Mrs., etc.):</label></td>
								<td><form:input path="data.title" maxlength="10"
										style="width: 200px" /></td>
							</tr>
							<tr>
								<td><label>First Name*:</label></td>
								<td><form:input path="data.firstName" maxlength="30"
										style="width: 200px" /></td>
							</tr>
							<tr>
								<td><label>Middle Name:</label></td>
								<td><form:input path="data.middleName" maxlength="30"
										style="width: 200px" /></td>
							</tr>
							<tr>
								<td><label>Last Name*:</label></td>
								<td><form:input path="data.lastName" maxlength="30"
										style="width: 200px" /></td>
							</tr>
							<tr>
								<td><label>Suffix (Jr., Sr., etc.):</label></td>
								<td><form:input path="data.suffix" maxlength="10"
										style="width: 200px" /></td>
							</tr>
							<tr>
								<td><label>Street Address:</label></td>
								<td><form:input path="data.address1" maxlength="50"
										style="width: 230px" /></td>
							</tr>
							<tr>
								<td><label>Street Address 2:</label></td>
								<td><form:input path="data.address2" maxlength="50"
										style="width: 230px" /></td>
							</tr>
							<tr>
								<td><label>City:</label></td>
								<td><form:input path="data.city" maxlength="50"
										style="width: 170px" /></td>
							</tr>
							<tr>
								<td><label>State/Province:</label></td>
								<td><form:input path="data.state" maxlength="30"
										style="width: 170px" /></td>
							</tr>
							<tr>
								<td><label>Zip Code:</label></td>
								<td><form:input path="data.zipcode" maxlength="10"
										style="width: 170px" /></td>
							</tr>
							<tr>
								<td><label>Country:</label></td>
								<td><form:select path="data.country" style="width: 230px;">
										<form:option value=""></form:option>
										<form:option value="USA">United States of America</form:option>
										<form:options items="${countries}" />
									</form:select></td>
							</tr>
							<tr>
								<td><label>Primary Phone Number:</label></td>
								<td><form:input path="data.phone" maxlength="20"
										style="width: 170px" /></td>
							</tr>
							<tr>
								<td><label>Alternate Phone Number:</label></td>
								<td><form:input path="data.alternatephone" maxlength="20"
										style="width: 170px" /></td>
							</tr>
							<tr>
								<td><label>E-mail Address:</label></td>
								<td><form:input path="data.emailid" maxlength="255"
										style="width: 170px" /></td>
							</tr>
							<tr>
								<td><label>Website:</label></td>
								<td><form:input path="data.website" maxlength="255"
										style="width: 170px" /></td>
							</tr>
							<tr>
								<td><label>Photo (max. 200KB):</label></td>
								<td style="text-align: center"><c:choose>
										<c:when test="${photosNo == 0}">No photo</c:when>
										<c:otherwise>
											<img width="100px" src="photo.html" alt="Photo" />
										</c:otherwise>
									</c:choose></td>
							</tr>
							<tr>
								<td></td>
								<td><form:input path="photoFile" type="file"/></td>
							</tr>
							<tr>
								<td colspan="2"><div class="box-header">
										<input type="submit" value="Save" name="save">
										<input type="submit" value="Save and Step 2" name="step2" style="float: right;">
								</div></td>
							</tr>
						</tbody>
					</table>
				</form:form>
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
<c:if test="${!empty param.errors}">
	<script type="text/javascript">
		setTimeout(function () {alert ("${param.errors}");}, 200);		
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