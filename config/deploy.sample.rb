set :rvm_ruby_string, 'default'
require "rvm/capistrano"

set :application, "blog.caseyscarborough.com"
set :user, "username"
 
set :port, 22
set :deploy_to, "/var/www/#{application}"
set :deploy_via, :copy
set :use_sudo, false
 
set :scm, :git
set :repository, "/path/to/git/repository"
set :branch, "master"

role :web, "123.456.7.890"
role :app, "123.456.7.890"
role :db,  "123.456.7.890", :primary => true
role :db,  "123.456.7.890"

after "deploy:create_symlink" do
  run "rm -rf #{release_path}/config"
  run "rm #{release_path}/Capfile"
  run "cd #{release_path} && mkdir _site && jekyll build"
end