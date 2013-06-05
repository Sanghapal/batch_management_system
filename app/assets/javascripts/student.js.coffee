$(document).ready ->
  $('.control-group boolean optional students_addmition_sponsor_flag').parent().parent().parent().hide()

  $("#combgrade").bind 'change', (e) ->
    $.get('/students/' + $(this).val() + '/assign_batch_multiple')

