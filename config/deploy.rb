set :application, 'C3suite_server'
set :repo_url, 'git@github.com:Code3Apps/C3suite_server.git'

set :user, 'deploy'

set :branch, 'master'

set :deploy_to, "/home/#{fetch(:user)}/#{fetch(:application)}"

set :scm, :git

set :format, :pretty

set :log_level, :debug

set :pty, true

set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')

# Default value for linked_dirs is []
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
set :keep_releases, 5

set :rvm_path, '~/.rvm'
set :rvm_type, :user
set :rvm_ruby_version, '2.3.0'

namespace :deploy do


  rvm_prefix = "#{fetch(:rvm_path)}/bin/rvm #{fetch(:rvm_ruby_version)} do"
  SSHKit.config.command_map[:unicorn] =  "#{rvm_prefix} /etc/init.d/unicorn_#{fetch(:application)}"

  desc "Seeding Database with necassary data"
  task :seed do
    on primary :db do
      within current_path do
        with rails_env: fetch(:stage) do
          execute :rake, 'db:seed'
        end
      end
    end
  end

  %w[start stop restart upgrade].each do |command|
    desc "#{command}s unicorn server"
    task command do
      on roles(:app) do |server|
        execute :unicorn, command
      end
    end
  end

  task :stopstart do
    desc "restarts unicorn server with stop then start commands"
    on roles(:app) do |server|
      execute :unicorn, 'stop'
      execute :unicorn, 'start'
    end
  end

  desc "symlinks web and app server configuration"
  task :setup_config do
    on roles(:app, :web) do |host|
      execute "sudo ln -nfs #{current_path}/config/nginx.conf /etc/nginx/sites-enabled/#{fetch(:application)}"
      execute "sudo ln -nfs #{current_path}/config/unicorn_init.sh /etc/init.d/unicorn_#{fetch(:application)}"
    end
  end

  desc 'check for config files in place on server'
  task :check_symlinks do
    on roles(:app, :web) do
      unless test("[ -f /etc/nginx/sites-enabled/#{fetch(:application)} ]")
        invoke "deploy:setup_config"
      end
    end
  end

  after :publishing, :stopstart
  before :check, :setup_config
  after :starting, :check_symlinks

end


#require 'airbrake/capistrano3'
#after "deploy:finished", "airbrake:deploy"


namespace :rails do
  desc 'Open a rails console `cap [staging] rails:console [server_index default: 0]`'
  task :console do
    server = roles(:app)[ARGV[2].to_i]

    puts "Opening a console on: #{server.hostname}…."

    cmd = "ssh #{server.user}@#{server.hostname} -t 'cd #{fetch(:deploy_to)}/current && RAILS_ENV=#{fetch(:rails_env)} bundle exec rails console'"

    puts cmd

    exec cmd
  end

  desc 'Open ssh `cap [staging] ssh [server_index default: 0]`'
  task :ssh do
    server = roles(:app)[ARGV[2].to_i]

    puts "Opening a console on: #{server.hostname}…."

    cmd = "ssh #{server.user}@#{server.hostname}"

    puts cmd

    exec cmd
  end

end