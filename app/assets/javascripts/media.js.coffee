$ ->
  $(document).on "turbolinks:load", ->

    $(document).on 'change', '#media_local_type', (e) ->
      val = $(this).find('option:selected').text()
      fields = $('.conditional-field')

      if val == 'Video' || val == 'Audio'
        fields.show()
        fields.removeClass('hidden')
        fields.attr('disabled', false)
      else
        fields.hide()
        fields.attr('disabled', true)