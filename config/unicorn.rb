# ワーカーの数
worker_processes 10

# RAILS_ROOT を指定
working_directory "/home/checkpass/checkpass_production/current/"

# ソケット
listen "/home/checkpass/checkpass_production/shared/tmp/sockets/unicorn.sock"

# PID
pid    "tmp/pids/unicorn.pid"

# Timeout
timeout 30

# ログ
stderr_path "log/unicorn.log"
stdout_path "log/unicorn.log"

# ダウンタイムなくす
preload_app true

before_fork do |server, worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.connection.disconnect!

  old_pid = "#{ server.config[:pid] }.oldbin"
  unless old_pid == server.pid
    begin
      Process.kill :QUIT, File.read(old_pid).to_i
    rescue Errno::ENOENT, Errno::ESRCH
    end
  end
end

after_fork do |server, worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.establish_connection
end

