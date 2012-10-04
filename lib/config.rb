require 'digest/md5'
require 'yaml'

config = YAML.load_file("config.yaml")
email_address = config["config"]["email"]
hash = Digest::MD5.hexdigest(email_address)
size = config["config"]["size"]
IMAGE_URL = "http://www.gravatar.com/avatar/#{hash}?s=#{size}"