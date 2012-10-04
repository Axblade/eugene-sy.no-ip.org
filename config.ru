dir = File.dirname(File.expand_path(__FILE__))

require "#{dir}/lib/server"
require "#{dir}/lib/config"

use Rack::ShowExceptions
run App::Server.new