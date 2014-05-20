<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
	<title>Register</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" media="screen" href="css/main.css">
    <link rel="shortcut icon" type="image/png" href="images/favicon.png">
    <script src="js/jquery-1.7.1.min.js" type="text/javascript" charset=""></script>
</head>
<!-- Restore form state after page loaded -->
<body onload="init();">
<div id="page-frame">
    <div id="page-header">
        <img class="root-buttons" src="images/button-artists.jpg" alt="artists"/>
        <img class="root-buttons" src="images/button-productions.jpg" alt="productions"/>
        <img class="root-buttons" src="images/button-venues.jpg" alt="venues"/>
    </div>
    <div id="page-content">
        <div class="membership-signup shadow" >
       	 <form:form id="user" action="form_signup.html" commandName="user" class="membership-signup" method="POST" 
       	 	onsubmit="return validateForm();">
			<table><tr><td>
                <p id="companyName" style="display: none;">
                   <label for="company-name">Company Name *</label>
                   <form:input path="companyName" id="companyName" name="companyName" 
                   		maxlength="100"/>
                </p>
			</td></tr>
			<tr><td>
                <p id="foundedYear" style="display: none;">
	                <label for="founded-year">Year Company Founded</label>
	                <form:select path="foundedYear" id="foundedYear_year" name="foundedYear">
	                	<form:option value="" label="Year:" selected="selected"/>
                        <c:forEach begin="1801" end="2012" var="year" step="1">
                        	<form:option value="${year}" label="${year}" />
                        </c:forEach>
                    </form:select>
                </p>
			</td></tr>
			<tr><td>
                <p id="firstName"  >
                    <label id="firstnamelabel" for="first-name">First Name *</label>
                    <form:input path="firstName" id="firstName" name="firstName" maxlength="50" />
                </p>
			</td></tr>
			<tr><td>
                <p id="lastName" >
                    <label id="lastnamelabel" for="last-name">Last Name *</label>
                    <form:input path="lastName" id="lastName" name="lastName" maxlength="50" />
                </p>
			</td></tr>
			<tr><td>
                <p id="email">
                    <label id="emaillabel" for="email">Email *</label>
                    <form:input path="email" id="email" name="email" maxlength="255" />
                </p>
			</td></tr>
			<tr><td>
                <p id="birthday">
                    <label id="birthdaylabel" for="date-fo-birth">Date of Birth *</label>
                    <select id="birthday_year" name="year" style="width:80px; float:left;" onchange="checkDate(this, 'birthday', 'year');">
	   	                <option value="" selected="selected">Year:</option>
	                    <c:forEach begin="1801" end="2012" var="year" step="1">
	                       <option value="${year}">${year}</option>
	                    </c:forEach>
                    </select>
                    <select id="birthday_month" name="month" style="width: 110px; float: left; margin-left: 15px;margin-right: 15px;" onchange="checkDate(this, 'birthday', 'month');">
                        <option value="" selected="selected">Month:</option>
                         <option value="1">January</option>
                         <option value="2">February</option>
                         <option value="3">March</option>
                         <option value="4">April</option>
                         <option value="5">May</option>
                         <option value="6">June</option>
                         <option value="7">July</option>
                         <option value="8">August</option>
                         <option value="9">September</option>
                         <option value="10">October</option>
                         <option value="11">November</option>
                         <option value="12">December</option>
                    </select>
                    <select id="birthday_day" name="day" style="width:70px;" onchange="checkDate(this, 'birthday', 'day');">
                         <option value="" selected="selected">Day:</option>
                         <c:forEach begin="01" end="31" var="day" step="1">
                             <option value="${day}">${day}</option>
                         </c:forEach>
                    </select>
                </p>
            </td></tr>
			<tr><td>
               <p id="gender">
                   <label id="genderlabel" >Gender *</label>
                   <form:select path="gender" id="genders" name="genders" >
                   	   <form:option value="1" label="Male" selected="selected" />
                   	   <form:option value="2" label="Female" />
				  </form:select>
               </p>
			</td></tr>
			<tr><td>
               	<p id="password">
                    <label for="password">Password *</label>
                    <form:password path="password" id="password" name="password" />
	            </p>
			</td></tr>
			<tr><td>
                <p id="conformPassword">
                    <label for="password">Confirm Password *</label>
                    <input id="conformPassword" name="conformPassword" type="password" value=""/>
                </p>
			</td></tr>
			<tr><td>
                <p>
                   <script type="text/javascript" src="http://api.recaptcha.net/challenge?k=6Lfs3s4SAAAAACsE1nwr8-iNmr3Ar__ewvq2_iFF"></script>
                </p>
			</td></tr>
			<tr><td>
                <p id="accountType1">
                    <label>Account Type *</label>
                    <form:select path="accountType.id" id="accounts" name="accounts" onchange="selectchange()">
						<c:forEach items="${accTypes}" var="at" varStatus="status">
                        	<form:option value="${at.id}" label="${at.name}" />
                        </c:forEach>
                    </form:select>
					<a  style="text-align: left;"  href="accounttypeinfo.htm"  alt="dunno which account to choose"><font size="2"><u>Don't know which account type to choose?</u></font></a>
                </p>
			</td></tr>
			<tr><td>
                <p>
                    <input type="submit"  class="signup_button"  style="float: right;" value="Next" onclick="validate_submit();" />
					<br />
                    <font size=2 align="right" >
                    	By clicking this button I agree to Artist Magnet's <a  style="text-align: left;"  href="terms.htm"  alt="terms and conditions"><u>Terms and conditions</u></a>
                    </font>
                </p>
			</td></tr>
		  </table>
		</form:form>
		<iframe src="https://www.facebook.com/plugins/registration.php?client_id=102540469215&redirect_uri=http://artistmagnet.com/app/fb_signup.html&fields=${fbFields}" scrolling="auto" frameborder="no" style="border:none" allowTransparency="true" width="100%" height="330" id="fbreg"></iframe> 
        </div>
    </div>
