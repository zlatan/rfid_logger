class User < ActiveRecord::Base
	has_many :events

	def entrance(time)
		if events.where(:created_at => time.beginning_of_day..time.end_of_day).first.nil? 
		then "---"
		else events.where(:created_at => time.beginning_of_day..time.end_of_day).first.created_at.localtime.strftime("%H:%M:%S")
		end
         end


	def exit(time)
		if events.where(:created_at => time.beginning_of_day..time.end_of_day).last.nil? 
		then "---"
		else 
			if ( events.where(:created_at => time.beginning_of_day..time.end_of_day).first.created_at.localtime == events.where(:created_at => time.beginning_of_day..time.end_of_day).last.created_at.localtime )
			then "---"
			else events.where(:created_at => time.beginning_of_day..time.end_of_day).last.created_at.localtime.strftime("%H:%M:%S")
			end
		end
         end
end
