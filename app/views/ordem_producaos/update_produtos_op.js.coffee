console.log('ok')
$(".produtos").empty()
  .append("<%= escape_javascript(render(:partial => @produtos)) %>")
    