</div>
<div id="page-frame-baseline"></div>
<div id="navigation-background"></div>
<div id="navigation-ribbon">
    <a href="/"><img id="logo" src="images/logo.png" alt="Artist Magnet"/></a>
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
    var forCompany = new Array("companyName", "foundedYear");
    var forArtist = new Array("firstName", "lastName", "birthday");
    function accountTypeChecker(checkerValue) {
        hideDynamicFields();
        if (checkerValue == 5) {
            for (x in forCompany) {
                document.getElementById(forCompany[x]).style.display = "block";
            }
        } else {
            for (x in forArtist) {
                document.getElementById(forArtist[x]).style.display = "block";
            }
        }
    }

    function hideDynamicFields() {
        var dynamicFields = new Array("firstName", "lastName", "companyName", "birthday", "foundedYear");
        for (x in dynamicFields) {
            document.getElementById(dynamicFields[x]).style.display = "none";
        }
    }

    function checkDate(that, path, name) {
        var year = document.getElementById(path + "_" + "year").selectedIndex;
        var month = document.getElementById(path + "_" + "month").selectedIndex;
        var day = document.getElementById(path + "_" + "day").selectedIndex;
        if (year != 0) {
            year += 3;
        }
        if (!correctDate(year, month, day)) {
            if (name == "month") {
                document.getElementById(path + "_" + "day").selectedIndex = 0;
            } else if (name == "day" || name == "year") {
                document.getElementById(path + "_" + "month").selectedIndex = 0;
            }
        }
    }

    function correctDate(year, month, day) {
        var monthList = new Array(31, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
        if (month < 12) 
        {
            if (monthList[month] < day) {
                if (month == 2) {
                    if (year % 4 == 0) {
                        if (day > 29) {
                            return false;
                        }
                    }
                    else if (day > 28) {
                        return false;
                    }
                } else {
                    return false;
                }
            }
        }
        return true;
    }

    $(document).ready(function() {
        hideDynamicFields();
        for (x in forArtist) {
            document.getElementById(forArtist[x]).style.display = "block";
        }
        showAccountTypes();
        accountTypeChecker(document.getElementById("accountTypeId").value);
        if (document.getElementById("accountTypeName").value != "" && document.getElementById("accountTypeId").value > 0
                && document.getElementById("accountTypeId").value <= 5) {
            document.getElementById("accountTypeNameSpan").innerHTML = "  " + document.getElementById("accountTypeName").value;
        } else {
            document.getElementById("accountTypeId").value = 0;
        }
    });


    function showAccountTypes() {
        var myMenu = {"options": [
            {"name": "Artist", "customOptions": "Actors, Directors, Designers, etc."},
            {"name": "Production/Management", "customOptions": "Producers, Stage Managers, Technical Directors, etc."},
            {"name": "Representative", "customOptions": "Agents, Managers, Publicists, etc."},
            {"name": "Fan", "customOptions": "Fans and patrons of the arts, artists, etc."},
            {"name": "Company", "customOptions": "Production Companies, Arts Related Businesses, Affiliate Organizations, etc."}

        ]};
        var options = document.createElement("div");
        options.className = "accountTypesOptions";
        options.id = "accountTypesOptions";
        for (x in myMenu.options) {
            var option = document.createElement("div");
            option.innerHTML = "  " + myMenu.options[x].name;
            option.customOptions = createCustomOptions(myMenu.options[x].customOptions);
            option.rollId = ++x;
            option.onmouseover = function() {
                this.style.background = "#3c7dd0";
                this.style.color = "white";
                this.customOptions.style.display = "block";
            }
            option.onmouseout = function() {
                this.style.background = "white";
                this.style.color = "black";
                this.customOptions.style.display = "none";
            }
            option.onclick = function() {
                submitAccountType(this.rollId, this.innerHTML);
            }
            options.appendChild(option);
        }
        document.getElementById("accountTypes").appendChild(options);
    }

    function createCustomOptions(customRoles) {
        var customOptions = document.createElement("div");
        customOptions.className = "customOptions";
        customOptions.innerHTML = customRoles;
        customOptions.style.display = "none";
        document.getElementById("accountTypes").appendChild(customOptions);
        return customOptions;
    }

    function submitAccountType(rollId, rollName) {
        document.getElementById("accountTypeId").value = rollId;
        document.getElementById("accountTypeNameSpan").innerHTML = rollName;
        document.getElementById("accountTypeName").value = rollName.substring(2);
        accountTypeChecker(rollId);
    }

    var accountTypeClick = false;
    var accountDisplay = false;

    $('#accountTypes').click(function() {
        accountTypeClick = true;
        if (document.getElementById("accountTypesOptions").style.display == "block") {
            document.getElementById("accountTypesOptions").style.display = "none";
            accountDisplay = false;
        } else {
            document.getElementById("accountTypesOptions").style.display = "block";
            accountDisplay = true;
        }
    });

    $('body').click(function() {
        if (accountTypeClick == true) {
            accountTypeClick = false;
        } else {
            if (accountDisplay == true) {
                document.getElementById("accountTypesOptions").style.display = "none";
            }
        }
    });

function selectchange()
{
    var forCompany = new Array("companyName", "foundedYear");
    var forArtist = new Array("firstName", "lastName", "birthday");
	var selectObj = document.getElementById("accounts");
	for ( var i = 0 ; i < selectObj.options.length ; i++ )
	{
		if ( selectObj.options[i].selected )
		{
			var sel = selectObj.options[i].value;
			if (sel == 5) {
				for (x in forCompany) {
					document.getElementById(forCompany[x]).style.display = "block";
				}
				document.getElementById("firstnamelabel").innerHTML = "Primary Contact First Name *";
				document.getElementById("lastnamelabel").innerHTML = "Primary Contact Last Name *";
				document.getElementById("emaillabel").innerHTML = "Primary Contact Email *";
				document.getElementById("genderlabel").innerHTML = "Primary Contact Gender *";
				document.getElementById("birthdaylabel").innerHTML = "Primary Contact Date of Birth *";
			} else {
				for (x in forArtist) {
					document.getElementById(forArtist[x]).style.display = "block";
				}
				for (x in forCompany) {
					document.getElementById(forCompany[x]).style.display = "none";
				}
				document.getElementById("firstnamelabel").innerHTML = "First Name *";
				document.getElementById("lastnamelabel").innerHTML = "Last Name *";
				document.getElementById("emaillabel").innerHTML = "Email *";
				document.getElementById("genderlabel").innerHTML = "Gender *";
				document.getElementById("birthdaylabel").innerHTML = "Date of Birth *";
			}
		}
	}

}

function open_win()
{
	window.open("http://www.w3schools.com");
}


function validateForm()
{

	var x=document.forms["user"]["firstName"].value;
	if (x==null || x=="")
	{
	  alert("First name must be filled out");
	  return false;
	}	

	var x=document.forms["user"]["lastName"].value;
	if (x==null || x=="")
	{
	  alert("Last name must be filled out");
	  return false;
	}
	
	var x=document.forms["user"]["email"].value;
	if (x==null || x=="")
	{
	  alert("E-mail must be filled out");
	  return false;
	}
	var atpos=x.indexOf("@");
	var dotpos=x.lastIndexOf(".");
	if (atpos<1 || dotpos<atpos+2 || dotpos+2>=x.length)
	{
	  alert("Not a valid e-mail address");
	  return false;
	}	
		
	
	var x=document.forms["user"]["password"].value;
	if (x==null || x=="")
	{
	  alert("Password must be filled out");
	  return false;
	}
	
	var y=document.forms["user"]["conformPassword"].value;
	if (y==null || y=="")
	{
	  alert("Confirm Password must be filled out");
	  return false;
	}
	
	if ( x != y )
	{
		alert("Password and Confirm Password must be same.");
		return false;
	}
		

	return true;
};
/*
 * Init page to restore form state on account type
 */
function init () {
   selectchange();
};
</script>
<c:if test="${!empty msg}">
	<script type="text/javascript">
		setTimeout(function () {alert ("${msg}");}, 200);		
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