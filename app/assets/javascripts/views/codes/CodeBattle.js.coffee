class Dmtc.Views.CodeBattle extends Backbone.View
  el: '.battle'

  events:
    'keyup .own-code': 'updateCode'

  initialize: (options) ->
    @questId = options.questId
    @dispatcher = new WebSocketRails('localhost:3000/websocket')
    @dispatcher.on_open = (data) =>
      @dispatcher.trigger 'initialize_connection', {
        questId: @questId
      }

  updateCode: (e) ->
    data =
      code: $(e.target).text()
    @dispatcher.trigger 'code_updated', data
