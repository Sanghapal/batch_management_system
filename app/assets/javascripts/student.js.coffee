$(document).ready ->
  $('.i').parent().parent().hide()
  $('.v').parent().parent().hide()
chkFlag= $('.boolean')
chkFlag.click ->
  if chkFlag.is(':checked')
    $('.i').parent().parent().show()
    $('.v').parent().parent().show()
  else
    $('.i').parent().parent().hide()
    $('.v').parent().parent().hide()