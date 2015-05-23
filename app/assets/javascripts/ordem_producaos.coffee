# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $(document).on 'change', '#tipo', (evt) ->
    $.ajax 'update_produtos_op',
      type: 'GET'
      dataType: 'script'
      data: {
        tipo_id: $("#tipo option:selected").val();
        cliente_id: $("#cliente option:selected").val();
      }
      error: (jqXHR, textStatus, errorThrown) ->
        console.log("AJAX Error: #{textStatus}")
      success: (data, textStatus, jqXHR) ->
        console.log('ok')       
       
