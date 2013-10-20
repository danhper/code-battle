class Dmtc.Views.ShowCode extends Backbone.View
  el: '.code'

  events:
    'click .plusone': 'likeUnlikeCode'

  initialize: (options) ->
    @setLikesNumber()

  setLikesNumber: ->
    @$('.plusone-result').text @model.get('likes_count')
    if @model.get('liked')
      @$('.plusone').addClass 'liked'
    else
      @$('.plusone').removeClass 'liked'


  likeSuccess: =>
    if @model.get 'liked'
      @model.set 'liked', false
      @model.set 'likes_count', @model.get('likes_count') - 1
    else
      @model.set 'liked', true
      @model.set 'likes_count', @model.get('likes_count') + 1
    @setLikesNumber()

  likeUnlikeCode: (e) ->
    e.preventDefault()
    method = if @model.get('liked') then 'unlike' else 'like'
    @model[method](
      success: @likeSuccess
    )
    false
