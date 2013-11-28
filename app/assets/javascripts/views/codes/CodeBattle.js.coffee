class Dmtc.Views.CodeBattle extends Backbone.View
  el: '.battle'

  events:
    'keyup .own-code': 'updateCode'

  initialize: (options) ->
    @questId    = options.questId
    @userId     = options.userId
    @dispatcher = new WebSocketRails('localhost:3000/websocket')
    @dispatcher.on_open = (data) =>
      @dispatcher.trigger 'initialize_connection', {
        questId: @questId
      }, (data)  =>
          @initializeConnection(data)
       , (error) =>
          @handleConnectionError(error)

  initializeConnection: (data) ->
    console.log data
    @battleChannel = @dispatcher.subscribe(data.token)
    @battleChannel.bind 'new_user', (data) =>
      @handleNewUser data
    @battleChannel.bind 'code_updated', (data) =>
      @handleCodeUpdated data

  handleNewUser: (data) ->
    console.log data
    users = data.users
    opponent = _.find users, (u) =>
      u.id != @userId
    if opponent?
      @$('.enemy-name').text(opponent.username)

  handleConnectionError: (error) ->
    console.log error

  handleCodeUpdated: (data) ->
    console.log data

  updateCode: (e) ->
    data =
      code: $(e.target).text()
    @battleChannel.trigger 'code_updated', data
