$ ->
  $(document).on "turbolinks:load", ->
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

    $('#sortable_flashcard_items').sortable({
      containment: 'parent'
      update: (e, ui) ->
        flashcard_item_id = ui.item.data('flashcard-item-id')
        position = ui.item.index()
        $.ajax(
          type: 'GET'
          url: window.location.pathname + '/update_flashcard_item_position'
          dataType: 'json'
          data: { flashcard: { flashcard_items_attributes: [{ id: flashcard_item_id, row_order_position: position }] } }
        )
    })