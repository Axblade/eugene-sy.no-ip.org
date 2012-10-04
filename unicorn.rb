worker_processes 4
working_directory "/home/site/eugene_sy_no_ip_org"
listen 'unix:/tmp/basic.sock', :backlog => 512
timeout 30
pid "tmp/unicorn.pid"

preload_app true
if GC.respond_to?(:copy_on_write_friendly=)
  GC.copy_on_write_friendly = true
end

before_fork do |server, worker|
  old_pid = "#{server.config[:pid]}.oldbin"
  if File.exists?(old_pid) && server.pid != old_pid
    begin
      Process.kill("QUIT", File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
      # someone else did our job for us
    end
  end
end