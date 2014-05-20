<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
        <div style="width: 191px; float: left; margin-right: 18px;">
            <form action="<c:url value="/j_spring_security_check" />" method="POST" accept-charset="utf-8"
                  enctype="application/x-www-form-urlencoded"
                  id="signin" class="small"><input type="hidden" name="authenticityToken"
                                                   value="ba0e0e6a3657053de3b64e0d9170f405fa41fcac">

                <p>
                    <label for="email">email</label>
                    <input type="text" name="j_username" value=""/>
                    <span class="error"></span>
                </p>

                <p>
                    <label for="password">password</label>
                    <input type="password" name="j_password"/>

                    <c:choose>
                        <c:when test="${error==true}">
                            <span class="error">The email or password you entered is incorrect. </span>
                        </c:when>
                        <c:otherwise>
                            <span class="error"></span>
                        </c:otherwise>
                    </c:choose>

                </p>

                <table>
                    <tr>
                        <td style="text-align: left;">
                            <input type="button"  class="signup_button" onclick="location.href='signup.htm';" id="signup_button" value="sign up"/>
                        </td>
                        <td style="text-align: right;"><input type="submit" name="signin" id="signin" class="default"
                                                              value="sign in"/></td>
                    </tr>
                </table>


                <p style="text-align: left;">
                    <a href="/signin/reset" alt="reset your password">Forgot password?</a>
                </p>


            </form>
        </div>

        <div style="width: 600px; float: left;">
            <img src="images/banner-pub-company.jpg" alt="Pub Theater Company" height="150" width="600"/>

            <img src="images/banner-artist-place.jpg" alt="Artist Place - The market place for all things theater"
                 height="150" width="600"/>

            <img src="images/banner-sound-eqipment.jpg" alt="SLD Lighting - Sound equipment" height="150" width="600"/>
        </div>

        <div style="clear: both;"></div>
    </div>
</div>
<div id="page-frame-baseline"></div>
<div id="navigation-background"></div>
<div id="navigation-ribbon">
    <a href="/" alt="Artist Magnet home"><img id="logo" src="images/logo.png" alt="Artist Magnet"/></a>
</div>
</body>
</html> 
