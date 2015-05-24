# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->

  $.rails.allowAction = (link) ->
    if !link.attr('data-confirm')
      return true
    $.rails.showConfirmDialog link
    false

  $.rails.confirmed = (link) ->
    window.location.href = link.attr('href')

  $.rails.showConfirmDialog = (link) ->
    $dialog = undefined
    $html = undefined
    html = undefined
    message = undefined
    html = undefined
    message = undefined
    message = link.attr('data-confirm')
    html = '<div class="modal fade" id="confirmationDialog">\n  <div class="modal-dialog">\n    <div class="modal-content">\n        <div class="modal-body">\n         \n        <h4 style="text-align: center"> ' + message + '</h4>\n    </div>\n\n      <div class="modal-footer">\n        <a data-dismiss="modal" class="btn  btn-default btn-flat pull-left">Cancelar</a>\n        <a data-dismiss="modal" class="confirm btn btn-success btn-flat pull-right ">Ok</a>\n      </div>\n    </div>\n  </div>\n</div>'
    $html = $(html)
    $html.modal()
    $dialog = $html.find('.confirm')
    $dialog.on 'click', (a) ->
      $.rails.confirmed link
