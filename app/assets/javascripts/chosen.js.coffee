$ ->
  # enable chosen js using gem 'rails-chosen'
  $('.chosen-select').chosen
    allow_single_deselect: true
    no_results_text: 'No results matched'
    width: '382px'
  $('.chosen-multiple-select').chosen
    no_results_text: 'No results matched'
    width: '382px'
    placeholder_text_multiple: "Start typing..."

