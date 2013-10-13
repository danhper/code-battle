class Dmtc.Views.GuildsIndex extends Backbone.View
  el: '.guilds'

  initialize: (options) ->
    @initSubViews()

  initSubViews: ->
    @$('.guild').each ->
      model = new Dmtc.Models.Guild($(this).data())
      new Dmtc.Views.GuildView({ el: this, model: model })
