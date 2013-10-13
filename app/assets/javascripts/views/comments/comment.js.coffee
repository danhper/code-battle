class Dmtc.Views.Comment extends Backbone.View
  template: JST['comments/comment']

  initialize: (options) ->

  render: ->
    @$el.html @template(@model.toJSON())
    this
