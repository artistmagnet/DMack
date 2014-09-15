# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

#jQuery ->
#  $('.extend-list').click (e) ->
#    e.preventDefault()
#    openForm($('#add-company'))

#openForm = (form) ->
#  $('#new_production').hide()
#  form.show()


jQuery ->
  bindAjaxOption('#add-production', '#production_company_id', '#add-company')
  bindAjaxOption('#add-production', '#production_shows_attributes_0_venue_id', '#add-venue')


bindAjaxOption = (origin_form_selector, select_selector, create_form_selector) ->
  $(select_selector.concat(' + .extend-list')).click (e) ->
    e.preventDefault()
#    openForm($(create_form_selector))
    $(origin_form_selector).hide()
    $(create_form_selector).show()

  $(document).bind "ajaxSuccess", create_form_selector, (event, xhr, settings) ->
    $entity_form = $(event.data)
    if $entity_form.is(':visible')
      $error_container = $("#error_explanation", $entity_form)
      $error_container_ul = $("ul", $error_container)
      #  $("<p>").html(xhr.responseJSON.title + " saved.").appendTo $entity_form
      if $("li", $error_container_ul).length
        $("li", $error_container_ul).remove()
      $entity_form.hide()
      $(origin_form_selector).show()
      entId = xhr.responseJSON.id
      entName = xhr.responseJSON.name
      console.log($entity_form.toSource())
      console.log($(select_selector).toSource())
      $(select_selector).append(String.concat("<option value=", entId, " selected='selected'>", entName, "</option>"));

  $(document).bind "ajaxError", create_form_selector, (event, jqxhr, settings, exception) ->
    $entity_form = $(event.data)
    if $entity_form.is(':visible')
      $error_container = $("#error_explanation", $entity_form)
      $error_container_ul = $("ul", $error_container)
      $error_container.show()  if $error_container.is(":hidden")
      if $("li", $error_container_ul).length
        $("li", $error_container_ul).remove()
      $.each jqxhr.responseJSON, (index, message) ->
        $("<li>").html(message).appendTo $error_container_ul