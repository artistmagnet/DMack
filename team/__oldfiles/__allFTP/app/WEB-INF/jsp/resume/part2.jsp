<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
	<title>Build New Resume</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link rel="shortcut icon" type="image/png" href="../images/favicon.png">
	<link rel="stylesheet" media="screen" href="../css/smoothness/jquery-ui-1.8.18.custom.css">
    <link rel="stylesheet" media="screen" href="../css/main.css">
    <script src="../js/jquery-1.7.1.min.js" type="text/javascript" ></script>
    <script src="../js/jquery.chili-2.2.js" type="text/javascript" ></script>
    <script src="../js/jquery-ui-1.8.18.custom.min.js" type="text/javascript" ></script>
    <script src="../js/jquery.dragtable.js" type="text/javascript" ></script>
    <script src="../js/Math.uuid.js" type="text/javascript" ></script>
    <script src="../js/resume.js" type="text/javascript"></script>
    <script type="text/javascript">
    $(document).ready(function () {
 	   	$('.container').find('table.moveable-cells thead tr:first .field')
 	   		.bind("mouseover", function () {
 	    		$(this).select().focus();
 	   	}).bind("mouseout", function () {
 	    		$(this).blur();
 	   	});
 	  	// Reset headers' buttons state
 	   	$('.header').find('button.deleteBtn').removeClass('hide');
 	   	$('.header').find('button.restoreBtn').removeClass('hide');
 	   	$('.header').find('button.undoBtn').addClass('hide');
 	    	$("#moveable").sortable().disableSelection();
 	   	$(".moveable-cells tbody").sortable({
 	   		   update: function(event, ui) {rowMove(event, this);}}
 	   	).disableSelection();
 	   	$('div.undo-data').each(function () {
 	   		$(this).html(Math.uuidCompact());	
 	   	});
 	   	$('.moveable-cells').each(function () {
 	   		$(this).dragtable({dragaccept:'th.move'});	
 	   	});
 	   	$('.undoBtn').click(function () {
 	   		undoSection(this);
 	   	});
 	   	$('.restoreBtn').click(function () {
 	   		restoreDefaultSection(this);
 	   	});
 	   	$('.deleteBtn').click(function () {
 	   		removeSection(this);
 	   	});
 	   	$('.container tbody select[name="category"]').change(function () {
 	  		showfield(this);
 	   	});
 	   	$('form.resume2').submit(buildSectionsDataToSave);
 	   	$('#newOther').click(generateOtherSection);
 	   	$('#newCustom').click(generateCustomSection);
 	   	$('#addCategory').click(function () {
 	   		addCategory(this);
 	  	});
 	    <c:choose>
			<c:when test="${resume.data.type == 1}"> 
			    $('.container:first thead tr:eq(0) th:eq(3)').addClass ('hide');
		   		$('.container:first tbody tr td:eq(3)').addClass ('hide');
			</c:when>
			<c:otherwise>
			    $('.container:first thead tr:eq(0) th:eq(3)').removeClass ('hide');
		   		$('.container:first tbody tr td:eq(3)').removeClass ('hide');
			</c:otherwise>
		</c:choose>
 	    <c:choose>
		<c:when test="${resume.data.type == 0}"> 
		    $('.container:first thead tr:eq(0) th:eq(1)').text ('Role*');
		</c:when>
		<c:otherwise>
		    $('.container:first thead tr:eq(0) th:eq(1)').text ('Role');
		</c:otherwise>
		</c:choose>
 	   	bindAddDelButtons(); 
  	});
    </script>
