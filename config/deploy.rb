# config valid only for current version of Capistrano
lock '3.4.0'

set :application, '${diamond-b4}'
set :repo_url, '${git@github.com:sunjewelde/diamond-b4.git}'


# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :branch, 'master'
# set :deploy_to, '/var/www/dev.my_app.com/'
set :deploy_to, '/var/www/app/${diamond-b4}'

# Default value for :scm is :git
set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
set :log_level, :debug

# Default value for :pty is false
set :pty, true

# Default value for :linked_files is []
# set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')

# currentからsharedへsymlinkを貼るものを指定
set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets bundle public/system public/assets}
set :default_env, { path: "/usr/local/rbenv/shims:/usr/local/rbenv/bin:$PATH" }
# set :linked_files, %w{config/database.yml}
# set :linked_dirs, %w{bin bundle log tmp/pids tmp/cache tmp/sockets public/system}

# Default value for linked_dirs is []
# set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
set :keep_releases, 5

namespace :deploy do
  after :finishing, 'deploy:cleanup'
  # desc 'Upload database.yml'
  # task :upload do
  #   on roles(:app) do |host|
  #     if test "[ ! -d #{shared_path}/config ]"
  #       execute "mkdir -p #{shared_path}/config"
  #     end
  #     upload!('config/database.yml', "#{shared_path}/config/database.yml")
  #   end
  # end

  # desc 'Create Database'
  # task :db_create do
  #   on roles(:db) do |host|
  #     with rails_env: fetch(:rails_env) do
  #       within current_path do
  #         execute :bundle, :exec, :rake, 'db:create'
  #     end
  #     end
  #   end
  # end

  # desc 'Restart application'
  # task :restart do
  #   on roles(:app) do
  #     invoke 'unicorn:restart'
  #   end
  # end

  # before :starting, :upload
  # after :publishing, :restart
  # after :restart, :clear_cache do
  #   on roles(:web), in: :groups, limit: 3, wait: 10 do
  #     # Here we can do anything such as:
  #     # within release_path do
  #     #   execute :rake, 'cache:clear'
  #     # end
  #   end
  # end

end
