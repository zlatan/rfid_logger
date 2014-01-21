class EventsController < ApplicationController

	def index

        user = User.find_by_rfid(params[:rfid])
                if user.nil?        
                        Unmapped.create(rfid: params[:rfid])
                        @res = 0
                 else
                        Event.create(user_id: user.id)
                        @res = 137
                        @name = user.name
                end
        end
	
	private

	def event_params
        params.require(:event).permit(:user_id)
        end

end