</head>
<body>
	<div id="page-frame">
	    <div id="page-header">
	        <img class="root-buttons" src="../images/button-artists.jpg" alt="artists">
	        <img class="root-buttons" src="../images/button-productions.jpg" alt="productions">
	        <img class="root-buttons" src="../images/button-venues.jpg" alt="venues">
		    <span id="logged-in" style="vertical-align: top; line-height: 33px; font-size: 0.8em;">
		   		<c:out value="${user.email}" escapeXml="true" /> | <a href="../j_spring_security_logout" style="vertical-align: top;">Logout</a>
		   	</span>
	    </div>
	    <div id="page-content">
        <div class="resume2 shadow" >
			<form method="post" action="part2.html" class="resume2">
				<input name="sectionsData" id="toSave" class="hide"/> 
				<div id="sectionsDataDB" class="hide"></div>
				<div class="box"><b>
				<c:choose>
					<c:when test="${resume.data.type == 8}">${resume.data.otherType}</c:when>
					<c:otherwise>${resumeTypes[resume.data.type]}</c:otherwise>
				</c:choose></b></div>
				<c:choose>
					<c:when test="${!empty resume.data.sectionsData}">
						${resume.data.sectionsData}
					</c:when>
					<c:otherwise>
					<div id="scriptVersion" class="hide">1.0</div>
					<div class="section-box">
						<div class="undo-action hide"></div>
						<div class="undo-data hide"></div>
						<div class="section-type hide">theatre</div>
						<div class="header"><span>Theatre*</span>
							<button type="button" class="section-button hide undoBtn">Undo</button>
						</div>
						<div class="container">
							<table class="moveable-cells">
								<thead>
									<tr>
										<th>Production*</th>
										<th>Role</th>
										<th>Venue*</th>
										<th>Director</th>
										<th class="button"><button type="button" class="add-del add-col" title="Add column">+</button></th> 
										<th class="button"><button type="button" class="add-del del-col hide" title="Remove last column">-</button></th> 
									</tr> 
								</thead>
								<tbody>
									<tr class="move">
										<td><input type="text" name="production" class="field" style="width:150px;"/></td>
										<td><input type="text" name="role" class="field" style="width:150px;"/></td>
										<td><input type="text" name="venue" class="field" style="width:150px;"/></td>
										<td><input type="text" name="director" class="field" style="width:150px;"/></td>
										<td class="button"><button type="button" class="add-del add-row" title="Add row">+</button></td> 
										<td class="button"><button type="button" class="add-del del-row hide" title="Remove last row">-</button></td> 
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div id="moveable">
						<div class="section-box">
							<div class="undo-action hide"></div>
							<div class="undo-data hide"></div>
							<div class="section-type hide">edu</div>
							<div class="header move"><span>Education/Training</span>
								<button type="button" class="section-button hide undoBtn">Undo</button>
								<button type="button" class="section-button restoreBtn">Restore Default</button>
								<button type="button" class="section-button deleteBtn">Delete Section</button>
							</div>
							<div class="container">
								<table class="moveable-cells">
									<thead>
										<tr>
											<th class="move">Name</th>
											<th class="move">Area of Study</th>
											<th class="move">Degree</th>
											<th class="move">Instructor</th>
											<th class="move">Address</th>
											<th class="move">Year</th>
											<th class="button"></th>
											<th class="button"></th>
										</tr>
									</thead>
									<tbody>
										<tr class="move">
											<td><input type="text" name="college" class="field" style="width:120px;"/></td>
											<td><input type="text" name="study" class="field" style="width:120px;"/></td>
											<td><input type="text" name="degree" class="field" style="width:60px;"/></td>
											<td><input type="text" name="instructor" class="field" style="width:120px;"/></td>
											<td><input type="text" name="address" class="field" style="width:120px;"/></td>
											<td><input type="text" name="year" class="field" style="width:30px;"/></td>
											<td class="button"><button type="button" class="add-del add-row" title="Add row">+</button></td> 
											<td class="button"><button type="button" class="add-del del-row hide" title="Remove last row">-</button></td> 
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<div class="section-box">
							<div class="undo-action hide"></div>
							<div class="undo-data hide"></div>
							<div class="section-type hide">rep</div>
							<div class="header move"><span>Representation</span>
								<button type="button" class="section-button hide undoBtn">Undo</button>
								<button type="button" class="section-button restoreBtn">Restore Default</button>
								<button type="button" class="section-button deleteBtn">Delete Section</button>
							</div>
							<div class="container">
								<table class="moveable-cells">
									<thead>
										<tr>
											<th>Type</th>
											<th class="move">Company</th>
											<th class="move">Contact</th>
											<th class="move">Title</th>
											<th class="move">Phone</th>
											<th class="move">Email</th>
											<th class="move">Address</th>
											<th class="button"></th>
											<th class="button"></th>
										</tr>
									</thead>
									<tbody>
										<tr class="move">
											<td><input type="text" name="type" class="field" style="width:50px;"/></td>
											<td><input type="text" name="company" class="field" style="width:100px;"/></td>
											<td><input type="text" name="contact" class="field" style="width:90px;"/></td>
											<td><input type="text" name="title" class="field" style="width:50px;"/></td>
											<td><input type="text" name="phone" class="field" style="width:70px;"/></td>
											<td><input type="text" name="email" class="field" style="width:100px;"/></td>
											<td><input type="text" name="address" class="field" style="width:100px;"/></td>
											<td class="button"><button type="button" class="add-del add-row" title="Add row">+</button></td> 
											<td class="button"><button type="button" class="add-del del-row hide" title="Remove last row">-</button></td> 
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<c:if test="${resume.data.type == 0}">
							<div class="section-box">
								<div class="undo-action hide"></div>
								<div class="undo-data hide"></div>
								<div class="section-type hide">skills</div>
								<div class="header move"><span>Special Skills</span>
									<button type="button" class="section-button hide undoBtn">Undo</button>
									<button type="button" class="section-button restoreBtn">Restore Default</button>
									<button type="button" class="section-button deleteBtn">Delete Section</button>
								</div>
								<div class="container">
									<table class="moveable-cells">
										<thead>
											<tr>
												<th>Category</th>
												<th class="move">Skill</th>
												<th class="move">Skill</th>
												<th class="move">Skill</th>
												<th class="move">Skill</th>
												<th class="button"><button type="button" class="add-del add-col" title="Add column">+</button></th> 
												<th class="button"><button type="button" class="add-del del-col hide" title="Remove last column">-</button></th>									
											</tr>
										</thead>
										<tbody>
											<tr class="move">
												<td><select name="category"	style="width:120px">
													<option value="Accent">Accent</option>
										            <option value="Athletics">Athletics</option>
													<option value="Combat">Combat</option>
													<option value="Dance">Dance</option>
													<option value="Music">Music</option>
													<option value="Singing">Singing</option>
													<option value="Other">Other</option>
												</select></td>
												<td><input type="text" class="field" style="width:120px;"/></td>
												<td><input type="text" class="field" style="width:120px;"/></td>
												<td><input type="text" class="field" style="width:120px;"/></td>
												<td><input type="text" class="field" style="width:120px;"/></td>
												<td class="button"><button type="button" class="add-del add-row" title="Add row">+</button></td> 
												<td class="button"><button type="button" class="add-del del-row hide" title="Remove last row">-</button></td> 
											</tr>
										</tbody>
									</table>
									<div id="otherCategory" class="hide">
										<label>Enter Category Title:</label>
										<input type="text" name="otherSkill" maxlength="20"/>
										<button id="addCategory" type="button" value="rowNo">Enter</button>
									</div>
								</div>
							</div>
						</c:if>
						<div class="others-section hide"></div>
						<div class="section-box others-section">
							<div class="undo-action hide"></div>
							<div class="undo-data hide"></div>
							<div class="section-type hide">other</div>
							<div class="header move"><span>Other</span>
								<button type="button" class="section-button hide undoBtn">Undo</button>
								<button type="button" class="section-button restoreBtn">Restore Default</button>
								<button type="button" class="section-button deleteBtn">Delete Section</button>
							</div>
							<div class="container">
								<table>
									<tr><td><div style="text-align: right;">
										<label>Enter Section Title:</label>
										<input type="text" name="sectionTitle" style="width:300px;"/>
									</div>
									</td></tr>
									<tr><td><textarea rows="5" style="width: 727px"></textarea></td></tr>
								</table>
							</div>
						</div>
						<div class="custom-section hide"></div>
						<div class="section-box custom-section">
							<div class="undo-action hide"></div>
							<div class="undo-data hide"></div>
							<div class="section-type hide">custom</div>
							<div class="header move"><span>Custom</span>
								<button type="button" class="section-button hide undoBtn">Undo</button>
								<button type="button" class="section-button restoreBtn">Restore Default</button>
								<button type="button" class="section-button deleteBtn">Delete Section</button>
							</div>
							<div class="container">
								<div style="text-align: right;">
									<label>Enter Section Title:</label>
									<input type="text" name="sectionTitle" style="width:300px;"/>
								</div>
								<table class="moveable-cells">
									<thead>
										<tr>
											<th class="move"><input type="text" value="Enter Column Title" class="field" style="width:150px;"/></th>
											<th class="move"><input type="text" value="Enter Column Title" class="field" style="width:150px;"/></th>
											<th class="move"><input type="text" value="Enter Column Title" class="field" style="width:150px;"/></th>
											<th class="move"><input type="text" value="Enter Column Title" class="field" style="width:150px;"/></th>
											<th class="button"><button type="button" class="add-del add-col" title="Add column">+</button></th> 
											<th class="button"><button type="button" class="add-del del-col hide" title="Remove last column">-</button></th>									
									</thead>
									<tbody>
										<tr class="move">
											<td><input type="text" class="field" style="width:150px;"/></td>
											<td><input type="text" class="field" style="width:150px;"/></td>
											<td><input type="text" class="field" style="width:150px;"/></td>
											<td><input type="text" class="field" style="width:150px;"/></td>
											<td class="button"><button type="button" class="add-del add-row" title="Add row">+</button></td> 
											<td class="button"><button type="button" class="add-del del-row hide" title="Remove last row">-</button></td> 
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					</c:otherwise>
				</c:choose>
				<div id="formfooter">
					<br>
						<button id="newOther" type="button">Add Other Section</button>
						<button id="newCustom" type="button">Add Custom Section</button>
					<br><br><br>
					<div class="box">
						<button type="submit" name="back">Back to Step 1</button>
						<button type="submit" name="save">Save</button>
						<button type="submit" name="finish" style="float: right;">Save and Finish</button>
					</div>
				</div>
			</form>
        </div>
    </div>
</div>
<div id="msgDialog" title="Message" class="ui-helper-hidden" style="font-size: 70%;">
  <p></p>	  
</div>
<div id="page-frame-baseline"></div>
<div id="navigation-background"></div>
<div id="navigation-ribbon">
    <a href="http://artistmagnet.com/"><img id="logo" src="../images/logo.png" alt="Artist Magnet home"></a>
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