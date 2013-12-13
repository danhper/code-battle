class Dmtc.Views.GuildView extends Backbone.View
  userTemplate: JST['users/avatar']

  events:
    'click .enter-link': 'enterGuild'
    'click .leave-link': 'leaveGuild'

  initialize: (options) ->
    @count = parseInt(@$('.user-count').text(), 10)
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
    @model.set('inGuild', !@model.get('inGuild'))
    @setLink()
    @updateCount()
    @updateIcon()

  enterGuild: (e) ->
    e.preventDefault()
    @model.enter(
      success: @enterLeaveSuccess
    )
    false

  leaveGuild: (e) ->
    e.preventDefault()
    @model.leave(
      success: @enterLeaveSuccess
    )
    false
