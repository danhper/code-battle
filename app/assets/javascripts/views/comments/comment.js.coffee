class Dmtc.Views.Comment extends Backbone.View
  template: JST['comments/comment']
  editTemplate: JST['comments/edit']

  initialize: (options) ->

  events:
    'click .edit'   : 'startEditing'
    'click .delete' : 'removeComment'
    'click .cancel' : 'render'
    'click .save'   : 'saveComment'

  saveComment: (e) ->
    e.preventDefault()
    @model.set 'content', @$('.edit-area').val()
    @model.save({},
      success: =>
        @render()
    )

  removeComment: (e) ->
    e.preventDefault()
    if confirm I18n.t('comment.confirm_delete')
      @model.destroy(
        success: =>
          @trigger 'removed'
          @remove()
      )

  startEditing: (e) ->
    e.preventDefault()
    @$el.html @editTemplate(@model.toObject(false))

  render: ->
    @$el.html @template(@model.toObject())
    this
