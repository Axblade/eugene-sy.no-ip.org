require 'sinatra/base'
require 'sinatra/assetpack'

module App
  class Server < Sinatra::Base

    dir = File.dirname(File.expand_path(__FILE__))
    set :root, "#{dir}/../app"
    set :views, Proc.new { File.join(root,"views") }
    set :public_folder, Proc.new { File.join(root,"../public") }

    enable :static
    enable :sessions

    register Sinatra::AssetPack

    assets do
      css_compression :sass
      js_compression :uglify

      serve '/js', from: '/app/javascripts'
      serve '/css', from: '/app/css'
      serve '/images', from: '/app/images'
    end

    get '/' do
      erb :index
    end

    get '/*' do
      redirect '/'
    end

  end
end