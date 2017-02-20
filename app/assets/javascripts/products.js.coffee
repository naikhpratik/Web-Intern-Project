$ ->
  $(document).on "turbolinks:load", ->
    # declare function to convert default select to select2
    toSelect2 = (item) ->
      $(item).find(".permission_contents_field > select").select2({
        theme: "bootstrap",
        placeholder: "Add Permitted Contents"
      });

    # for newly added items
    $(document).on 'cocoon:after-insert', (e, item) ->
      toSelect2(item)

    # for existing items
    toSelect2(document)

    .select2({
      theme: "bootstrap",
      placeholder: "Select Permitted Contents"
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