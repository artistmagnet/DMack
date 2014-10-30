$ ->
  # enable chosen js using gem 'rails-chosen'
  $('.chosen-select').chosen
    allow_single_deselect: true
    no_results_text: ' not found.'
    no_results_links: [{"text":"To add it as a new Production, click here", "classes": "add_prod", "href": "#"}, {"text":"To leave as text only, click here.", "classes": "add_text", "href": "#"}]
    some_results_links: [{"text":"To add it as a new Production, click here", "classes": "add_prod", "href": "#"}]
    width: '382px'
  $('.chosen-multiple-select').chosen
    no_results_text: ' not found.'
    width: '382px'
    placeholder_text_multiple: "Start typing..."

#jQuery ->
#  csn = $('#resume_role_production_id').data('chosen')
#  console.log(csn)

