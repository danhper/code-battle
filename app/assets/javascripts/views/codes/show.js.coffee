class Dmtc.Views.ShowCode extends Backbone.View
  el: '.code'

  events:
    'click .plusone': 'likeUnlikeCode'

  initialize: (options) ->
    @setLikesNumber()

  setLikesNumber: ->
    @$('.plusone-result').text @model.get('likes_number')
    if @model.get('liked')
      @$('.plusone-result').addClass 'liked'
    else
      @$('.plusone-result').removeClass 'liked'


  likeSuccess: =>
    if @model.get 'liked'
      @model.set 'liked', false
      @model.set 'likes_number', @model.get('likes_number') - 1
    else
      @model.set 'liked', true
      @model.set 'likes_number', @model.get('likes_number') + 1
    @setLikesNumber()

  likeUnlikeCode: (e) ->
    e.preventDefault()
    method = if @model.get('liked') then 'unlike' else 'like'
    @model[method](
      success: @likeSuccess
    )
    false
