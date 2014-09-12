# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  $('.extend-company-list').click (e) ->
    e.preventDefault()
    companyForm = $('#add-company')
    openForm(companyForm, selectCompany)

openForm = (form, callback) ->
  $('#new_production').hide()
  form.show()

selectCompany = () ->
  alert('selecting a company')


jQuery ->
  $(document).bind "ajaxSuccess", "form.company_form", (event, xhr, settings) ->
    $company_form = $(event.data)
    $error_container = $("#error_explanation", $company_form)
    $error_container_ul = $("ul", $error_container)
  #  $("<p>").html(xhr.responseJSON.title + " saved.").appendTo $company_form
    if $("li", $error_container_ul).length
      $("li", $error_container_ul).remove()
    $('#add-company').hide()
    $('#new_production').show()
    entId = xhr.responseJSON.id
    entName = xhr.responseJSON.name
    $('#production_company_id').append(String.concat("<option value=", entId, " selected='selected'>", entName, "</option>"));

  $(document).bind "ajaxError", "form.company_form", (event, jqxhr, settings, exception) ->
    $company_form = $(event.data)
    $error_container = $("#error_explanation", $company_form)
    $error_container_ul = $("ul", $error_container)
    $error_container.show()  if $error_container.is(":hidden")
    if $("li", $error_container_ul).length
      $("li", $error_container_ul).remove()
#    alert('jqxhr:' + jqxhr)
    $.each jqxhr.responseJSON, (index, message) ->
      $("<li>").html(message).appendTo $error_container_ul
