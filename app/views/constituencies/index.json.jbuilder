json.array!(@constituencies) do |constituency|
  json.extract! constituency, :id, :name, :cid, :current_MLA
  json.url constituency_url(constituency, format: :json)
end
