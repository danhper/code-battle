class Dmtc.Models.Guild extends Backbone.Model
  url: '/guilds'

  initialize: (attributes, options) ->
    @set 'inGuild', attributes.inGuild

  toJSON: -> guild: _.clone @attributes

  enter: (options) ->
    options ?= {}
    options.url = "#{@url}/#{@get 'urlSafeName'}/enter"
    Backbone.sync 'create', this, options

  leave: (options) ->
    options ?= {}
    options.url = "#{@url}/#{@get 'urlSafeName'}/leave"
    Backbone.sync 'delete', this, options
