class Dmtc.Views.GuildView extends Backbone.View
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

  enterLeaveSuccess: =>
    @model.set('inGuild', !@model.get('inGuild'))
    @setLink()
    @updateCount()


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
