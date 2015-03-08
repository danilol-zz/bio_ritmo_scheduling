json.array!(@schedulings) do |scheduling|
  json.extract! scheduling, :id, :room_id, :user_id, :time
  json.url scheduling_url(scheduling, format: :json)
end
