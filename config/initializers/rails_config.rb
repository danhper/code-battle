unless defined?(RailsConfig)
  require 'rails_config'
end

RailsConfig.setup do |config|
  config.const_name = "Settings"
end

unless defined?(Settings)
  env = ENV['RAILS_ENV'] || 'production'
  config_dir = File.expand_path('../..', __FILE__)
  config_files = ["settings.local.yml", "settings.yml", "settings/#{env}.yml", "settings/#{env}.local.yml"]
  to_load = config_files.map { |f| File.expand_path(File.join(config_dir, f)) }
  RailsConfig.load_and_set_settings(to_load)
end
