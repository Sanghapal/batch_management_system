$(document).ready ->
  $("#combgrade").bind 'change', (e) ->
#    alert $(this).val()
    $.get('/students/' + $(this).val() + '/assign_batch_multiple')