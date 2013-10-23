user = User.find_by_rfid("123e456f789")
Event.create(user_id: user.id, created_at: "2011-10-19 07:33:17 +0300")
user = User.find_by_rfid("23fadsfvfvevb")
Event.create(user_id: user.id, created_at: "2015-10-19 07:33:17 +0300")
