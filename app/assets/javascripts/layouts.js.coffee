jQuery ->
# Hide sidebar submenu
  $(".has-submenu").click (e) ->
    $(this).toggleClass("active")


#jQuery ->
#  #Allow section movement
#  $('#section_slot').sortable(
#    axis: 'y',
#    update: (event, ui) ->
#      $.post($(this).data('update-url'), $(this).sortable('serialize'));
#  )

jQuery ->
  $("#content").height('100%')
  $('.fade').height($(document).height())

jQuery ->
  $(".semi-mandatory").each () ->
    $(this).append($('<span class="label-hint">').text("*"));

jQuery ->
  $(".mandatory label").each () ->
    $(this).append("*");
