json.array!(@users) do |user|
  json.extract! user, :name, :uid, :rfid
  json.url user_url(user, format: :json)
end
