class Dmtc.Views.Show2Code extends Backbone.View
  el: '.code-container'

  events:
    'click .vote-link': 'voteUnvoteCode'

  initialize: (options) ->
    @setLink()

  setLink: ->
    link = @$('.vote-link')
    if @model.get 'voted'
      link.text 'Unvote'
      link.addClass 'voted'
    else
      link.text 'Vote'
      link.removeClass 'voted'

  voteSuccess: =>
    @model.set('voted', !@model.get('voted'))
    @setLink()

  voteUnvoteCode: (e) ->
    e.preventDefault()
    method = if @model.get('voted') then 'unvote' else 'vote'
    @model[method](
      success: @voteSuccess
    )
    false
