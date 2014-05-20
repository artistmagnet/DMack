<!DOCTYPE html>
<html>
    <head>
        <title>Add friend</title>
        <meta charset="">
        <link rel="stylesheet" media="screen" href="styles/main.css">
        <link rel="shortcut icon" type="image/png" href="images/favicon.png">
        <script src="js/jquery-1.6.2.min.js" type="text/javascript" charset=""></script>
        <script src="js/artistmagnet.js" type="text/javascript" charset=""></script>

        <link href='http://fonts.googleapis.com/css?family=Cuprum' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Copse' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Dancing+Script' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>

        <link rel="stylesheet" media="screen" href="http://artistmagnet.com/styles/main.css">
        <link rel="stylesheet" media="screen" href="signup_files/resume.css">
        <link rel="shortcut icon" type="image/png" href="http://artistmagnet.com/images/favicon.png">
        <script src="signup_files/jquery-1.js" type="text/javascript" charset=""></script>

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
                <img class="root-buttons" src="signup_files/button-artists.jpg" alt="artists"/>

                <img class="root-buttons" src="signup_files/button-productions.jpg" alt="productions"/>
                <img class="root-buttons" src="signup_files/button-venues.jpg" alt="venues"/>

            </div>
            <div id="page-content">
                <script type="text/javascript" charset="utf-8">
                    $(function() {
                        $("form input").keypress(function (e) {
                            if ((e.which && e.which == 13) || (e.keyCode && e.keyCode == 13)) {
                                $('input[type=submit].default').click();
                                return false;
                            } else {
                                return true;
                            }
                        });
                    });
                </script>
                <div style="width: 191px; height: 500px; float: left; margin-right: 18px; background: #E2E7EB">
                    <center>Vertical Advertising Space</center>
                </div>

                <div style="width: 600px; float: left;">
                    <div class="register-form shadow">
                        <form id="inviteForm" class="register-form"  action="MyController"  method="POST" accept-charset="utf-8">

			    <input id="action" name="action" type="hidden" value="invite_friend"/>
		
                            <p id="ptitle15">Send Invitations to Artist Magnet. Enter email addresses manually or copy and paste into the box below. Separate multiple addresses with commas.</p>
                            <p>&nbsp;</p>
                            <p id="ptitle4">Send To</p>
                            <textarea name="emailAddresses" cols="72" rows="2" id="inviteEmailAddresses"></textarea><br />
                            <p id="ptitle4">*Separate multiple addresses with commas</p>
                            <p>&nbsp;</p>
                            <p id="ptitle4">Your Message (Optional)</p>
                            <textarea name="message" cols="72" rows="6" id="inviteMessage"></textarea>
                            <br><br>

                            <input style="float: right;" value="Send Invitations" type="submit" id="sendInvite"> 
			   
                            <p>&nbsp;</p>
                            <p id="ptitle15">Invite your Facebook Friends to join Artist Magnet!</p>
                            <div id="fb-root"></div>
                            <script src="http://connect.facebook.net/en_US/all.js"></script>
                            <script>
                                FB.init({
                                    appId : '113869198637480',
                                    status : true, // check login status
                                    cookie : true, // enable cookies to allow the server to access the session
                                    xfbml : true // parse XFBML
                                });
                            </script>
                            </script><fb:send href="www.artistmagnet.com" font=""></fb:send>
                            
                            <input style="float: right;" value="Sign Up" type="submit" id="signUp"> 

                            <div style="height:20px;">&nbsp;</div>
                        </form>
                    </div>

                    <div>&nbsp;</div>
                    <div style="width: 612px; height: 100px; margin-right: 18px; background: #E2E7EB;">
                        <center>Horizontal Advertising Space</center>
                    </div>

                    <div>
                        <p id="ptitle10"><a href="#" id="ptitle10">Site Demo</a> | <a href="#" id="ptitle10">About US</a> | <a href="#" id="ptitle10">Advertise</a> | <a href="#" id="ptitle10">Terms &#38; Policy</a></p>
                        <p id="ptitle10">Copyright &#169; Artist Magnet, LLC.</p>
                    </div>

                </div>

                <div style="clear: both;"></div>

            </div>
        </div>
        <div id="page-frame-baseline"></div>
        <div id="navigation-background"></div>
        <div id="navigation-ribbon">
            <a href="/" alt="Artist Magnet home"><img id="logo" src="signup_files/logo.png" alt="Artist Magnet"/></a>
        </div>
    </body>
</html>
