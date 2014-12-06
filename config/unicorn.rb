@dir = "/home/digital/www_ruby/fedshout/"

# Set the working application directory
# working_directory "/path/to/your/app"
working_directory @dir

# Unicorn PID file location
# pid "/path/to/pids/unicorn.pid"
pid "#{@dir}tmp/pids/unicorn.pid"

# Path to logs
# stderr_path "/path/to/log/unicorn.log"
# stdout_path "/path/to/log/unicorn.log"
stderr_path "#{@dir}log/unicorn.stderr.log"
stdout_path "#{@dir}log/unicorn.stdout.log"

# Unicorn socket
listen "#{@dir}tmp/sockets/unicorn.sock", :backlog => 64
#listen "/tmp/unicorn.myapp.sock"

# Number of processes
# worker_processes 4
worker_processes 2

# Time-out
timeout 30