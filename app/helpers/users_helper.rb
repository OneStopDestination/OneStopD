module UsersHelper
  def gravatar_for(profile, size)
    #  gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    # gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag("/assets/"+profile.id.to_s + ".jpg", :alt => profile.name, :class => "gravatar", :size => size.to_s + "x" +size.to_s)
  end

  def find_user_by_id(uid)
    return User.find(id=uid).name
  end

  def has_resolve_permissions(uid)
    !Profile.find_all_by_user_id(uid).nil?
  end
end