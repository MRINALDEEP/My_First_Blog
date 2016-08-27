module ApplicationHelper
  def gravatar_for(user,option={size:90})
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size= option[:size]
    gravatar_url="http://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url,class:"img-circle")
  end
end
