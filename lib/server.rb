require 'sinatra'
require 'sinatra/assetpack'
require './lib/tags'

module WebSite
  class Server < Sinatra::Base
  
    # mixins and module registration
    include WebSite::Tags
  
    register Sinatra::AssetPack

    # sinatra properties set up
    dir = File.dirname(File.expand_path(__FILE__))
    set :root, "#{dir}/../app"
    set :views, Proc.new { File.join(root,"views") }
    set :public_folder, Proc.new { File.join(root,"../public") }
    
    enable :static
    enable :sessions
    
    # assets configuration
    assets do
      css_compression :sass
      js_compression :uglify
    
      serve 'js', from: 'js'
      serve '/css', from: 'css'
      serve '/img', from: 'img'
    end
    
    # routing
    get '/' do
      @image ||= WebSite.img_url
      erb :index
    end

    get '/*' do
    	redirect '/'
    end
  
  end
end
