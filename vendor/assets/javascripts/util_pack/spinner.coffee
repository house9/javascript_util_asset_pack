class Spinner
  constructor: (spinnerId) ->
    @spinnerId = spinnerId

  hide: () ->
    jQuery(@spinnerId).hide()    

  setNextTo: (controlID, topOffset = 0, leftOffset = 14) ->
    if controlID?
      $control = jQuery(controlID)
      return null if $control.length is 0

      offset = $control.offset()
      top = parseInt(offset.top + topOffset)
      left = parseInt(offset.left + leftOffset + $control.width())

      # sometimes things are not what they seem, use the parent coordinates if needed
      if left < 0
        left = jQuery(controlID).parent().offset().left + leftOffset
        
      # show spinner
      jQuery(@spinnerId)
        .css('position', 'absolute')
        .css('top', "#{top}px")
        .css('left', "#{left}px  ")
        .show()
        .css('z-index', 33010)

window.Util ?= {}
window.Util.spinner = new Spinner('#spinner')

