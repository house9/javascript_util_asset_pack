jQuery(document).ajaxError (event, xhr, settings, exception) ->
  baseMessage = "Error: "
  friendly = baseMessage
  local = "#{baseMessage}#{xhr.status}, #{xhr.statusText} #{exception}\n#{settings.url}"
  
  if xhr.status is 404
    friendly = "#{friendly}Page not found"
  else if xhr.status is 422
    friendly = "Your submission has one or more errors. \n\nPlease correct the following issues: \n"
    validationErrors = jQuery.parseJSON(xhr.responseText)
    if jQuery.isArray(validationErrors)
      friendly = friendly + " - #{error}\n" for error in validationErrors
    local = friendly + "\n\n"
  else
    friendly = "#{friendly}an exception has occurred\nPlease try again"

  window.Util.spinner.hide()

  if window.Rails?.env is "DEVELOPMENT"
    contentType = xhr.getResponseHeader("content-type")
    if contentType.indexOf('html') > -1
      body = "<div>#{xhr.responseText}</div>"      
      fragment = $(body).find "h1"
      local = "#{local} \n#{fragment.text()}"
      fragment = $(body).find "pre"
      
      if fragment.length > 0
        fragment.each () -> local = "#{local}\n#{$(this).text()}"

    else
      # json, text, xml, etc... add specific parsing later if needed
      local = "#{local}"
  
    lengthOfVisibleErrorMessage = if local.length > 350 then 350 else local.length
    message = local.substring(0, lengthOfVisibleErrorMessage)
    alert "#{message}...\n\n  - Check browser console for more info.\n  - This message for development only."

  else
    alert friendly
