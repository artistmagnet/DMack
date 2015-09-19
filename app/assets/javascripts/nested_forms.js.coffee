jQuery ($) ->
  $('.duplicate_nested_custom_form').click (e) ->
    e.preventDefault()

    lastNestedForm = $('ul.resume_sec').children('div').last();
    newNestedForm  = $('.duplicatable_nested_custom_form').last().clone()

    $( newNestedForm ).insertAfter( lastNestedForm )    

  $('.duplicate_nested_other_form').click (e) ->
    e.preventDefault()
    lastNestedForm = $('ul.resume_sec').children('div').last();
    console.log(lastNestedForm)
    newNestedForm  = $('.duplicatable_nested_other_form').last().clone()
    $( newNestedForm ).insertAfter( lastNestedForm )  