$ ->
  $(document).on "turbolinks:load", ->

    # Select2
    ## declare function to convert default select to select2
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
    # --------------------------------------------


    # Update roles when user select field changes for "Permission"
    $(document).on 'change', '.user_select_field', (e) ->
      select = $(this)

      if select.val() > 0
        $.ajax
          url: '/admin/users/' + select.val() + '/get_user_roles'
          dataType: 'json'
          type: 'GET'
          success: (data) ->
            field = select.parent('.field').next().find('.user_role_select_field')
            field.empty().append('<option value=>Select Role</option>')

            data.forEach (datum, i) ->
              field.append('<option value=' + datum[0] + '>' + datum[1] + '</option>')

            return
    # --------------------------------------------  


    ### Control contents' access for PM vs all the other roles
    $(document).on 'change', '.user_role_select_field', (e) ->
      select = $('.permission_contents_field > select')

      if $(this).find('option:selected').text() == 'Product Manager'
        # Add new option for "all" contents access
        select.prepend($('<option>', {value: 'all', text: 'All'}));
        
        # remove all the selected options
        select.find('option').attr('selected', false)
        
        # select "all" option
        select.find('option[value="all"]').attr('selected', true)
        
        # disable the options
        select.next().addClass('readonly')
      else
        # remove "all" options as no user besides PM (and admin, ofcourse!) has access to all product contents
        select.find('option[value="all"]').remove()
        select.next().removeClass('readonly')
    ###


    # Make content items sortable
    $('.sortable').sortable({
      # containment: 'parent',
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
    # --------------------------------------------
