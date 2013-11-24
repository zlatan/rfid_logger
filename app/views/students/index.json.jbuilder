json.array!(@ustudents) do |student|
  json.extract! student, :name, :uid, :rfid
  json.url student_url(student, format: :json)
end
