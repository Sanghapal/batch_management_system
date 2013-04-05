$(document).ready ->
  $("#combgrade").bind 'change', (e) ->
    $.get('/students/' + $(this).val() + '/assign_batch_multiple')

  $('#student_country_id').select2()
  $('#student_state_id').select2()
  $('#student_city_id').select2()
