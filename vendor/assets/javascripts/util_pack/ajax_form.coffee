class AjaxForm
  constructor: (selector, callback = null) ->
    $(selector).submit (e) ->
      e.preventDefault()
      form = this
      success = if callback? then callback else () -> log "no success callback"

      $.ajax $(form).attr('action'), 
        type: "POST"
        data: $(form).serialize() 
        success: success

window.Util ?= {}
window.Util.AjaxForm = AjaxForm

