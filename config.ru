dir = File.dirname(File.expand_path(__FILE__))

require "#{dir}/lib/server"
require "#{dir}/lib/config"

run Sinatra::Application