<!DOCTYPE html>
<html>
<head>
    <title>Change Account Settings</title>
    <meta charset="">
    <link rel="stylesheet" media="screen" href="http://artistmagnet.com/styles/main.css">
    <link rel="shortcut icon" type="image/png" href="images/favicon.png">
    <script src="javascripts/jquery-1.6.min.js" type="text/javascript" charset=""></script>

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

        <a href="/artist"><img class="root-buttons" src="signup_files/button-artists.jpg" alt="artists"/></a>

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
        <div style="width: 191px; height: 910px; float: left; margin-right: 18px; background: #E2E7EB">
        <center></center>
        </div>

        <div style="width: 600px; float: left;">
            <div class="register-form shadow">
				<form id="user" class="register-form" action="register1.htm" method="POST" enctype="application/x-www-form-urlencoded" accept-charset="utf-8">
				
				<table style="width: 100%; border: 0;">
					<tr>
						<td>
							<p id="rname3">Change Account Settings</p>
							<p>&nbsp;</p>
						</td>
					</tr>
					<tr>
						<td>
							<p id="ptitle8">Error no1</p>
							<p id="ptitle8">Error no2</p>
							<br><br>
						</td>
					</tr>
					<tr>
						<td>
							<label style="width: 200px">Stage Name</label>
							<input name="stagename" type="text"  style="width: 150px">
							<br>
						</td>
					</tr>					
					<tr>
						<td>
							<label style="width: 200px">First Name</label>
							<input name="firstname" type="text"  style="width: 150px">
							<br>
						</td>
					</tr>					
					<tr>
						<td>
							<label style="width: 200px">Middle Name</label>
							<input name="middlename" type="text"  style="width: 150px">
							<br>
						</td>
					</tr>
    				<tr>
						<td>
							<label style="width: 200px">Last Name</label>
							<input name="lastname" type="text"  style="width: 150px">
							<br>
						</td>
					</tr>
    				<tr>
						<td>
							<table style="border: 0;">
								<tr>
									<td valign="top" style="width: 130px">
										<label style="width: 200px">Membership Type</label>
									</td>
									<td>
										<input type="radio" name="mtype" value="public"><font id="ptitle4">Artist</font><br>
										<input type="radio" name="mtype" value="public"><font id="ptitle4">Production/Management</font><br>
										<input type="radio" name="mtype" value="public"><font id="ptitle4">Representative</font><br>
										<input type="radio" name="mtype" value="public"><font id="ptitle4">Company</font><br>
										<input type="radio" name="mtype" value="public"><font id="ptitle4">Fan</font>
									</td>
								</tr>
							</table>
							
						</td>
					</tr>					
					<tr>
						<td>
							<p id="note">&nbsp;Note: Your email adress is your login adress as well. Changing your email adress will also change your login credentials. Please enter your current password when changing your email adress or your password.</p>
							<br>
						</td>
					<tr>
    				<tr>
						<td>
							<label style="width: 200px">Email Adress</label>
							<input name="mail" type="text"  style="width: 150px">
							<br>
						</td>
					</tr>
    				<tr>
						<td>
							<label style="width: 200px">Confirm Email Adress</label>
							<input name="cmail" type="text"  style="width: 150px">
							<br>
						</td>
					</tr>
    				<tr>
						<td>
							<label style="width: 200px">Current Password</label>
							<input name="cpass" type="text"  style="width: 150px">
							<br>
						</td>
					</tr>
    				<tr>
						<td>
							<label style="width: 200px">New Password</label>
							<input name="npass" type="text"  style="width: 150px">
							<br>
						</td>
					</tr>
    				<tr>
						<td>
							<label style="width: 200px">Confirm New Password</label>
							<input name="cnpass" type="text"  style="width: 150px">
							<br>
						</td>
					</tr>

					<tr>
						<td>
							<p id="note">&nbsp;If you would like to cancel your account, please click on the <a href="#" id="ptitle12">Cancel Account</a> link. Note that by cancelling your account, all of your data will be deleted and you cannot restore them.</p>
						</td>
					<tr>
						<td style="height: 20px">
						</td>
					</tr>
				</table>			
						
					<div style="height:20px;">&nbsp;</div>
				</form>
			</div>

				<div>&nbsp;</div>
        		
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
