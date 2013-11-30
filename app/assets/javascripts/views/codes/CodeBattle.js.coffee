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

  getOpponent: (battleData) ->
    users = battleData.users
    _.find users, (u) =>
      u.id != @userId

  initializeConnection: (battleData) ->
    console.log battleData
    @battleChannel = @dispatcher.subscribe(battleData.token)
    @battleChannel.bind 'new_user', (battleData) =>
      @handleNewUser battleData
    @battleChannel.bind 'code_updated', (battleData) =>
      @handleCodeUpdated battleData
    @setTexts battleData

  setTexts: (battleData) ->
    @setOponentText battleData

  handleNewUser: (battleData) ->
    console.log battleData
    @setOponentText battleData

  setOponentText: (battleData) ->
    opponent = @getOpponent battleData
    if opponent?
      @setText opponent, '.enemy-code'

  setText: (user, selector) ->
    @$(selector).attr 'data-id', user.id
    @$(selector).find('.username').text(user.username)

  handleConnectionError: (error) ->
    console.log error

  handleCodeUpdated: (data) ->
    console.log data
    return if data.id == @userId
    @$(".code[data-id=#{data.id}] > textarea").text data.code

  updateCode: (e) ->
    data =
      id  : @userId
      code: $(e.target).val()
    @battleChannel.trigger 'code_updated', data
