class Dmtc.Models.Code extends Backbone.Model

  initialize: (attrs, options) ->
    @url = "/quests/#{@get 'quest_id'}/codes"

  toJSON: -> code: _.clone @attributes

  like: (options) ->
    options ?= {}
    options.url = "#{@url}/#{@get 'id'}/like"
    Backbone.sync 'create', this, options

  unlike: (options) ->
    options ?= {}
    options.url = "#{@url}/#{@get 'id'}/unlike"
    Backbone.sync 'delete', this, options
