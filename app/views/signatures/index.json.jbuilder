json.array!(@signatures) do |signature|
  json.extract! signature, :id, :user_id, :problem_id
  json.url signature_url(signature, format: :json)
end
