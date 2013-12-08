Handlebars.registerHelper 't', (key, options={}) ->
  I18n.t key, options.hash
