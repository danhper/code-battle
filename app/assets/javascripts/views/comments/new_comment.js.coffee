class Dmtc.Views.NewComment extends Backbone.View
  el: '#new-comment'

  events:
    'change #comment-textarea': 'updateModel'
    'click input[type="submit"]': 'postComment'

  initialize: (options) ->
    @resetModel()

  resetModel: ->
    @model = new Dmtc.Models.Comment()

  updateModel: (e) ->
    @model.set 'content', $(e.target).val()

  postComment: (e) ->
    @model.save(
      sucess: () =>
        $('#comment-textarea').val('')
        @resetModel()
    )
