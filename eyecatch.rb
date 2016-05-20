before_script do
  run '/etc/init.d/postgresql start'
  run 'pip install Pygments '
  run 'cp config/database.yml.example config/database.yml'
  run 'bundle install --deployment --path vendor/bundle'
  run 'bundle exec rake db:migrate:reset'
  run 'bundle exec rake db:seed'
end

window_width 1200

serve 'bundle exec rails s'
port 1337

no_cache true

env 'RAILS_ENV=test'
