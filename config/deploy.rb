require "bundler/capistrano"
require 'capistrano/ext/multistage'

ssh_options[:keys] = %w('/c/Users/taku/.ssh/id_dsa')

set :application, "Checkpass"
set :repository,  "ssh://git@fbapp.evangelize.jp:1022/home/git/repositories/checkpass.git"

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

set :user, "checkpass"
set :port, 1022
set :use_sudo, false
set :default_run_options, :pty=>true

role :web, "fbapp.evangelize.jp"                       # Your HTTP server, Apache/etc
role :app, "fbapp.evangelize.jp"                       # This may be the same as your `Web` server
role :db,  "fbapp.evangelize.jp", :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"


# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
  namespace :assets do
    task :precompile, :roles => :web, :except => { :no_release => true } do
      from = source.next_revision(current_revision)
      if capture("cd #{latest_release} && #{source.local.log(from)} app/assets/ | wc -l").to_i > 0
        run %Q{cd #{latest_release} && #{rake} RAILS_ENV=#{rails_env} #{asset_env} assets:precompile}
      else
        logger.info "Skipping asset pre-compilation because there were no asset changes"
      end
    end
  end
end

