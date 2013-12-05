set :application, 'code-battle'
set :repo_url, 'https://github.com/tuvistavie/code-battle.git'
set :branch, :develop
set :scm, :git

set :deploy_to, '/home/codebattle/code-battle'

# set :format, :pretty
set :log_level, :info
# set :pty, true

set :linked_files, %w{config/database.yml config/settings/production.local.yml}
# set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# set :default_env, { path: "/opt/ruby/bin:$PATH" }
# set :keep_releases, 5

set :rails_env, 'production'

set :bundle_flags, '--deployment'
set :bundle_without, %w{development debug test deployment}.join(' ')

set :rbenv_type, :user
set :rbenv_ruby, '2.0.0-p353'
set :rbenv_map_bins, %w{rake gem bundle ruby rails}

namespace :deploy do
  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

  after :finishing, 'deploy:cleanup'

end
