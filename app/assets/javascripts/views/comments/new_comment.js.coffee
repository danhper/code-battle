class Dmtc.Views.NewComment extends Backbone.View
  el: '#new-comment'

  events:
    'change #comment-textarea': 'updateModel'
    'keyup  #comment-textarea': 'updateModel'
    'click .comment-post': 'postComment'

  initialize: (options) ->
    @resetModel()

  resetModel: ->
    @model = new Dmtc.Models.Comment({}, collection: @options.comments)

  updateModel: (e) ->
    @model.set 'content', $(e.target).val()

  postComment: (e) ->
    return unless @model.get('content')?.length > 1
    @model.set 'code_id', @options.codeId
    @model.save({},
      success: (model, response, options) =>
        @options.comments.add model
        $('#comment-textarea').val('')
        @resetModel()
    )
