# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'click', 'form .remove_fieldss', (event) ->
  $(this).prev('input[type=hidden]').val(true)
  $(this).closest('.row').hide()
  event.preventDefault()

$(document).on 'click', 'form .add_fieldss', (event) ->
  time = new Date().getTime()
  regexp = new RegExp($(this).data('id'), 'g')
  $(this).before($(this).data('fields').replace(regexp, time))
  event.preventDefault()
