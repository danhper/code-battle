class Dmtc.Views.CommentsIndex extends Backbone.View
  el: '#comments'

  initialize: (options) ->
    _.bindAll this, 'addOne', 'addAll'
    @collection.on 'reset', @addAll, this
    @collection.on 'add', @addOne, this
    @render()

  addOne: (model) ->
    view = new Dmtc.Views.Comment({ model: model })
    @$el.find('.container').prepend view.render().$el

  addAll: ->
    @collection.each @addOne

  render: ->
    @$el.find('.container').empty()
    @addAll()
