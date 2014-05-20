<%@page import="com.fxss.artistmagnet.sql.Users"%>


<%

Users usr = (Users) request.getSession().getAttribute("currentUser");
String strFirstName = usr.getFirstName();
String strLastName = usr.getLastName();
String strEmail = usr.getEmail();

String strTag = "";
if ( usr.getAccountTypes().getAccountTypeId() == 1 )   // Artist account
{
	strTag ="ArtistSpace";
}
else if ( usr.getAccountTypes().getAccountTypeId() == 2 )   // Production/Management account
{
	strTag ="ArtistSpace";
}
else if ( usr.getAccountTypes().getAccountTypeId() == 3 )   // Representative account
{
	strTag ="Front Desk";
}
else if ( usr.getAccountTypes().getAccountTypeId() == 4 )   // Fan account
{
	strTag ="FanSpace";
}
else if ( usr.getAccountTypes().getAccountTypeId() == 5 )   // Company account
{
	strTag ="Main Lobby";
}

%>


<!DOCTYPE html>



<html>

<head>

    <title><%=strTag%></title>

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

     <span id="logged-in" style="vertical-align: top; line-height: 33px; font-size: 0.8em;"> <%=strEmail%> | <a

             href="/logout.htm" style="vertical-align: top;">Logout</a></span>

    </div>

    <div id="page-content">

        <div class="welcome_text">

            Welcome, 

            <%=strFirstName%>&nbsp<%=strLastName%>

        </div>

        <div id="left-content">

        </div>

        <div id="center-content">

                <h1>&nbsp;<%=strTag%></h1>

            <div class="menu">


                    <div class="info_board">Welcome to ArtistSpace! Now <a href="build_resume.htm">Build Your First

                        Resume</a> to enter your profile information and connect with your artists, productions and

                        venues!

                    </div>

                <h4 style="font-weight: normal; font-size: 20px; ">Resumes</h4>

                    <div><a href="new_resume.htm">Build New Resume </a></div>

                    <div>ArtistPlace</div>

                    <div>ArtistSearch</div>

                    <div><a href="welcome.htm">ArtistSpace </a></div>

                    <div><a href="ChangeAccountSettings.jsp">Account Settings</a></div>

                    <div>Invite Friends</div>

            </div>



        </div>



    </div>

</div>

<div id="page-frame-baseline"></div>

<div id="navigation-background"></div>

<div id="navigation-ribbon">

    <a href="/" alt="Artist Magnet home"><img id="logo" src="images/logo.png" alt="Artist Magnet"/></a>

</div>

</body>

</html> 

