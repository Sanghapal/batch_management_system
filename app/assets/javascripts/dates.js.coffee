$ ->
  $("input.datepicker").each (i) ->
    $(this).datepicker
      altFormat: "dd-mm-yy"
      dateFormat: "dd/mm/yy"
      changeMonth: true
      changeYear: true
      altField: $(this).next()

