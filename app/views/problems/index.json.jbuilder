json.array!(@problems) do |problem|
  json.extract! problem, :id, :cid, :category, :resolved, :user_id_posted, :user_id_resolved, :rating, :resolution
  json.url problem_url(problem, format: :json)
end
