class Dmtc.Models.Comment extends Backbone.Model
  url: '/comments'

  toJSON: -> comment: _.clone @attributes
