class Dmtc.Models.Comment extends Backbone.Model

  initialize: (options) ->

  toObject: (toBr) ->
    if toBr
      attrs = _.clone @attributes
      attrs.content = attrs.content.replace("\n", "<br>")
    else
      attrs = @attributes
    attrs.isOwner = @get('user_id') == Dmtc.Globals.userId
    { comment: attrs }
