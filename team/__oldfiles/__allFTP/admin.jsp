<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html><head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Users list</title>

   	<link rel="stylesheet" media="screen" href="styles/main.css">
    <link rel="stylesheet" media="screen" href="styles/fb.css">

    <link rel="shortcut icon" type="image/png" href="images/favicon.png">
    <script src="js/jquery-1.6.2.min.js" type="text/javascript" charset=""></script>
    <script src="js/jquery.validate.min.js" type="text/javascript" charset=""></script>
        
    <script src="js/artistmagnet.js" type="text/javascript" charset=""></script>

    <link href="signup_files/css_003.css" rel="stylesheet" type="text/css">
    <link href="signup_files/css_002.css" rel="stylesheet" type="text/css">
    <link href="signup_files/css_004.css" rel="stylesheet" type="text/css">
    <link href="signup_files/css.css" rel="stylesheet" type="text/css">

</head>
<body>
<div id="page-frame">
    <div id="page-header">
        <img class="root-buttons" src="/images/button-artists.jpg" alt="artists"></a>
        <img class="root-buttons" src="/images/button-productions.jpg" alt="productions">
        <img class="root-buttons" src="/images/button-venues.jpg" alt="venues">
        <span id="logged-in" style="vertical-align: top; line-height: 33px; font-size: 0.8em;">david@artistmagnet.com | <a href="http://artistmagnet.com/logout.htm" style="vertical-align: top;">Logout</a></span>
    </div>

    <div id="page-content">
        <table class="all_users" cellpadding="0" cellspacing="0" style="border-collapse: collapse;">
            <tbody><tr>
                <td>Name</td>
                <td>Email</td>
                <td>Account Type</td>
                <td>BirthDay/Founded Year</td>
                <td>Joined Date</td>
            </tr>
            <tr style="background: #DBE0E4;">
                <td>Lehel Demeter</td>
                <td>le_hee@yahoo.com</td>
                <td>Artist</td>
                <td>Wednesday, April 21, 1982</td>
                <td>Sat Sep 03 13:44:00 CDT 2011</td>
            </tr>
            <tr style="background: white;">
                <td>Colin Chaston</td>
                <td>colin.chaston@gmail.com</td>
                <td>Production/Management</td>
                <td>Wednesday, May 4, 1955</td>
                <td>Sat Sep 03 12:27:14 CDT 2011</td>
            </tr>
        </tbody></table>
        <div class="navigator">
            <a href="http://artistmagnet.com/admin.htm?page=2" title="Next page">
                 <img class="pageNavigator" src="/images/next.jpg">
             </a>
             <img class="pageNavigator" src="/images/previous.jpg">
        </div>
    </div>

</div>

<div id="page-frame-baseline"></div>
<div id="navigation-background"></div>
<div id="navigation-ribbon">
   <a href="http://artistmagnet.com/" alt="Artist Magnet home"><img id="logo" src="/images/logo.png" alt="Artist Magnet"></a>
</div>
</body></html>