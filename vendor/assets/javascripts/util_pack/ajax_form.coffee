class AjaxForm
  constructor: (selector) ->
    # TODO: success-callback
    
    log selector

    $(selector).submit (e) ->
      e.preventDefault()
      form = this

      log form

      $.ajax $(form).attr('action'), 
        type: "POST"
        data: $(form).serialize() 
        success: ->
          log "success"

window.Util ?= {}
window.Util.AjaxForm = AjaxForm

