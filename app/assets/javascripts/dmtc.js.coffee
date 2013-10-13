window.Dmtc =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->

_.mixin({
  nl2br: (str, is_xhtml=false) ->
    breakTag = (is_xhtml || typeof is_xhtml == 'undefined') ? '<br ' + '/>' : '<br>'
    (str + '').replace(/([^>\r\n]?)(\r\n|\n\r|\r|\n)/g, '$1' + breakTag + '$2')
})

$(document).ready ->
  Dmtc.initialize()
