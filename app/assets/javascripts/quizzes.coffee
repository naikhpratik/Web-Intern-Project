$ ->
  $(document).on 'click', '.panel-heading .clickable', (e) ->
    e.preventDefault()
    $this = $(this)
    if !$this.hasClass('panel-collapsed')
      $this.parents('.panel').find('.panel-body').slideUp()
      $this.addClass 'panel-collapsed'
      $this.find('span').removeClass('glyphicon-chevron-up').addClass 'glyphicon-chevron-down'
    else
      $this.parents('.panel').find('.panel-body').slideDown()
      $this.removeClass 'panel-collapsed'
      $this.find('span').removeClass('glyphicon-chevron-down').addClass 'glyphicon-chevron-up'
    return

  $(document).on 'click', 'input[type=radio]', (e) ->
    siblings = $(this).closest('.panel-body').find('.nested-fields, .answers').find('input[type=radio]').not(this)

    siblings.attr('checked', false)
    siblings.val(false)

    $(this).val(true)
    