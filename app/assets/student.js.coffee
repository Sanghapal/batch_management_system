$(document).ready ->
  $("#comgrade").change ->
    fees()
$.ajax
  type: "GET"
  url: "/grades/" + $("#comgrade").val() + "/fees"
  dataType: "js"
  success: (fees) ->
    alert"Data save"
#$('.i').parent().parent().hide()
  #$('.v').parent().parent().hide()
#chkFlag= $('.boolean')
#chkFlag.click ->
#  if chkFlag.is(':checked')
    #$('.i').parent().parent().show()
    #$('.v').parent().parent().show()
  #else
#    $('.i').parent().parent().hide()
#    $('.v').parent().parent().hide()