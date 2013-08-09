set :user, "checkpass"
set :port, 1022
set :use_sudo, false
set :default_run_options, :pty=>true
set :rails_env, 'test'
role :web, "fbapp.evangelize.jp"                       # Your HTTP server, Apache/etc
role :app, "fbapp.evangelize.jp"                       # This may be the same as your `Web` server
role :db,  "fbapp.evangelize.jp", :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"
set :deploy_to, "/home/checkpass/checkpass_test"
