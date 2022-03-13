# frozen_string_literal: true

# Application Helper
module ApplicationHelper
  def gravatar_for(user, options = { size: 80 })
    email_address = user.email.downcase
    email_hash = Digest::MD5.hexdigest(email_address)
    size = options[:size]
    image_src = "https://www.gravatar.com/avatar/#{email_hash}?s=#{size}"
    image_tag(image_src, alt: user.username, class: 'rounded shadow d-block mx-auto')
  end
end
