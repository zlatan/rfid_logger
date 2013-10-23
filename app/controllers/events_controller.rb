class EventsController < ApplicationController

	def index
	user = User.find_by_rfid(params[:rfid])
		if user.nil?	
			Unmapped.create(rfid: params[:rfid])
<<<<<<< HEAD
			@res = 0
	   	else 
			Event.create(user_id: user.id)
			@res = 137
			@name = user.name
=======
			 @res = 0
	   	else 
			Event.create(user_id: user.id)
			@res = 137
>>>>>>> f75c633f0a520c886245ab14182b64d2951b9e17
		end
	end

	private

	def event_params
        params.require(:event).permit(:user_id)
        end

end
