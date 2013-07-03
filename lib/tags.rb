
module WebSite
  module Tags
  
    def image_link(link, logo, alt)
      "<a href=#{link}><img src=#{logo} alt=#{alt} /></a>"
    end
  
  end
end
