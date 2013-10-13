class Dmtc.Views.GuildView extends Backbone.View
  events:
    'click .enter-link': 'enterGuild'
    'click .leave-link': 'leaveGuild'

  initialize: (options) ->
    @setLink()

  setLink: ->
    link = @$('.enter-leave-link')
    if @model.get 'inGuild'
      link.text 'Leave'
      link.addClass 'leave-link'
      link.removeClass 'enter-link'
    else
      link.text 'Enter'
      link.addClass 'enter-link'
      link.removeClass 'leave-link'

  enterLeaveSuccess: =>
    @model.set('inGuild', !@model.get('inGuild'))
    @setLink()


  enterGuild: (e) ->
    @model.enter(
      success: @enterLeaveSuccess
    )
    false

  leaveGuild: (e) ->
    @model.leave(
      success: @enterLeaveSuccess
    )
    false
