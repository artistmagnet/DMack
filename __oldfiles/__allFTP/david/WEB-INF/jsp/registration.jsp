<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="net.tanesha.recaptcha.ReCaptcha" %>
<%@ page import="net.tanesha.recaptcha.ReCaptchaFactory" %>
<!DOCTYPE html>

<html>
<head>
    <title></title>
    <meta charset="">
    <link rel="stylesheet" media="screen" href="styles/main.css">
    <link rel="shortcut icon" type="image/png" href="images/favicon.png">
    <script src="${resourcePaths.javascripts}/jquery-1.6.min.js" type="text/javascript" charset=""></script>

    <link href='http://fonts.googleapis.com/css?family=Cuprum' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Copse' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Dancing+Script' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>
</head>
<body>

<!--<div id="cloud">
    <div id="twitter-feed">We're first to officially announce open casting call for the highly anticipated new play by <a href="#">@VeronicaSmith</a>. Visit artist space <a href="#">@ArtistMagnet</a> for details.</div>
</div>-->
<div id="page-frame">
    <div id="page-header">
        <a href="/artist"><img class="root-buttons" src="images/button-artists.jpg" alt="artists"/></a>
        <img class="root-buttons" src="images/button-productions.jpg" alt="productions"/>
        <img class="root-buttons" src="images/button-venues.jpg" alt="venues"/>
    </div>
    <div id="page-content">
        <div class="membership-signup shadow">


            <form:form action="signup.htm" method="POST" acceptCharset="utf-8"
                       enctype="application/x-www-form-urlencoded"
                       cssClass="membership-signup" commandName="user">
                <form:hidden path="authenticityToken" value="ff1adadf3e27bcd02d89474291da2f1173d1c841"/>
                <p id="firstName">
                    <label for="first-name">First Name</label>
                    <form:input path="firstName"/>
                    <form:errors path="firstName" cssClass="error"/>
                </p>


                <p id="lastName">
                    <label for="last-name">Last Name</label>
                    <form:input path="lastName"/>
                    <form:errors path="lastName" cssClass="error"/>
                </p>

                <p id="companyName" style="display: none;">
                    <label for="company-name">Company Name</label>
                    <form:input path="companyName"/>
                    <form:errors path="companyName" cssClass="error"/>
                </p>

                <p id="email">
                    <label for="email">Email</label>
                    <form:input path="email"/>
                    <form:errors path="email" cssClass="error"/>
                </p>

                <p id="birthday">
                    <label for="date-fo-birth">Birthday</label>
                    <form:select path="year" id="birthday_year" onchange="checkdate(this, 'birthday', 'year');"
                                 cssStyle="width:80px; float:left;">
                        <form:option value="0">Year:</form:option>
                        <%
                            for (int i = 2000; i > 1900; i--) {
                        %>
                        <form:option value="<%=i%>"><%=i%>
                        </form:option>
                        <%
                            }
                        %>
                    </form:select>

                    <form:select path="month" id="birthday_month" onchange="checkdate(this, 'birthday', 'month');"
                                 cssStyle="width: 110px; float: left; margin-left: 15px;margin-right: 15px;">
                        <form:option value="0">Month:</form:option>
                        <%

                            String[] myMonths = {"January", "February", "March", "April", "May", "June", "Jule", "August", "September",
                                    "October", "November", "December"};

                            for (int i = 0; i < myMonths.length; i++) {
                        %>
                        <form:option value="<%=(i+1)%>"><%=myMonths[i]%>
                        </form:option>
                        <%
                            }
                        %>
                    </form:select>

                    <form:select path="day" id="birthday_day" onchange="checkdate(this, 'birthday', 'day');"
                                 cssStyle="width:70px;">
                        <form:option value="0">Day:</form:option>
                        <%
                            for (int i = 1; i <= 31; i++) {
                        %>
                        <form:option value="<%=i%>"><%=i%>
                        </form:option>
                        <%
                            }
                        %>
                    </form:select>

                    <form:errors path="birthday" id="birthdayError" cssClass="error"/>
                </p>

                <p id="foundedDate" style="display: none;">
                    <label for="founded-year">Founded Year</label>
                    <form:select path="foundedYear" id="foundedDate_year" onchange="checkdate(this, 'foundedDate', 'year')"
                                 cssStyle="width:80px; float:left;">
                        <form:option value="0">Year:</form:option>
                        <%
                            for (int i = 2000; i > 1900; i--) {
                        %>
                        <form:option value="<%=i%>"><%=i%>
                        </form:option>
                        <%
                            }
                        %>
                    </form:select>

                    <form:select path="foundedMonth" id="foundedDate_month" onchange="checkdate(this, 'foundedDate', 'month')"
                                 cssStyle="width: 110px; float: left; margin-left: 15px;margin-right: 15px;">
                        <form:option value="0">Month:</form:option>
                        <%

                            String[] myMonths = {"January", "February", "March", "April", "May", "June", "Jule", "August", "September",
                                    "October", "November", "December"};

                            for (int i = 0; i < myMonths.length; i++) {
                        %>
                        <form:option value="<%=(i+1)%>"><%=myMonths[i]%>
                        </form:option>
                        <%
                            }
                        %>
                    </form:select>

                    <form:select path="foundedDay" id="foundedDate_day" onchange="checkdate(this, 'foundedDate', 'day')"
                                 cssStyle="width:70px;">
                        <form:option value="0">Day:</form:option>
                        <%
                            for (int i = 1; i <= 31; i++) {
                        %>
                        <form:option value="<%=i%>"><%=i%>
                        </form:option>
                        <%
                            }
                        %>
                    </form:select>
                    <form:errors path="foundedDate" id="foundedDateError" cssClass="error"/>
                </p>

                <p id="password">
                    <label for="password">Chosen Password</label>
                    <form:password path="password"/>
                    <form:errors path="password" id="password" cssClass="error"/>
                </p>

                <p id="conformPassword">
                    <label for="password">Password Confirmation</label>
                    <form:password path="conformPassword"/>
                    <form:errors path="conformPassword" id="conformPassword" cssClass="error"/>
                </p>

                <p>
                    <%
                        ReCaptcha c = ReCaptchaFactory.newReCaptcha("6LdiFMcSAAAAALWKyHC-BbuzELKNfO517zVWbOyE", "6LdiFMcSAAAAAJIOTIyXyqkF9kZMaT4Gf69PtY3-", false);
                        out.print(c.createRecaptchaHtml(null, null));
                    %>
                    <form:errors path="captcha" cssClass="error" cssStyle="float: right;"/>
                </p>

                <p id="accountType">
                    <label for="type">Account Type</label>
                    <form:select path="accountTypeId" id="accountTypeId" onchange="accountTypeChecker(this)">
                        <form:options items="${accountTypes}" id="accountSelectedId" itemValue="accountTypeId"
                                      itemLabel="accountName"/>
                    </form:select>
                    <form:errors path="accountTypeId" cssClass="error"/>
                </p>

                <p>
                    <input type="submit" value="Sign Up"/>
                </p>
            </form:form>

        </div>
    </div>
