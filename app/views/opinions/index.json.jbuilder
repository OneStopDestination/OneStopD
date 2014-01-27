json.array!(@opinions) do |opinion|
  json.extract! opinion, :id, :opinion, :pid
  json.url opinion_url(opinion, format: :json)
end
