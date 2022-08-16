module ApplicationHelper

  def gravitar_for(user, options = { size: 80})
    email_address = user.email.downcase
    hash = Digest::MD5.hexdigest(email_address)
    size = options[:size]
    gravitar_url = "https://www.gravatar.com/avatar/#{hash}?s=#{size}"
    image_tag(gravitar_url, alt: user.username, class: "rounded shadow mx-auto d-block")
  end

end
