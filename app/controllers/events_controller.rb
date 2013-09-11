class EventsController < ApplicationController

	def index
	user = User.find_by_rfid(params[:rfid])
		if user.nil?	
			Unmapped.create(rfid: params[:rfid])
	   	else 
			Event.create(user_id: user.id)
		end
	end

	private

	def event_params
        params.require(:event).permit(:user_id)
        end

end
