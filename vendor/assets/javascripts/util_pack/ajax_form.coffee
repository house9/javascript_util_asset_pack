class AjaxForm
  constructor: (selector) ->
    # TODO: success-callback

    $(selector).submit (e) ->
      e.preventDefault()
      form = this

      $.ajax ->
        type: "POST"
        url: $(form).attr('action') 
        data: $(form).serialize() 
        success: ->
          console.log("success")

window.Util ?= {}
window.Util.AjaxForm = AjaxForm

