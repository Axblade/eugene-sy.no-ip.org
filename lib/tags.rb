module Tags

  def image_link(link, logo, alt)
    link = "<a href=#{link}><img src=#{logo} alt=#{alt} /></a>"
  end

end