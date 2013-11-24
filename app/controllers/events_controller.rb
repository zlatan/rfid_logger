class EventsController < ApplicationController

	def index
	
	student = Student.find_by_rfid(params[:rfid])
                if student.nil?
                        Unmapped.create(rfid: params[:rfid])
                        @res = 0
                else
                        Event.create(user_id: student.id)
                        @res = 137
                        @name = student.name
                end
        end
	
	private

	def event_params
        params.require(:event).permit(:user_id)
        end

end