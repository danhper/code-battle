class Dmtc.Views.GuildView extends Backbone.View
  userTemplate: JST['users/avatar']

  events:
    'click .enter-link': 'enterGuild'
    'click .leave-link': 'leaveGuild'

  initialize: (options) ->
    @count = parseInt(@$('.user-count').text(), 10)
    @waiting = false
    @setLink()

  setLink: ->
    link = @$('.enter-leave-link')
    if @model.get 'inGuild'
      link.text I18n.t('guild.leave')
      link.addClass 'leave-link'
      link.removeClass 'enter-link'
    else
      link.text I18n.t('guild.enter')
      link.addClass 'enter-link'
      link.removeClass 'leave-link'

  updateCount: ->
    if @model.get 'inGuild'
      @count += 1
    else
      @count -= 1
    @$('.user-count').text @count

  updateIcon: ->
    $usersList = @$('.users-list')
    currentUser = Dmtc.Globals.user
    if @model.get 'inGuild'
      $users = $usersList.children '.user-info'
      if $users.length >= 12
        $users.last().remove()
      $usersList.prepend @userTemplate({ user: currentUser })
    else
      $user = $usersList.find("a.user-info[data-id=#{currentUser.id}]")
      $user.remove()

  enterLeaveSuccess: =>
    @stopWaiting()
    @model.set('inGuild', !@model.get('inGuild'))
    @setLink()
    @updateCount()
    @updateIcon()

  handleError: (e) =>
    @stopWaiting()

  enterGuild: (e) ->
    return if @waiting
    e.preventDefault()
    @startWaiting()
    @model.enter(
      success: @enterLeaveSuccess
      error: @handleError
    )
    false

  leaveGuild: (e) ->
    return if @waiting
    e.preventDefault()
    @startWaiting()
    @model.leave(
      success: @enterLeaveSuccess
      error: @handleError
    )
    false

  startWaiting: ->
    @waiting = true
    link = @$('.enter-leave-link')
    link.addClass 'waiting'
    link.text I18n.t('btn.processing')

  stopWaiting: ->
    @waiting = false
    @$('.enter-leave-link').removeClass 'waiting'
