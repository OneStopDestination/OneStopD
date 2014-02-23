module UsersHelper
  def gravatar_for(profile, size)
    #  gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    # gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag("/assets/"+profile.id.to_s + ".jpg", :alt => profile.name, :class => "gravatar", height: '200', width: '250' )
  end

  def find_user_by_id(uid)
    return User.find(id=uid).name
  end

  def has_resolve_permissions(uid)
    return !Profile.find_by_user_id(uid).nil?
    cid = Constituency.find_by_name(cname)
    Profile.find_by_constituency_id_and_user_id(constituency_id=cid,user_id=uid)
  end

  def profile_for_user(cuser)
    return Profile.find_by_user_id(cuser.id)
  end
end