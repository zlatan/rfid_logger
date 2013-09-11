# encoding: utf-8

class ReportPdf < Prawn::Document

  def initialize(users, uid_name, sdate)
        super(top_margin: 20)
	@users = users
	@sdate = sdate
        #font "app/assets/fonts/heinrichscript.ttf"
	font "app/assets/fonts/urw-bookman-l-light.ttf"
        text "Справка за #{@sdate.strftime("%e %B %Y година:")}" , size: 20
	text "(Съставена на #{DateTime.now.strftime("%e %B %Y година, %H часа и %M минути)")}" , 	 size: 10
	stroke_horizontal_rule	
        font_size 14
	move_down 10
	if uid_name == "GPNE" then text "Гимназия с преподаване на немски език \"Гьоте\" " end
	if uid_name == "GPAE" then text "Гимназия с преподаване на английски език  \"Гео Милев\" " end
	line_items
	number_pages "<page> от <total>", { :start_count_at => 0, 
				:page_filter => :all, :at => [bounds.right - 50, 0], 
				:align => :right, :size => 14 }
	end

  def line_items
	move_down 30
	table line_item_rows do
	row(0).align = :center	
	column(0).font = "app/assets/fonts/heinrichscript.ttf"
        column(0).size = 16
        row(0).size = 14
	row(0).font = "app/assets/fonts/urw-bookman-l-light.ttf"
	#row(1).text_color = "FF0000"
	end
  end
        
 def line_item_rows
	r= []
	head = ["Име", "Код", "RFID" ,"Вход","Изход"]
        r.push head 

	@users.each do |user|
	r.push  [ "#{user.name}" ,"#{user.uid}","#{user.rfid}", 
		  "#{user.entrance(@sdate)}" , "#{user.exit(@sdate)}"]
	       end

	return r
  end


end
