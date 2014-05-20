$(document).ready(function() {
    var validator = $("#register_form").validate({
        onkeyup: false,  
        onsubmit: false,
        focusInvalid: false,
        focusCleanup: true,
        errorLabelContainer: "#messageBox",
        errorElement: "div",
        highlight: false,
        wrapper: "li",        
        rules: {
            password: {
                required: true,
                minlength: 6
            },
            password_confirm: {
                required: true,
                minlength: 6,
                equalTo: "#password"
            },
            email: {
                required: true,
                email: true,
                remote: "check_email.jsp"
            },
            recaptcha_response_field: {
                required: true
            },
            firstName: {
                required: true
            },
            lastName: {
                required: true
            },
            account: {
                required: true
            },
            birthday_year:{
                required: true
            },
            birthday_month:{
                required: true
            },
            birthday_day:{
                required: true
            }
           
        },
        messages: {
            password: {
                required: "Provide a password!",
                rangelength: jQuery.format("Enter at least {0} characters!")
            },
            password_confirm: {
                required: "Repeat your password!",
                minlength: jQuery.format("Enter at least {0} characters!"),
                equalTo: "Enter the same password as above!"
            },
            email: {
                required: "Enter a valid email address!",
                minlength: "Enter a valid email address!",
                remote: "This email is already in use!"
            },
            recaptcha_response_field: {
                required: "Enter the recaptcha!"
            },
            firstName: {
                required: "First Name is required"
            },
            lastName: {
                required: "Last Name is required"
            },           
            account: {
                required: "Select an account"
            },
            birthday_year:{
                required: "Select a year"
            },
            birthday_month:{
                required: "Select a month"
            },
            birthday_day:{
                required: "Select a day"
            }
            
            
        },
        errorPlacement: function(error, element) {
            if ( element.attr('name') == 'recaptcha_response_field' ) {
                error.appendTo( $('#recaptchastatus') );
            } else {
                error.appendTo( element.parent().next() );
            }
        }
    });
    /*
    jQuery.validator.addMethod("type", function(value, element) {
        if (value == 'NULL') {
            return false;
        }
        return true;
    }, "Please select your type!");
    jQuery.validator.addMethod("country_id", function(value, element) {
        if (value == 'NULL') {
            return false;
        }
        return true;
    }, "Please select your country!");
    jQuery.validator.addMethod("application", function(value, element) {        
        if (value.length > 0) {
            return true;
        }
        return false;
    }, "Please select a file!");
    */
    $("#save_button").click(function() {
        
        
        $.ajax(
        {
            type : 'POST',
            url  : 'check_recaptcha.jsp',
            dataType: 'json',
            data : {
                recaptcha_challenge_field : $("#recaptcha_challenge_field").val(),
                recaptcha_response_field : $("#recaptcha_response_field").val()
            },
            success: function(response) {
                if (response) {
                    if($("#register_form").validate().form()) {
                        $("#register_form").submit();
                    }
                } else {
                    $("#register_form").validate().form();
                    $("#messageBox").show();
                    $("#messageBox").append('<li><div for="recaptcha_response_field" generated="true" class="error" style="display: inline; ">The captcha is wrong! Click on the reload button to load a new captcha and try again!</div></li>');
                }
            }
        });
        
    })
});