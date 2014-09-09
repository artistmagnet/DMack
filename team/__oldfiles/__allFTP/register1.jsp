<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page import="net.tanesha.recaptcha.ReCaptcha" %>
<%@ page import="net.tanesha.recaptcha.ReCaptchaFactory" %>
<%-- 
    Document   : register
    Created on : Nov 1, 2011, 3:57:20 AM
    Author     : SandorC
--%>

<!DOCTYPE html>
<html><head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>

        <title>Artistmagnet</title>

        <link rel="stylesheet" media="screen" href="styles/main.css">
        <link rel="stylesheet" media="screen" href="styles/fb.css">

        <link rel="shortcut icon" type="image/png" href="http://artistmagnet.com/images/favicon.png">

        <script src="js/jquery-1.6.2.min.js" type="text/javascript" charset=""></script>
        <script src="js/jquery.validate.min.js" type="text/javascript" charset=""></script>

        <script src="js/artistmagnet.js" type="text/javascript" charset=""></script>
        <script src="js/validator.js" type="text/javascript" charset=""></script>



        <link href="./AM signup graphics 9-6-11_files/css" rel="stylesheet" type="text/css">

        <link href="./AM signup graphics 9-6-11_files/css(1)" rel="stylesheet" type="text/css">

        <link href="./AM signup graphics 9-6-11_files/css(2)" rel="stylesheet" type="text/css">

        <link href="./AM signup graphics 9-6-11_files/css(3)" rel="stylesheet" type="text/css">


    <body>
        <!--<div id="cloud">
        
            <div id="twitter-feed">We're first to officially announce open casting call for the highly anticipated new play by <a href="#">@VeronicaSmith</a>. Visit artist space <a href="#">@ArtistMagnet</a> for details.</div>
        
        </div>-->

        <div id="page-frame">
            <div id="page-header">
                <a href="http://artistmagnet.com/artist"><img class="root-buttons" src="./AM signup graphics 9-6-11_files/button-artists.jpg" alt="artists"></a>
                <img class="root-buttons" src="./AM signup graphics 9-6-11_files/button-productions.jpg" alt="productions"/>
                <img class="root-buttons" src="./AM signup graphics 9-6-11_files/button-venues.jpg" alt="venues"/>
            </div>
            <div id="page-content">
                <div class="membership-signup shadow">
                    <form id="register_form" class="membership-signup" action="doRegister.jsp" method="POST" enctype="application/x-www-form-urlencoded" accept-charset="utf-8">

                        <div class="form_row">
                            <label>Email</label>
                            <input id="email" name="email" type="text" value="">
                        </div>



                        <div class="form_row">
                            <label>Birthday</label>
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
                        </div>

                        <div class="form_row">
                            <label>Chosen Password</label>
                            <input id="password" name="password" type="password" value="">
                        </div>


                        <div class="form_row">
                            <label>Password Confirmation</label>
                            <input id="password_confirm" name="password_confirm" type="password" value="">
                        </div>

                        <div class="form_row">
                            <%
                                ReCaptcha c = ReCaptchaFactory.newReCaptcha("6LfSrMkSAAAAADUBG5y1rhhzCZDPmmLD-0Lj-fBC", "6LfSrMkSAAAAAJsOECm7oFhTU-EtkCKX8BWFmbLO", false);
                                out.print(c.createRecaptchaHtml(null, null));
                            %>
                        </div>
                        <div class="form_row">
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

                        </div>

                        

                        <div class="form_row">
                            <input type="button" style="float: right;" value="Sign Up" id="save_button">
                        </div>
                        <div id="messageBox"></div>

                    </form>
                    <iframe src="https://www.facebook.com/plugins/registration.php? client_id=113869198637480& redirect_uri=https%3A%2F%2Fdevelopers.facebook.com%2Ftools%2Fecho%2F& fields=name,birthday,gender,location,email" scrolling="auto" frameborder="no" style="border:none" allowTransparency="true" width="100%" height="330" id="fbreg"></iframe>
                </div>
            </div>
        </div>
        <%--iframe src="about:blank" style="height: 0px; width: 0px; visibility: hidden; border-top-style: none; border-right-style: none; border-bottom-style: none; border-left-style: none; border-width: initial; border-color: initial; ">This frame prevents back/forward cache problems in Safari.</iframe--%>

        <%--div id="page-frame-baseline"></div>
        <div id="navigation-background"></div>
        <div id="navigation-ribbon"--%>
            <a href="http://artistmagnet.com/" alt="Artist Magnet home"><img id="logo" src="./AM signup graphics 9-6-11_files/logo.png" alt="Artist Magnet"></a>
        </div>
    </body>
</html>