$ ->
  # enable chosen js using gem 'rails-chosen'
  enrichSelect('#role_production_id',                     '#add-resume-production', '#production_name')
  enrichSelect('#production_company_id',                  '#add-company',           '#company_name')
  enrichSelect('#production_shows_attributes_0_venue_id', '#add-venue',             '#venue_name')

enrichSelect = (selectSel, targetScopeSel, targetFieldSel) ->
#  $select = $('#role_production_id')
  $select = $(selectSel)
  $add_as_new = $select.data("add-as-new-label")
  $add_as_text= $select.data("add-as-text-label")
  $select.chosen
    allow_single_deselect: true
    inherit_select_classes: true
    no_results_text: ' not found.'
#    no_results_links: [{"text":$add_as_new, "classes": "add_new", "href": "#"},
#      {"text":$add_as_text, "classes": "add_text", "href": "#"} ]
    no_results_links: [{"text":$add_as_new, "classes": "add_new", "href": "#"}]
    some_results_links: [{"text":$add_as_new, "classes": "add_new", "href": "#"}]
    width: '382px'

  $select.on 'chosen:no_results', (e) ->
#    setAddNewLink('#role_production_id', '#add-resume-production', '#production_name')
    setAddNewLink(selectSel, targetScopeSel, targetFieldSel)

  $select.on 'chosen:results', (e) ->
    setAddNewLink(selectSel, targetScopeSel, targetFieldSel)


  $('.chosen-multiple-select').chosen
    no_results_text: ' not found.'
    width: '382px'
    placeholder_text_multiple: "Start typing..."


popupModal = (selector) ->
  $(selector + ' + .fade').height($(document).height()).show()
  $(selector).show()

#tells the 'add as new' link of the select to open targetScope and populate targetfieldle
setAddNewLink = (selectSel, targetScopeSel, targetFieldSel) ->
  new_name = $(selectSel + "_chosen").find(".chosen-search>input").val()
  $add_link = $(selectSel + "_chosen").find(".add_new>a")
  $add_link.click ->
    $(targetScopeSel).find(targetFieldSel).val(new_name)
    selectChain.push(targetScopeSel)
    popupModal(targetScopeSel)

#tells the 'add text' link of the select to ... ?
#setAddNewLink = (selectSel, targetScopeSel, targetFieldSel) ->
#  new_name = $(selectSel + "_chosen").find(".chosen-search>input").val()
#  $add_link = $(selectSel + "_chosen").find(".add_new>a")
#  $add_link.click ->
#    $(targetScopeSel).find(targetFieldSel).val(new_name)
#    popupModal(targetScopeSel)


selectChain = [];

# CREDIT POPUP

# activation
jQuery ->
  $('#add-resume-role-link').click ->
    selectChain.push('#add-resume-role')
    popupModal('#add-resume-role')

# invalid data
jQuery ->
  $(document).bind "ajaxError", '#add-resume-role', (event, jqxhr, settings, exception) ->
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
    console.log([event.data, selectChain])
    console.log('was res log')
    $entity_form = $(event.data)
    $entity_form_frame = $(event.data.concat(' + .fade'))
    $error_container = $("#error_explanation", $entity_form)
    $error_container_ul = $("ul", $error_container)
    if selectChain.length >= 2 && event.data == selectChain[selectChain.length-2]
      if $("li", $error_container_ul).length
        $("li", $error_container_ul).remove()
    if event.data == selectChain[selectChain.length-1]
      $entity_form.hide()
      $entity_form_frame.hide()
      syncGet($($entity_form).data("reload-url"))


# Child popups

jQuery ->
#  bindAjaxOption('#add-resume',     '#resume_role_production_id','#add-production')
  bindAjaxOption('#add-role',              '#role_production_id',                     '#add-resume-production')
  bindAjaxOption('#add-resume-production', '#production_company_id',                  '#add-company')
  bindAjaxOption('#add-resume-production', '#production_shows_attributes_0_venue_id', '#add-venue')


# Enable adding an option on-the-fly to a select
# PARAMS:
#   origin_form_selector: containing form
#   select_selector:      select to be extended
#   create_form_selector  form for the type of entity listed on the select.

bindAjaxOption = (origin_scope_selector, select_selector, create_scope_selector) ->
  $(select_selector.concat(' + .extend-list')).click (e) ->
    e.preventDefault()
    $(create_scope_selector).show()
    $(create_scope_selector+' + .fade').height($(document).height()).show()
    selectChain.push(create_scope_selector)

  $(document).bind "ajaxSuccess", create_scope_selector, (event, xhr, settings) ->
    console.log([event.data, selectChain])
    if event.data == selectChain[selectChain.length-1]
      $entity_form = $(event.data)
      $entity_form_frame = $(event.data.concat(' + .fade'))
      $error_container = $("#error_explanation", $entity_form)
      $error_container_ul = $("ul", $error_container)
      if $("li", $error_container_ul).length
        $("li", $error_container_ul).remove()
      $entity_form.hide()
      $entity_form_frame.hide()
      entId = xhr.responseJSON.id
      entName = xhr.responseJSON.name
      $select = $(select_selector, $(origin_scope_selector))
      if $select.length
        $select.append(String.concat("<option value=", entId, " selected='selected'>", entName, "</option>"));
        # rerender
        $select.trigger("chosen:updated");
        selectChain.pop()

  $(document).bind "ajaxError", create_scope_selector, (event, jqxhr, settings, exception) ->
    $entity_form = $(event.data)
    if event.data == selectChain[selectChain.length-1]
      $error_container = $("#error_explanation", $entity_form)
      $error_container_ul = $("ul", $error_container)
      $error_container.show()  if $error_container.is(":hidden")
      if $("li", $error_container_ul).length
        $("li", $error_container_ul).remove()
      $.each jqxhr.responseJSON, (index, message) ->
        $("<li>").html(message).appendTo $error_container_ul



syncGet = (url) ->
  alert('calling ' + url)
  window.location.replace(url)
