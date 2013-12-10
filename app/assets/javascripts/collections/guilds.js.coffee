class Dmtc.Collections.Guilds extends Backbone.Collection
  @colors:
    php:        "#5969a5"
    python:     "#356b95"
    ruby:       "#a91b0b"
    perl:       "#004165"
    haskell:    "#656565"
    scala:      "#c81d00"
    java:       "#c35e00"
    c:          "#4d4d4d"
    cpp:        "#4d4d4d"
    csharp:     "#4d4d4d"
    js:         "#01969a"
    lisp:       "#7614b1"
    objectivec: "#4d4d4d"
    ocaml:      "#bf9a0e"
    pascal:     "#4d4d4d"

  model: Dmtc.Models.Guild

  getStatsData: ->
    @map (guild) ->
      [guild.get('name'), guild.get('codes_count')]

  statsColors: ->
    @map (guild) =>
      @constructor.colors[guild.get 'url_safe_name']

  getLikedData: ->
    @map (guild) ->
      [guild.get('name'), guild.get('liked_count')]
