set :application, 'code-battle'
set :repo_url, 'https://github.com/tuvistavie/code-battle.git'
set :branch, :master
set :scm, :git


set :deploy_to, '/home/codebattle/code-battle'

# set :format, :pretty
set :log_level, :info
# set :pty, true

set :linked_files, %w{config/database.yml config/settings/production.local.yml config/settings.local.yml}
# set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

set :default_env, {
  global_gem_home: "/usr/local/rbenv/gems",
  gem_home: "$HOME/.gem",
  gem_path: "$GEM_HOME:$GLOBAL_GEM_HOME",
  path: "$GEM_HOME/bin:$GLOBAL_GEM_HOME/bin:/usr/bin:$PATH",
}
# set :keep_releases, 5

set :rails_env, 'production'

set :bundle_flags, '--deployment'
set :bundle_without, %w{development debug test deployment}.join(' ')
set :bundle_bins, fetch(:bundle_bins).push("whenever")

set :rbenv_type, :system
set :rbenv_ruby, '2.0.0-p353'
set :rbenv_map_bins, %w{rake gem bundle ruby rails}

namespace :deploy do
  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  desc 'Restart websocket'
  after :restart, :restart_websocket do
    on roles(:app), in: :sequence, wait: 3 do
      within release_path do
        if test("[ -f #{release_path}/tmp/pids/websocket_rails.pid ]")
          execute :rake, 'websocket_rails:stop_server'
        end
        execute :rake, 'websocket_rails:start_server'
      end
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

  before :finishing, :wheneverize do
    on roles(:db), in: :sequence do
      within release_path do
        execute :bundle, 'exec', 'whenever', '-w'
      end
    end
  end

  after :finishing, 'deploy:cleanup'

end
