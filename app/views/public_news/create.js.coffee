$('<%= escape_javascript(render(:partial => @comment))%>')
.appendTo('#comments')
.hide()
.fadeIn()

$('#new_comment')[0].reset()