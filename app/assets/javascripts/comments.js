// Generated by CoffeeScript 1.4.0
(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  Dmtc.Collections.Comments = (function(_super) {

    __extends(Comments, _super);

    function Comments() {
      return Comments.__super__.constructor.apply(this, arguments);
    }

    Comments.prototype.model = Dmtc.Models.Comment;

    return Comments;

  })(Backbone.Collection);

}).call(this);
