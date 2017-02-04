$ ->
  $(document).on "turbolinks:load", ->
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