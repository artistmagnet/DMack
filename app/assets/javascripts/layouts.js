$(function() {
// Hide sidebar submenu
  $(".has-submenu").click(function(e) {
  $(this).toggleClass("active");
  });
});


$(function() {
  //Allow section movement
  $('#section_slot').sortable({
    axis: 'y',
    update: function(event, ui) {
      $.post($(this).data('update-url'), $(this).sortable('serialize'));
    }
  })
});

