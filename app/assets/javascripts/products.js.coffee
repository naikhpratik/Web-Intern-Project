$ ->
  $(document).on "turbolinks:load", ->
    $("#product_managers_select_field").select2({
      theme: "bootstrap",
      placeholder: "Select Product Managers(s)"
    });

    $('.sortable').sortable({
      containment: 'parent',
      update: (e, ui) ->
        content_id = ui.item.data('content-id')
        position = ui.item.index()
        $.ajax(
          type: 'GET'
          url: '/admin/contents/update_content_position'
          dataType: 'json'
          data: { content: { content_id: content_id, row_order_position: position } }
        )
    })