$(function() {

  "use strict";

  // Fix height
  var winHeight = $(window).innerHeight();
  var docHeight = $(document).height();
  if(winHeight > docHeight) {
    docHeight = winHeight;
  }
  $("#sidebar").css('min-height', docHeight-80);
  $("#content").css('min-height', docHeight-80);

  // Show sidebar submenu
  $(".has-submenu").click(function(e) {
    //$(this).toggleClass("active");
//    $('.sidebar-group li').removeClass('active');
//    $(this).closest('li').addClass('active');
  });

  // Collapse sidebar
  $("#make-compact").click(function(e) {
    e.preventDefault();
    $("body").toggleClass("compact-sidebar");
  });

  // Toggle menu on mobile
  $("#toggle-menu").click(function(e) {
    e.preventDefault();
    $("body").removeClass("compact-sidebar");
    $("body").toggleClass("show-menu");
  });

  $("#hide-menu").click(function(e) {
    e.preventDefault();
    $("body").removeClass("compact-sidebar");
    $("body").removeClass("show-menu");
  });

  // Compact sidebar on mobiles fix
  $(window).resize(function(){  
    if ($("#make-compact").css("display") == "none" ){
      $("body").removeClass("compact-sidebar");
    }
  });

  // Custom scrollbar
  $('.scrollbox').enscroll({
    verticalTrackClass: 'scrollbar-track',
    verticalHandleClass: 'scrollbar-handle'
  });

  // Footable plugin
  $('.footable').footable();

  // Custom checkbox
  $('input.icheck').iCheck({
    checkboxClass: 'icheckbox_minimal',
    radioClass: 'iradio_minimal',
    increaseArea: '20%'
  });

})

//Add more fields
jQuery(document).ready(function($){
    $('.my-form .add-box').click(function(){
        var n = $('.text-box').length + 1;
        var box_html = $('<p class="text-box"><label for="box' + n + '">Email <span class="box-number">' + n + '</span></label> <input type="text" name="email[]"  value="" id="box' + n + '" /> <a href="#" class="remove-box">Remove</a></p>');
        box_html.hide();
        $('.my-form p.text-box:last').after(box_html);
        box_html.fadeIn('slow');
        return false;
    });

    $('.my-form').on('click', '.remove-box', function(){
    $(this).parent().css( 'background-color', '#FF6C6C' );
    $(this).parent().fadeOut("slow", function() {
        $(this).remove();
        $('.box-number').each(function(index){
            $(this).text( index + 1 );
        });
    });
    return false;
});
});

function printpage()
{
  window.print()
}

  