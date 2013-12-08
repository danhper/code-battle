class Dmtc.Views.Comment extends Backbone.View
  template: JST['comments/comment']

  initialize: (options) ->

  events:
    'click .delete': 'removeComment'

  removeComment: (e) ->
    e.preventDefault()
    if confirm I18n.t('comment.confirm_delete')
      @model.destroy(
        success: (e) =>
          @trigger 'removed'
          @remove()
      )

  render: ->
    @$el.html @template(@model.toObject())
    this
