class Dmtc.Views.CodeVote extends Backbone.View
  el: '#vote-container'

  events:
    'click a': 'voteUnvoteCode'

  initialize: (options) ->
    @setLink()

  setLink: ->
    link = @$('a')
    language = @model.get('guild').url_safe_name
    language = language.charAt(0).toUpperCase() + language.slice(1);
    if @model.get 'voted'
      link.text I18n.t('code.unvote', language: language)
      link.addClass 'voted'
    else
      link.text I18n.t('code.vote_for', language: language)
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
