# frozen_string_literal: true
APP_DIR = File.expand_path('../../..', __FILE__)
USER = 'app'
GROUP = 'app'

worker_processes ENV['UNICORN_WORKER_PROCESSES'] || 4
working_directory APP_DIR
user USER, GROUP

listen 3000, tcp_nopush: true
listen "#{APP_DIR}/tmp/sockets/unicorn.sock"
pid "#{APP_DIR}/tmp/pids/unicorn.pid"

timeout ENV['UNICORN_TIMEOUT'] || 600
preload_app true

stdout_path "#{APP_DIR}/log/unicorn_stdout.log"
stderr_path "#{APP_DIR}/log/unicorn_stderr.log"

GC.respond_to?(:copy_on_write_friendly=) && (GC.copy_on_write_friendly = true)

before_exec do |_server|
  ENV['BUNDLE_GEMFILE'] = "#{APP_DIR}/Gemfile"
end

before_fork do |server, worker|
  defined?(ActiveRecord::Base) && ActiveRecord::Base.connection.disconnect!

  old_pid = "#{server.config[:pid]}.oldbin"
  if old_pid != server.pid
    begin
      sig = (worker.nr + 1) >= server.worker_processes ? :QUIT : :TTOU
      Process.kill(sig, File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
    end
  end

  sleep 1
end

after_fork do |_server, _worker|
  defined?(ActiveRecord::Base) && ActiveRecord::Base.establish_connection
end
