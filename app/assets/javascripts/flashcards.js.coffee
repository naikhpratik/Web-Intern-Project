$ ->
  $(document).on 'click', '.flashcard-item-view', (e) ->
    front = $(this).children().first()
    back = $(this).children().last()

    if front.hasClass('hidden')
      back.addClass('hidden')
      front.removeClass('hidden')
    else
      front.addClass('hidden')
      back.removeClass('hidden')

    return
