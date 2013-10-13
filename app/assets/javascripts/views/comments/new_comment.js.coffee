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
    @model.set 'code_id', @options.codeId
    @model.save({},
      success: (model, response, options) =>
        @options.comments.add model
        $('#comment-textarea').val('')
        @resetModel()
    )
