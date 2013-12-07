require 'rails_config'

env = ENV['RAILS_ENV'] || 'production'

config_dir = File.expand_path('../..', __FILE__)

config_files = ["database.yml", "settings.local.yml", "settings.yml", "settings/#{env}.yml", "settings/#{env}.local.yml"]
to_load = config_files.map { |f| File.expand_path(File.join(config_dir, f)) }

RailsConfig.load_and_set_settings(to_load)

Backup::Model.new(:db_backup, 'Database Backup to S3') do

  database PostgreSQL do |db|
    db.name               = Settings[env].database
    db.username           = Settings[env].username
    db.password           = Settings[env].password
    db.host               = Settings[env].host
    db.port               = Settings[env].port
    db.skip_tables        = []
  end

  store_with S3 do |s3|
    s3.access_key_id      = Settings.aws.access_key
    s3.secret_access_key  = Settings.aws.secret_key
    s3.region             = Settings.aws.region
    s3.bucket             = Settings.aws.s3.backup_bucket
    s3.path               = Settings[env].database
    s3.keep               = 10
  end

  compress_with Gzip do |compression|
    compression.level = 6
  end

end
