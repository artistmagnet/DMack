$(function() {
  console.log('Custom js')
// Hide sidebar submenu
  $(".has-submenu").click(function(e) {
  $(this).toggleClass("active");
  });

})

