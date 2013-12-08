# set :output, "/path/to/my/cron_log.log"

set :backup_file, File.expand_path("../backup/model.rb", __FILE__)

every 1.day do
  command "backup perform --trigger db_backup --config_file #{backup_file} --data-path db --log-path log --tmp-path tmp"
end
