require 'sinatra/assetpack'
require './lib/tags'

dir = File.dirname(File.expand_path(__FILE__))
set :root, "#{dir}/../app"
set :views, Proc.new { File.join(root,"views") }
set :public_folder, Proc.new { File.join(root,"../public") }

enable :static
enable :sessions

include ::Tag

assets do
  css_compression :sass
  js_compression :uglify

  serve '/js', from: '/js'
  serve '/css', from: '/css'
  serve '/img', from: '/img'
end

get '/' do
  @image ||= IMAGE_URL
  erb :index
end
