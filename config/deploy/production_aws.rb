# rbenv setting
require 'capistrano-rbenv'
set :rbenv_ruby_version, '1.9.3-p448'
namespace :rbenv do
  task :setup_shellenv do
    set :default_environment, {
      'RBENV_ROOT' => "#{rbenv_path}",
      'PATH' => "#{rbenv_path}/shims:#{rbenv_path}/bin:$PATH",
    }
  end
  after 'multistage:ensure', 'rbenv:setup_shellenv'
end

set :user, "checkpass"
set :port, 22
set :use_sudo, false
set :default_run_options, :pty=>true
set :rails_env, 'production'
role :web, "aws.evangelize.jp"                       # Your HTTP server, Apache/etc
role :app, "aws.evangelize.jp"                       # This may be the same as your `Web` server
role :db,  "aws.evangelize.jp", :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"

set :deploy_to, "/home/checkpass/checkpass_production"

# hot deployを利用するため unicorn:restartを指定
after 'deploy:restart', 'unicorn:restart' 