</div>
<div id="page-frame-baseline"></div>
<div id="navigation-background"></div>
<div id="navigation-ribbon">
    <a href="/" alt="Artist Magnet home"><img id="logo" src="images/logo.png" alt="Artist Magnet"/></a>
</div>
</body>

<script type="text/javascript">

    var forCompany = new Array("companyName", "foundedDate");
    var forArtist = new Array("firstName", "lastName", "birthday");

    function accountTypeChecker(checkerName) {
        hideDynamicFields();
        if (checkerName.value == 5) {
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
        var dynamicFields = new Array("firstName", "lastName", "companyName", "birthday", "foundedDate");
        for (x in dynamicFields) {
            document.getElementById(dynamicFields[x]).style.display = "none";
        }
    }


    var persistenceField = { "firstName" : "checkMinField(firstName,3)",
        "lastName"  : "checkMinField(firstName,3)",
        "companyName" : "checkMinField(firstName,5)",
        "email" : "checkEmail(email)"
    };

    function checkMinField(field, length) {
        if (field.length >= length) {
            document.getELementById(field).innerHTML = "";
        } else {
            document.getELementById(field).innerHTML = "Please insert min " + length +
                    " Character";
        }
    }

    function checkdate(that, path, name) {
        var year = document.getElementById(path + "_" + "year").selectedIndex;
        var month = document.getElementById(path + "_" + "month").selectedIndex;
        var day = document.getElementById(path + "_" + "day").selectedIndex;
        if (year != 0) {
            year += 3;
        }
        if (!checkDate(year, month, day)) {
            if (name == "month") {
                document.getElementById(path + "_" + "day").selectedIndex = 0;
            } else if (name == "day" || name == "year") {
                document.getElementById(path + "_" + "month").selectedIndex = 0;
            }
        }

    }

    function checkDate(year, month, day) {
        var monthList = new Array(31, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
        if (month < 12) {
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
        accountTypeChecker(document.getElementById("accountTypeId"));
    });


</script>
</html> 
