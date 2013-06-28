student_fees = -1
sponsor_fees = -1
batch_duration = -1
$(document).ready ->
  $("#comgrade").change ->
    fees()
  
  #Bind the click event of sponsorship checkbox
  $("#sponsor_required").click (event)->
    if student_fees == -1 && sponsor_fees == -1 && batch_duration == -1
      alert("Please select a grade before continuing")
      event.preventDefault()
    else
      if $("#sponsor_required").is(':checked')
        $("#sponsorship_details").show()
        $("#text_student_fees").val(student_fees * batch_duration)
        $("#text_sponsor_fees").val(sponsor_fees * batch_duration)
      else
        $("#sponsorship_details").hide()
        $("#text_student_fees").val((student_fees + sponsor_fees) * batch_duration)


#Defining the fees function
fees=->
  gr_id = $("#comgrade").val()
  if gr_id ==""
    student_fees = -1
    sponsor_fees = -1
    batch_duration = -1
  else
    ajax_options = 
      type: "GET"
      url: "/grades/" + gr_id + "/fees"
      #dataType: "js"
      success: (fees_details) ->
        eval(fees_details);
        #alert("student fees:"+student_fees+"|Sponsor fees:"+sponsor_fees+"|batch duration"+batch_duration)
        $("#text_student_fees").val((student_fees + sponsor_fees) * batch_duration)
    $.ajax(ajax_options)