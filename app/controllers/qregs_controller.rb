class QregsController < ApplicationController

	def index
	
        student = Student.find_by_qrcode(params[:qrcode])
                if student.nil?
                        Unmappedstudent.create(qrcode: params[:qrcode])
                        @res = 0
                else
                        Qreg.create(student_id: student.id)
                        @res = 137
                        @name = student.name
                end
        end
	
	private

	def qreg_params
        params.require(:qreg).permit(:student_id)
        end

end