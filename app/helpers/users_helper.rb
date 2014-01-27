module UsersHelper
  def gravatar_for(profile, size)
    #  gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    # gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag("/assets/"+profile.id.to_s + ".jpg", :alt => profile.name, :class => "gravatar", :size => size.to_s + "x" +size.to_s)
  end
end