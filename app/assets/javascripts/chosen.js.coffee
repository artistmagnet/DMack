$ ->
  # enable chosen js using gem 'rails-chosen'
#  $('.chosen-select').chosen
#    allow_single_deselect: true
#    inherit_select_classes: true
#    no_results_text: ' not found.'
##    no_results_links: [{"text":"To add it as a new Production, click here", "classes": "add_prod", "href": "#"},
##      {"text":"To leave as text only, click here.", "classes": "add_text", "href": "#"} ]
##    some_results_links: [{"text":"To add it as a new Production, click here", "classes": "add_prod", "href": "#"}]
#    width: '382px'

  $select = $('#role_production_id')
  $add_as_new = $select.data("add-as-new-label")
  $add_as_text= $select.data("add-as-text-label")
  $select.chosen
    allow_single_deselect: true
    inherit_select_classes: true
    no_results_text: ' not found.'
    no_results_links: [{"text":$add_as_new, "classes": "add_new", "href": "#"},
      {"text":$add_as_text, "classes": "add_text", "href": "#"} ]
    some_results_links: [{"text":$add_as_new, "classes": "add_new", "href": "#"}]
    width: '382px'

#  $("#role_production_id" + "_chosen").change (e) ->
#    console.log(e)
#    alert('p')

  $("#role_production_id").on 'chosen:no_results', (e) ->
#    console.log(e)
#    alert('no res')


  $("#role_production_id").on 'chosen:results', (e) ->
    new_name = $("#role_production_id" + "_chosen").find(".chosen-search>input").val()
    $add_link = $("#role_production_id" + "_chosen").find(".add_new>a")
    $add_link.click ->
      $('#add-resume-production').find('#production_name').val(new_name)
      popupModal('#add-resume-production')


#  $("#role_production_id" + "_chosen").find("a.add_new").click ->
#    alert('addolo?')


  $('.chosen-multiple-select').chosen
    no_results_text: ' not found.'
    width: '382px'
    placeholder_text_multiple: "Start typing..."


popupModal = (selector) ->
  $(selector + ' + .fade').height($(document).height()).show()
  $(selector).show()

