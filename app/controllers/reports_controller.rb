class ReportsController < ApplicationController

	  def index
          @users = User.all
	  @users = User.where('uid like? ', "#{params[:uid]}%" ) if params[:uid]
	
          if params[:event_start_date].nil? 
		then sdate = Date.today 
		else sdate = Date.new(params[:event_start_date]["(1i)"].to_i,params[:event_start_date]["(2i)"].to_i,params[:event_start_date]["(3i)"].to_i) end

	  uid_name = "#{params[:uid]}"
	  	respond_to do |format|
	  		format.html
	  		format.pdf do
			pdf= ReportPdf.new(@users, uid_name, sdate)
			send_data pdf.render, 
			filename: "report_#{DateTime.now.strftime("%Y_%m_%e-%H_%M")}.pdf" ,
 			type: "application/pdf", disposition: "inline"
	  		end
	  	end
          end

	
end


