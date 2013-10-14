class Dmtc.Models.CodeVote extends Backbone.Model

  initialize: (attrs, options) ->
    @url = "/quests/#{@get 'quest_id'}/codes"

  toJSON: -> code: _.clone @attributes

  vote: (options) ->
    options ?= {}
    options.url = "#{@url}/#{@get 'id'}/vote"
    Backbone.sync 'create', this, options

  unvote: (options) ->
    options ?= {}
    options.url = "#{@url}/#{@get 'id'}/unvote"
    Backbone.sync 'delete', this, options
