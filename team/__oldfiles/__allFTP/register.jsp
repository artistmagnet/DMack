<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page import="net.tanesha.recaptcha.ReCaptcha" %>
<%@ page import="net.tanesha.recaptcha.ReCaptchaFactory" %>

<!DOCTYPE html>
<html><head><meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

        <title>Register</title>

        <meta charset="">

        <link rel="stylesheet" media="screen" href="styles/main.css">
        <link rel="stylesheet" media="screen" href="styles/fb.css">

        <link rel="shortcut icon" type="image/png" href="images/favicon.png">

        <script src="js/jquery-1.6.2.min.js" type="text/javascript" charset=""></script>
        <script src="js/jquery.validate.min.js" type="text/javascript" charset=""></script>
        
        <script src="js/artistmagnet.js" type="text/javascript" charset=""></script>
        <script src="js/validator.js" type="text/javascript" charset=""></script>

        <link href="signup_files/css_003.css" rel="stylesheet" type="text/css">
        <link href="signup_files/css_002.css" rel="stylesheet" type="text/css">
        <link href="signup_files/css_004.css" rel="stylesheet" type="text/css">
        <link href="signup_files/css.css" rel="stylesheet" type="text/css">

    </head>

    <body>


        <!--<div id="cloud">
        
            <div id="twitter-feed">We're first to officially announce open casting call for the highly anticipated new play by <a href="#">@VeronicaSmith</a>. Visit artist space <a href="#">@ArtistMagnet</a> for details.</div>
        
        </div>-->

        <div id="page-frame">
            <div id="page-header">
                <img class="root-buttons" src="signup_files/button-artists.jpg" alt="artists">
                <img class="root-buttons" src="signup_files/button-productions.jpg" alt="productions">
                <img class="root-buttons" src="signup_files/button-venues.jpg" alt="venues">
            </div>

            <div id="page-content">
                <div class="membership-signup shadow">
                    <form id="register_form" class="membership-signup" action="doRegister.jsp" method="POST" accept-charset="utf-8">
                        <p style="display: block; ">
                            <label for="first-name">First Name</label>
                            <input id="firstName" name="firstName" type="text" value="">
                        </p>
                        <p style="display: block; ">
                            <label for="last-name">Last Name</label>
                            <input id="lastName" name="lastName" type="text" value="">
                        </p>
                        <p id="companyName" style="display: none; ">
                            <label for="company-name">Company Name</label>
                            <input id="companyName" name="companyName" type="text" value="">
                        </p>
                        <p id="email">
                            <label for="email">Email</label>
                            <input id="email" name="email" type="text" value="">
                        </p>
                        <p id="birthday" style="display: block; ">
                            <label for="date-fo-birth">Birthday</label>
                            <select id="birthday_year" name="birthday_year" style="width:80px; float:left;">
                                <option value="" selected="selected">Year:</option>
                                <c:forEach begin="1901" end="2000" var="year" step="1">
                                    <option value="${year}">${year}</option>
                                </c:forEach>
                            </select>

                            <select id="birthday_month" name="birthday_month" style="width: 110px; float: left; margin-left: 15px;margin-right: 15px;">
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



                            <select id="birthday_day" name="birthday_day" style="width:70px;" >
                                <option value="" selected="selected">Day:</option>
                                <c:forEach begin="01" end="31" var="day" step="1">
                                    <option value="${day}">${day}</option>
                                </c:forEach>
                            </select>





                        </p>



                        <p id="foundedYear" style="display: none; ">
                            <label for="founded-year">Founded Year</label>
                            <select id="foundedYear_year" name="foundedYear">
                                <option value="0" selected="selected">&nbsp;Year:</option>
                                <c:forEach begin="1801" end="2011" var="year" step="1">
                                    <option value="${year}">${year}</option>
                                </c:forEach>
                            </select>
                        </p>

                        <p id="password">
                            <label for="password">Chosen Password</label>
                            <input id="password" name="password" type="password" value="">
                        </p>

                        <p id="conformPassword">
                            <label for="password">Password Confirmation</label>
                            <input id="conformPassword" name="conformPassword" type="password" value="">
                        </p>

                        <p>
                            <%
                                ReCaptcha c = ReCaptchaFactory.newReCaptcha("6Lf4AMsSAAAAAK0WhfpzzwjF9troWZzZSE5vJSQy", "6Lf4AMsSAAAAAL6VfVYNimrwx3Yx41_X2Uf2gfww", false);
                                out.print(c.createRecaptchaHtml(null, null));
                            %>                            
                        <p></p>



                        <p id="accountType">

                            <label>Account Type</label>
                            <select name="account" id="account">
                                <option value="">Accounts</option>
                                <option value="1">Artist</option>
                                <option value="2">Production/Management</option>
                                <option value="3">Representative</option>
                                <option value="4">Fan</option>
                                <option value="5">Company</option>
                                <option value="6">Admin</option>
                            </select>

                        <p></p>



                        <p>
                            <input type="button" style="float: right;" value="Sign Up" id="save_button">
                        </p>
                        <p><div id="messageBox"></div></p>

                    </form>
                    <iframe src="https://www.facebook.com/plugins/registration.php? client_id=113869198637480& redirect_uri=http%3a%2f%2fwww.artistmagnet.com%2fdoFacebookRegistration.jsp& fields=[ {'name':'name'}, {'name':'email'}, {'name':'birthday'}, {'name':'password'}, {'name':'account',    'description':'Account Type',             'type':'select',    'options':{'1':'Artist','2':'Production/Management','3':'Representative','4':'Fan','5':'Company','6':'Admin'}}]" scrolling="auto" frameborder="no" style="border:none" allowTransparency="true" width="100%" height="330" id="fbreg"></iframe>

                </div>

            </div>




        </div><iframe src="about:blank" style="height: 0px; width: 0px; visibility: hidden; border-top-style: none; border-right-style: none; border-bottom-style: none; border-left-style: none; border-width: initial; border-color: initial; ">This frame prevents back/forward cache problems in Safari.</iframe>

        <div id="page-frame-baseline"></div>

        <div id="navigation-background"></div>

        <div id="navigation-ribbon">

            <a href="http://artistmagnet.com/" alt="Artist Magnet home"><img id="logo" src="signup_files/logo.png" alt="Artist Magnet"></a>

        </div>


    </body>
</html>
