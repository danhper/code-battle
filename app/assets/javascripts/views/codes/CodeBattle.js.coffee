class Dmtc.Views.CodeBattle extends Backbone.View
  el: '.battle'

  events:
    'keyup .own-code': 'updateCode'

  initialize: (options) ->
    @dispatcher = new WebSocketRails('localhost:3000/websocket')

  updateCode: (e) ->
    data =
      code: $(e.target).text()
    @dispatcher.trigger 'code_updated', data
