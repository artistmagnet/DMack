# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
selectChain = [];

jQuery ->
  bindAjaxOption('#add-resume',     '#resume_role_production_id','#add-production')
#  bindAjaxOption('#add-role',       '#role_production_id','#add-production')
  bindAjaxOption('#add-production', '#production_company_id', '#add-company')
  bindAjaxOption('#add-production', '#production_shows_attributes_0_venue_id', '#add-venue')


# Enable adding an option on-the-fly to a select
# PARAMS:
#   origin_form_selector: containing form
#   select_selector:      select to be extended
#   create_form_selector  form for the type of entity listed on the select.

bindAjaxOption = (origin_form_selector, select_selector, create_form_selector) ->
  $(select_selector.concat(' + .extend-list')).click (e) ->
    e.preventDefault()
    $(create_form_selector).show()
    $(create_form_selector+' + .fade').height($(document).height()).show()
    selectChain.push(create_form_selector)

  $(document).bind "ajaxSuccess", create_form_selector, (event, xhr, settings) ->
    if event.data == selectChain[selectChain.length-1]
      $entity_form = $(event.data)
      $entity_form_frame = $(event.data.concat(' + .fade'))
      $error_container = $("#error_explanation", $entity_form)
      $error_container_ul = $("ul", $error_container)
      #  $("<p>").html(xhr.responseJSON.title + " saved.").appendTo $entity_form
      if $("li", $error_container_ul).length
        $("li", $error_container_ul).remove()
      $entity_form.hide()
      $entity_form_frame.hide()
      entId = xhr.responseJSON.id
      entName = xhr.responseJSON.name
      $select = $(select_selector, $(origin_form_selector))
      if $select.length
        $select.append(String.concat("<option value=", entId, " selected='selected'>", entName, "</option>"));
        # rerender
        $select.trigger("chosen:updated");
        selectChain.pop()

  $(document).bind "ajaxError", create_form_selector, (event, jqxhr, settings, exception) ->
    $entity_form = $(event.data)
    if event.data == selectChain[selectChain.length-1]
      $error_container = $("#error_explanation", $entity_form)
      $error_container_ul = $("ul", $error_container)
      $error_container.show()  if $error_container.is(":hidden")
      if $("li", $error_container_ul).length
        $("li", $error_container_ul).remove()
      $.each jqxhr.responseJSON, (index, message) ->
        $("<li>").html(message).appendTo $error_container_ul



# CREDIT POPUP

# activation
jQuery ->
  $('#add-resume-role-link').click ->
    $('#add-resume-role + .fade').height($(document).height()).show()
    $('#add-resume-role').show()

# invalid data
jQuery ->
  $(document).bind "ajaxError", '#add-resume-role', (event, jqxhr, settings, exception) ->
    alert('not saved')
    console.log(event)
    console.log(jqxhr)
    console.log(settings)
    console.log(exception)
    $entity_form = $(event.data)
    $error_container = $("#error_explanation", $entity_form)
    $error_container_ul = $("ul", $error_container)
    $error_container.show()  if $error_container.is(":hidden")
    if $("li", $error_container_ul).length
      $("li", $error_container_ul).remove()
    $.each jqxhr.responseJSON, (index, message) ->
      $("<li>").html(message).appendTo $error_container_ul

# valid data
  $(document).bind "ajaxSuccess", '#add-resume-role', (event, xhr, settings) ->
#    if event.data == selectChain[selectChain.length-1]
    $entity_form = $(event.data)
    $entity_form_frame = $(event.data.concat(' + .fade'))
    $error_container = $("#error_explanation", $entity_form)
    $error_container_ul = $("ul", $error_container)
    if $("li", $error_container_ul).length
      $("li", $error_container_ul).remove()
    $entity_form.hide()
    $entity_form_frame.hide()
    syncGet($($entity_form).data("reload-url"))
#    syncGet('http://localhost:3000/resumes')

#    entId = xhr.responseJSON.id
#    entName = xhr.responseJSON.name
#    $select = $(select_selector, $(origin_form_selector))
#    if $select.length
#      $select.append(String.concat("<option value=", entId, " selected='selected'>", entName, "</option>"));
#      # rerender
#      $select.trigger("chosen:updated");

#      selectChain.pop()

syncGet = (url) ->
  alert('calling ' + url)
  window.location.replace(url)
#  $.ajax url,
#    type: 'GET'
#    async: false