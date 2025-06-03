# config/puma.rb

# Default threads calculation
threads_count = ENV.fetch("RAILS_MAX_THREADS", 3)
threads threads_count, threads_count

# Override for development environment to ensure single thread for async adapter
if Rails.env.development?
  # Set workers to 0 to ensure single-process mode, then 1 thread
  # This is crucial for Action Cable's async adapter with web console or multiple clients
  workers 0
  threads 1, 1
end

# Specifies the `port` that Puma will listen on to receive requests; default is 3000.
# Azure expects the app to listen on 0.0.0.0 and port 8000
port ENV.fetch("PORT", 3000)

# Allow puma to be restarted by `bin/rails restart` command.
plugin :tmp_restart

# Run the Solid Queue supervisor inside of Puma for single-server deployments
plugin :solid_queue if ENV["SOLID_QUEUE_IN_PUMA"]

# Specify the PID file. Defaults to tmp/pids/server.pid in development.
# In other environments, only set the PID file if requested.
pidfile ENV["PIDFILE"] if ENV["PIDFILE"]