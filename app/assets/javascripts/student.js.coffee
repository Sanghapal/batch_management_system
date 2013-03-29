$(document).ready ->
  $("#combgrade").bind 'change', (e) ->
    alert $(this).val()
#    $.get('/student/' + $(this).val() + '/city')