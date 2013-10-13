class Dmtc.Views.ShowCode extends Backbone.View
  el: '.code-container'

  events:
    'click .like-link': 'likeUnlikeCode'

  initialize: (options) ->
    @setLink()

  setLink: ->
    link = @$('.like-link')
    if @model.get 'liked'
      link.text 'Unlike'
      link.addClass 'liked'
    else
      link.text 'Like'
      link.removeClass 'liked'

  likeSuccess: =>
    @model.set('liked', !@model.get('liked'))
    @setLink()

  likeUnlikeCode: (e) ->
    e.preventDefault()
    method = if @model.get('liked') then 'unlike' else 'like'
    @model[method](
      success: @likeSuccess
    )
    false
