set :rvm_ruby_string, ENV['GEM_HOME'].gsub(/.*\//,"")
set :rvm_type, :user
require 'rvm/capistrano'
require 'bundler/capistrano'

set :application, "zhaopin"

set :repository, "."
set :scm, :none
set :deploy_via, :copy

# do not use copy cache, because we use scm :none. The none SCM recipy do not implement rsync
#set :copy_cache, true

set :copy_compression, :gzip
set :copy_exclude, ".git/*"
set :copy_dir, "~/tmp"
set :remote_copy_dir, "/tmp"


server "10.0.0.41", :web, :app, :db, :primary => true
ssh_options[:port] = 22
ssh_options[:keys] = "~/.ssh/moodeci/moodeci.pem"

set :user, "ubuntu"
set :group, "ubuntu"
set :deploy_to, "#{File.expand_path('auto_deployment', '~')}"
set :use_sudo, false

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  
  desc "Restart the application"
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end

  desc "Copy the database.yml file into the latest release"
  task :copy_in_database_yml do
    run "cp #{shared_path}/config/database.yml #{latest_release}/config/"
  end

  desc "Will create database if not exists"
  task :prepare_database  do
    db_name = "capability_db"
    username = "capability_usr"
    password = "capability_db_user_password"
    source_host = "localhost"
    admin_user = "root"
    admin_password = "fos_db_boss"
    run %Q|mysql -u#{admin_user} -p#{admin_password} -e "CREATE DATABASE IF NOT EXISTS #{db_name} DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci"|
    run %Q|mysql -u#{admin_user} -p#{admin_password} -e "GRANT ALL PRIVILEGES ON #{db_name}.* TO '#{username}'@'#{source_host}' IDENTIFIED BY '#{password}'"|
  end
end

#currently we have database.yml in git repo, will move it out later
#before "deploy:assets:precompile", "deploy:copy_in_database_yml"
before 'deploy:setup', 'rvm:install_ruby'
before 'deploy:migrate', 'deploy:prepare_database'