$ ->
  $('label.tree-toggler').click ->
    $(this).parent().children('ul.tree').toggle 300
    return

  $('.selectable').click ->
    destination_selected_id = $(this).attr('id')

    $.ajax
      method: 'GET'
      dataType: "script"
      url: "/"
      data:
        destination_selected: destination_selected_id


  return
