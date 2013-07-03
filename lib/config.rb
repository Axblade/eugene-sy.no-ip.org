require 'digest/md5'
require 'yaml'

module WebSite
    
  config = YAML.load_file("config/config.yaml")
  IMAGE_HASH = Digest::MD5.hexdigest(config["config"]["email"])
  IMAGE_SIZE = config["config"]["size"]
  IMAGE_URL = "http://www.gravatar.com/avatar/#{IMAGE_HASH}?s=#{IMAGE_SIZE}" 

  def self.img_url
  	IMAGE_URL
  end
 
end
