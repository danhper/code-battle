class Dmtc.Models.Comment extends Backbone.Model
  url: '/comments'

  toJSON: ->
    attrs = _.clone @attributes
    attrs.content = attrs.content.replace("\n", "<br>")
    { comment: attrs }
