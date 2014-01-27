json.array!(@profiles) do |profile|
  json.extract! profile, :id, :name, :education, :profile_pic, :about, :manifesto, :pid, :user_id, :constituency_id
  json.url profile_url(profile, format: :json)
end
