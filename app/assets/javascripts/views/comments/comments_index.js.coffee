class Dmtc.Views.CommentsIndex extends Backbone.View
  el: '#comment-others-container'

  initialize: (options) ->
    _.bindAll this, 'addOne', 'addAll'
    @collection.on 'reset', @addAll, this
    @collection.on 'add', @addOne, this
    @collection.on 'add', @setTitle, this
    @collection.on 'remove', @setTitle, this
    @title = @$('.comment-title')
    @render()

  setTitle: ->
    @title.text I18n.t('comment.count', {count: @collection.length })

  addOne: (model) ->
    view = new Dmtc.Views.Comment({ model: model })
    @$el.find('.container').prepend view.render().$el

  addAll: ->
    @collection.each @addOne

  render: ->
    @$el.find('.container').empty()
    @addAll()
