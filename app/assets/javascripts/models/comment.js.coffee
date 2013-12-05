class Dmtc.Models.Comment extends Backbone.Model
  url: '/comments'

  initialize: (options) ->
    @set 'isOwner', @get('user_id') == Dmtc.Globals.userId

  toJSON: ->
    attrs = _.clone @attributes
    attrs.content = attrs.content.replace("\n", "<br>")
    { comment: attrs }
