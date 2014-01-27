json.array!(@stats) do |stat|
  json.extract! stat, :id, :data, :time
  json.url stat_url(stat, format: :json)
end
