<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<c:url value="/logout" var="logoutUrl"/>

<!DOCTYPE html>

<html>
<head>
    <title></title>
    <meta charset="">
    <link rel="stylesheet" media="screen" href="styles/main.css">
    <link rel="shortcut icon" type="image/png" href="images/favicon.png">
    <script src="javascripts/jquery-1.6.min.js" type="text/javascript" charset=""></script>

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
        <span id="logged-in" style="vertical-align: top; line-height: 33px; font-size: 0.8em;">sdfasdfasdf | <a
                href="${logoutUrl}" style="vertical-align: top;">Logout</a></span>
    </div>
    <div id="page-content">
        Welcome
    </div>
</div>
<div id="page-frame-baseline"></div>
<div id="navigation-background"></div>
<div id="navigation-ribbon">
    <a href="/" alt="Artist Magnet home"><img id="logo" src="images/logo.png" alt="Artist Magnet"/></a>
</div>
</body>
</html> 
