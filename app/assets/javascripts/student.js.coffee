$(document).ready ->
  $("#combgrade").bind 'change', (e) ->
    $.get('/students/' + $(this).val() + '/assign_batch_multiple')

