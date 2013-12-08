class Dmtc.Models.Comment extends Backbone.Model

  initialize: (options) ->
    @set 'isOwner', @get('user_id') == Dmtc.Globals.userId

  toObject: ->
    attrs = _.clone @attributes
    attrs.content = attrs.content.replace("\n", "<br>")
    { comment: attrs }
