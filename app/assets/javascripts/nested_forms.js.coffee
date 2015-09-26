jQuery ($) ->
  $('.duplicate_nested_custom_form').click (e) ->
    e.preventDefault()
    lastNestedForm = $('#sort-section').children().last();
    newNestedForm  = $('.duplicatable_nested_custom_form').first().clone()

    $( newNestedForm ).insertAfter( lastNestedForm ) 
    table = $('table#demo')
    $(table).dragtable
      revert: true
      dragHandle: '.table-handle'
      cursor: 'move'
      dragaccept: '.drag-enable'
      excludeFooter: true


  $('.duplicate_nested_other_form').click (e) ->
    e.preventDefault()
    lastNestedForm = $('#sort-section').children().last();
    console.log(lastNestedForm)
    newNestedForm  = $('.duplicatable_nested_other_form').first().clone()
    $( newNestedForm ).insertAfter( lastNestedForm )
    

  